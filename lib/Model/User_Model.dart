class UserModel{
  late String userName;
  late String userEmail;
  late String userPass;
  //String userPass2;
UserModel(this.userName,this.userPass,this.userEmail);

Map<String, dynamic> tomap(){
  var map = <String, dynamic>{
    'userEmail' : userEmail,
    'userName' : userName,
    'userPass1' : userPass,

  };
  return map;
}
  UserModel.fromMap(Map<String, dynamic> map){
    userEmail = "userEmail";
    userPass = "UserPass1";
    userName = "userName";
  }

}