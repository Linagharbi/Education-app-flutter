import 'package:education_app/src/models/student/student.dart';
import 'package:education_app/src/providers/children.dart';
import 'package:education_app/src/providers/logged_user.dart';
import 'package:education_app/src/screens/bloc_navigation/navigation_bloc.dart';
import 'package:education_app/src/utils/choose_menu.dart';
import 'package:education_app/src/utils/home_menus.dart';
import 'package:education_app/src/widgets/item_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget with NavigationStates {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MenuChoice _menuChoice = MenuChoice();
  Future<List<Student>> _futureChildren;

  @override
  void initState() {
    super.initState();
    LoggedUser loggedUser = Provider.of<LoggedUser>(context, listen: false);
    Children myChildren = Provider.of<Children>(context, listen: false);

    // Build the children list and UI from future
    _futureChildren = myChildren.getTheChildren(loggedUser.info.id);
  }

  // On menu Item click
  void changeView(BuildContext context, {int itemId}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _menuChoice.getWidget(itemId),
      ),
    );
  }

  // Build the GridView
  Widget _buildGridView(List<Map<String, Object>> currentList) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
          children: currentList
              .map(
                (item) => ItemIcon(
                  label: item['title'],
                  icon: AssetImage(item['iconPath']),
                  changeView: changeView,
                  itemId: item['itemId'],
                ),
              )
              .toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<LoggedUser>(context, listen: false);
    Children myChildren = Provider.of<Children>(context, listen: false);

    List<Map<String, Object>> currentList;
    HomeMenus menus = HomeMenus();

    // Pick a list depending on the nature of the user
    switch (loggedUser.info.nature) {
      case "eleve":
        currentList = menus.student;
        break;
      case "parent":
        currentList = menus.parent;
        break;
      case "enseignant":
        currentList = menus.teacher;
        break;
    }

    return Scaffold(
      backgroundColor: Color(0xFF0f2447),
      body: Container(
        // padding: EdgeInsets.only(left: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.36,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ise.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: (loggedUser.info.nature == "parent")
                    ? FutureBuilder(
                        // Construct the children provider list from api if parent only
                        future: _futureChildren,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            myChildren.setChildren(snapshot.data);
                            return _buildGridView(currentList);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    : _buildGridView(currentList),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
