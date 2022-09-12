import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_now/base/base_viewModel.dart';
import 'package:chat_now/database/database.dart';
import 'package:chat_now/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../dialog.dart';

abstract class NavigatorRegister extends BaseNavigator{

  void navigatorLogin();
}

class RegisterViewModel extends BaseViewModel<NavigatorRegister>{
  var users =  FirebaseAuth.instance;
  void register(String email,String password,String username,String fullName)async{
    navigator.showLoadingDialog();
    try {
    final credential =await users.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );
    UsersModel user = UsersModel(
      email:email,
      fullName: fullName,
      username: username,
      id: credential.user?.uid
    );
   var insertedUser = await Database.insertData(user);
          navigator.hideLoadingDialog();
          navigator.showMessageDialog(dialogType: DialogType.SUCCES,
            desc: '${users.currentUser?.email} has been created.',function: (){
            navigator.navigatorLogin();
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator.hideLoadingDialog();
        navigator.showMessageDialog(dialogType: DialogType.ERROR,
            desc: 'The password provided is too weak.',function: (){});
      } else if (e.code == 'email-already-in-use') {
        navigator.hideLoadingDialog();
        navigator.showMessageDialog(dialogType: DialogType.ERROR,
            desc: 'The account already exists for that email.',function: (){});
      }
    } catch (e) {
      navigator.hideLoadingDialog();
      navigator.showMessageDialog(dialogType: DialogType.ERROR,
          desc: 'Error: $e',function: (){});
    }

  }

}