import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_now/base/base_viewModel.dart';
import 'package:chat_now/regex.dart';
import 'package:chat_now/screens/home_screen/home_screen.dart';
import 'package:chat_now/screens/register_screen/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dialog.dart';
import 'login_viewModel.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool obSecureText = true;
var formKey = GlobalKey<FormState>();
var emailController = TextEditingController();
var passController = TextEditingController();
class _LoginScreenState extends BaseState<LoginScreen,LoginViewModel> implements NavigatorLogin {

  @override
  LoginViewModel initViewModel() {

     return viewModel = LoginViewModel();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background.png'))),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
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
                      height: size.height * 0.3,
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
                        labelText: 'Email Address',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              obSecureText = !obSecureText;
                              setState(() {});
                            },
                            icon: Icon(obSecureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      obscureText: obSecureText,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        loginAccount();
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
                              color: Color(0xFF3598DB),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text(
                                'Login',
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
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
                          'Don\'t You Have Account?',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 14),
                        ),
                        SizedBox(width: size.width * 0.008),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: Text(
                            'Create Account',
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
      ),
    );
  }
  loginAccount(){
    if(formKey.currentState!.validate()) {
      viewModel.login(emailController.text, passController.text);
    }
  }
  @override
  void navigatorHome() {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

}
