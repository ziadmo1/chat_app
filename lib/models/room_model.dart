class RoomModel{
  static const String collectionName = 'rooms';
  String? name;
  String? desc;
  String? id;
  String? idRoom;

  RoomModel({this.name,this.id,this.desc,this.idRoom});

  RoomModel.fromFireStore(Map<String,dynamic> json):this(
    id: json['id'],
    name: json['name'],
    desc: json['desc'],
    idRoom: json['idRoom'],
  );

  Map<String,dynamic> toFireStore(){
    return {
      'id' : id,
      'name' : name,
      'desc' : desc,
      'idRoom' : idRoom,
    };
  }

}