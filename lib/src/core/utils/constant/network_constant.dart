// const String apiUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/";
// const String apiKey = "WiRqmPm4mBO4ssOsQL7uWDS0lJO4KviJ";

class NetworkConstant {
  NetworkConstant._();
  static const String apiUrl = "http://192.168.99.60:8000/";
  static const String apiKey = "kjfidanekwrpajflds";

  String getApiKeyPath() {
    return "?api-key=$apiKey";
  }

  String loginPath() {
    return "login";
  }
}
