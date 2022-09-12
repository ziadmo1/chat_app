import 'package:chat_now/base/base_viewModel.dart';
import 'package:chat_now/screens/login_screen/login.dart';
import 'package:chat_now/regex.dart';
import 'package:chat_now/screens/register_screen/register_viewModel.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen,RegisterViewModel> implements NavigatorRegister {
  bool obSecureText = true;
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var fullNameController = TextEditingController();
  var usernameController = TextEditingController();
  @override
  RegisterViewModel initViewModel() {
   return viewModel = RegisterViewModel();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/background.png'))),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Create Account'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  TextFormField(
                    controller: fullNameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Full Name must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: fullNameController.text.isNotEmpty
                          ? Icon(Icons.check_circle, color: Colors.blue)
                          : Icon(Icons.cancel, color: Colors.red),
                      labelText: 'Full Name',
                    ),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  TextFormField(
                    controller: usernameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Username must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: usernameController.text.isNotEmpty
                          ? Icon(Icons.check_circle, color: Colors.blue)
                          : Icon(Icons.cancel, color: Colors.red),
                      labelText: 'Username',
                    ),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Email must not be empty';
                      } else if (!EmailRegex.emailRegex(text)) {
                        return 'Email not be valid';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: EmailRegex.emailRegex(emailController.text)
                          ? Icon(Icons.check_circle, color: Colors.blue)
                          : Icon(Icons.cancel, color: Colors.red),
                      labelText: 'Email Address',
                    ),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  TextFormField(
                    controller: passController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Password must not be empty';
                      } else if (text.length < 8) {
                        return 'Password must be over 8 digits';
                      }
                      return null;
                    },
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                obSecureText = !obSecureText;
                                setState(() {});
                              },
                              icon: Icon(obSecureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            passController.text.isNotEmpty
                                ? Icon(Icons.check_circle, color: Colors.blue)
                                : Icon(Icons.cancel, color: Colors.red),
                          ],
                        ), floatingLabelBehavior: FloatingLabelBehavior.auto
                    ),
                    obscureText: obSecureText,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      createAccount();
                    },
                    child: Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 5,
                      shadowColor: Colors.grey,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text(
                              'Create Account',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    children: [
                      Text(
                        'Do You Have Account?',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 14),
                      ),
                      SizedBox(width: size.width * 0.008),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 14, color: Color(0xFF3598DB)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  createAccount(){
    if (formKey.currentState!.validate()){
        viewModel.register(emailController.text, passController.text,usernameController.text,fullNameController.text);
    }
  }

  @override
  void navigatorLogin() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

}
