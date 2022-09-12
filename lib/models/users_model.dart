class UsersModel{
  static const String collectionName = 'users';
  String? email;
  String? fullName;
  String? username;
  String? id;

  UsersModel({this.email,this.id,this.username,this.fullName});

  UsersModel.fromJson(Map<String,dynamic> data):this(
    email: data['email'],
    fullName: data['fullName'],
    username: data['username'],
    id: data['id'],
  );

  Map<String,dynamic> toJson(){
   return {
     'email':email,
     'fullName':fullName,
     'username':username,
     'id':id
   };
  }
}