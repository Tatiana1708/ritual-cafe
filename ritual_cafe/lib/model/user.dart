class User {
  int userId;
  String email;
  String tel;
  String firstname;
  String surname;
  String password;
  String token;
  String renewalToken;

  User(
      {this.userId,
      this.email,
      this.tel,
      this.firstname,
      this.surname,
      this.password,
      this.token,
      this.renewalToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        email: responseData['email'],
        tel: responseData['tel'],
        firstname: responseData['firstname'],
        surname: responseData['surname'],
        password: responseData['password'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']);
  }
}
