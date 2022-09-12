import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_now/dialog.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseNavigator{
  void showLoadingDialog({String title = 'Loading ...'});
  void hideLoadingDialog();
  void showMessageDialog({DialogType dialogType,String desc,void Function() function});
}

class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier{
 late Nav navigator;
}

abstract class BaseState<T extends StatefulWidget,VM extends BaseViewModel> extends State<T> implements BaseNavigator{
 late VM viewModel;
  @override
  void initState() {
    viewModel = initViewModel();
    viewModel.navigator =this;
    super.initState();
  }
  VM initViewModel();

 @override
  void showLoadingDialog({String title = 'Loading ...'}) {
    // TODO: implement showLoadingDialog
   showLoading(context, title,isCancelable: false);
  }
  @override
  void hideLoadingDialog() {
    // TODO: implement hideLoadingDialog
    hideLoading(context);
  }
  @override
  void showMessageDialog({DialogType? dialogType,String? desc,void Function()? function}) {
    // TODO: implement showMessageDialog
    showMessage(context, dialogType: dialogType!, desc: desc!,btnOkOnPress: function);
  }
}


