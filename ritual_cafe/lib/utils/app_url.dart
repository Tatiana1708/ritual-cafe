class AppUrl {
  static const String liveBaseURL =
      "https://dashboard.mystore.lamater.net/api/2021-05";

  static const String baseURL = liveBaseURL;
  static const String login = baseURL + "/clients/login";
  static const String register = baseURL + "/clients/register";
  static const String product = baseURL + "/companies/430/collections";
  static const String forgotPassword = baseURL + "/forgot-password";
}
