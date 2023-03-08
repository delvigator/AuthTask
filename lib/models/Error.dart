class Error{
  int? code;
  String? errorData;

  Error({
    this.code,
    this.errorData
});

  factory Error.fromJson(var json) {
    return Error(
      code:json['code'],
      errorData: json['errorData']
    );
  }
}