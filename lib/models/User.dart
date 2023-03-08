class User {
  int? code;
  String? guid;
  String? firstName;
  String? lastName;
  String? patronymic;
  String? position;

  User(
      {  this.code,
        this.guid,
        this.firstName,
        this.lastName,
        this.patronymic,
        this.position
      });

  factory User.fromJson(var json) {
    return User(
      code:json['code'],
      guid: json['guid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      patronymic: json['patronymic'],
      position: json['position'],
    );
  }
}



