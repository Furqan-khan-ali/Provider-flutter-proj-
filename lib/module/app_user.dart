class AppUser{
  String? message;
  int? statusCode;

  AppUser({this.message,this.statusCode});
  factory AppUser.fromJson(Map<String,dynamic> jsonData){
    var apUser = AppUser();
    apUser.message = jsonData['message'];
    apUser.statusCode = jsonData['statusCode'];
    return apUser;
  }
}