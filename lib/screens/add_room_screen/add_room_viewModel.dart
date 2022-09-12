import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_now/base/base_viewModel.dart';
import 'package:chat_now/database/database.dart';
import 'package:chat_now/models/room_model.dart';

abstract class AddRoomNavigator extends BaseNavigator{

  void navigatorPop();
}

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator>{

  newRoom(String name,String desc,String idRoom)async{
    navigator.showLoadingDialog();
    try{
      RoomModel newRoom = RoomModel(
        name: name,
        desc: desc,
        idRoom: idRoom,
      );
      var insertDataRoom = await Database.insertDataRoom(newRoom);
      navigator.hideLoadingDialog();
      navigator.showMessageDialog(dialogType: DialogType.SUCCES,desc:'Room Created Successfully',function:(){
        navigator.navigatorPop();
      });
    }catch(e){
      navigator.hideLoadingDialog();
      navigator.showMessageDialog(dialogType: DialogType.ERROR,desc:'Something Went Wrong',function:(){});
    }

  }

}