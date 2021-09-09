import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/domain/users.dart';
import 'package:provider_tutorial/provider/UserProvider.dart';
import 'package:provider_tutorial/provider/auth_provider.dart';

import 'DashboardScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Duration get loginTime => Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {

    AuthProvider _auth = Provider.of<AuthProvider>(context);

    Future<String?> _authUser(LoginData data) {
      print('Name: ${data.name}, Password: ${data.password}');
      return Future.delayed(loginTime).then((_) {
        _auth.login(data.name, data.password).then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            print('----> Login fail');
            return 'Password does not match';
          }
        }).catchError((onError) => onError.toString());
      });
    }

    Future<String?> _registerUser(LoginData data) {
      print('Name: ${data.name}, Password: ${data.password}');
      return Future.delayed(loginTime).then((_) {

        _auth.register(data.name, data.password).then((response) {
          if(response['status']){
            User user = response['data'];
            Provider.of<UserProvider>(context,listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/dashboard');
          }else{
            print('----> Registration fail');
            return "Registration fail";
          }
        }).catchError((onError) => onError.toString());
      });
    }

    Future<String?> _recoverPassword(String name) {
      print('Name: $name');
      return Future.delayed(loginTime).then((_) {
        if (!mockUsers.containsKey(name)) {
          return 'User not exists';
        }
        return null;
      });
    }


    return Scaffold(
      body: FlutterLogin(
        title: 'ECORP',
        //logo: 'assets/images/ecorp-lightblue.png',
        onLogin: _authUser,
        onSignup: _registerUser,
        hideSignUpButton: false,
        //loginAfterSignUp: true,
        theme: LoginTheme(),
        //disableCustomPageTransformer: false,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ));
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }




}
