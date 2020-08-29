import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "All",
  icon: Icons.search,
);

final eventsCategory = Category(
  categoryId: 1,
  name: "Events",
  icon: Icons.event,
);

final clubsCategory = Category(
  categoryId: 2,
  name: "Clubs",
  icon: Icons.audiotrack,
);

final categories = [
  allCategory,
  eventsCategory,
  clubsCategory,
];
