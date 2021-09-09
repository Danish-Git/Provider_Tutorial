import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider_tutorial/domain/SignUpResponce.dart';
import 'package:provider_tutorial/domain/users.dart';
import 'package:provider_tutorial/util/AppUrl.dart';
import 'package:provider_tutorial/util/shared_preference.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  notify(){
    notifyListeners();
  }

  ////////    Register

  Future<Map<String, dynamic>> register(String email, String password) async {
    final Map<String, dynamic> apiBodyData = {
      'email': email,
      'password': password,
      //"device_token" : "fofuj4KjXEm9hbIE_es7qT:APA91bEQ64QX2KDBo2LWg_7SInqVLsl-qYzmR1Q4qE6KB3w19nlWbhfzAw-dDqlYq16RjN1Pqt2Y770GT-c6qvEnyovWwgr3Lq5GqlBVmAeLeiwKrP6_v79pjIZdmwQ8v70OZJcLhclP"
    };

    return await post(
        Uri.parse(AppUrl.register),
        body: json.encode(apiBodyData),
        headers: {'Content-Type':'application/json'}
    ).then(onValue)
        .catchError(onError);
  }

  static Future<Map<String, dynamic>> onValue (Response response) async {
    var result ;

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(responseData);

    if(response.statusCode == 200){

      var userData = responseData['data'];

      // now we will create a user model
      //SignUpResponse authUser = SignUpResponse.fromJson(responseData);
      User authUser = User.fromJson(responseData);

      // now we will create shared preferences and save data
      UserPreferences().saveUser(authUser);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };

    }else{
      result = {
        'status': false,
        'message': 'Successfully registered',
        'data': responseData
      };
    }
    return result;
  }

  static onError(error){
    print('the error is ${error.detail}');
    return {
      'status': false,
      'message': 'Unsuccessful Request',
      'data': error
    };
  }

  ////////    Login

  Future<Map<String, dynamic>> login(String email, String password) async {

    var result;

    // final Map<String, dynamic> loginData = {
    //   'UserName': 'kaliakoirdeo379',
    //   'Password': 'kaliakoirdeo379@2020'
    // };
    final Map<String, dynamic> loginData = {
      'UserName': email,
      'Password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz',
        'X-ApiKey' : 'ZGlzIzEyMw=='
      },
    );

    if (response.statusCode == 200) {

      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      var userData = responseData['Content'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};

    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;

  }


}