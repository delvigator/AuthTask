class User {
  String? code;
  String? guid;
  String? firstName;
  String? lastName;
  String? patronymic;


  User(
      {  this.code,
        this.guid,
        this.firstName,
        this.lastName,
        this.patronymic,
      });

  factory User.fromJson(var json) {
    return User(
      code:json['code'].toString(),
      guid: json['guid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      patronymic: json['patronymic'],
    );
  }
}



