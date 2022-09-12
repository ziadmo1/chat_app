import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_now/database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../base/base_viewModel.dart';

abstract class NavigatorLogin extends BaseNavigator{
  void navigatorHome();
}

class LoginViewModel extends BaseViewModel<NavigatorLogin>{
  var auth = FirebaseAuth.instance;
  login(String email,String password)async{
    navigator.showLoadingDialog();
    try {
     final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await Database.getData(credential.user!.uid);
     navigator.hideLoadingDialog();
     navigator.navigatorHome();
    } on FirebaseAuthException catch (e) {
      navigator.hideLoadingDialog();
      navigator.showMessageDialog(dialogType: DialogType.ERROR,desc: 'Wrong emil address or password.',function: (){});
      }
  }
}