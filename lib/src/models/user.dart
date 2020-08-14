class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String login;
  String password;
  String nature;

  // Constructor
  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.login,
      this.password,
      this.nature});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['PrenomFr'],
      lastName: json['NomFr'],
      email: json['Email'],
      login: json['Login'],
      password: json['Pwd'],
      nature: json['nature'],
    );
  }
}
