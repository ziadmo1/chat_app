import 'package:chat_now/models/room_model.dart';
import 'package:chat_now/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database{

  static CollectionReference<UsersModel> getCollectionRef(){
   return FirebaseFirestore.instance.collection(UsersModel.collectionName).withConverter<UsersModel>(
        fromFirestore: (snapshot, options) => UsersModel.fromJson(snapshot.data()!),
        toFirestore: (user, options) => user.toJson(),
    );
  }

  static Future<void> insertData(UsersModel user)async{
    var response = getCollectionRef();
    var docRef =  response.doc(user.id);
    var insertData = await docRef.set(user);
    return insertData;
  }

  static Future<DocumentSnapshot<UsersModel>> getData(String id)async{
    var response = getCollectionRef();
    var getData = await response.doc(id).get();
    return getData;
  }

  static CollectionReference<RoomModel> getCollectionRefRoom(){
    return FirebaseFirestore.instance.collection(RoomModel.collectionName).withConverter(
        fromFirestore: (room, options) => RoomModel.fromFireStore(room.data()!),
        toFirestore: (room, options) => room.toFireStore(),);
  }

  static Future<void> insertDataRoom(RoomModel room)async{
    var reference = getCollectionRefRoom();
    var docRef = getCollectionRefRoom().doc();
    room.id = docRef.id;
    var res = await docRef.set(room);
    return res;
  }

}