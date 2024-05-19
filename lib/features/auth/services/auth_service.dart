import 'dart:convert';
import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService{

  void SignUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async{
    try{
      User user = User(
        name: name,
        email: email, 
        password: password, 
        id: '', 
        address: '', 
        type: '', 
        token: '',
      );

      http.Response res= await http.post(Uri.parse('$uri/api/signup'),
       body: user.toJson(),
       headers:<String,String>{
        'Content-Type':'application/json; charset=UTF-8',
       },
       );
       
       httpErrorHandle(
         response: res,
         context: context,
         onSuceess: (){
          showSnackBar(context, 'User Created Successfully !! Sign In to Continue');
         },
       );
    } catch(e){
      showSnackBar(context, e.toString());
    }
  }

  void SigninUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async{
    try{
      User user = User(
        email: email,
        password: password,
        name: '',
        id: '',
        address: '',
        type: '',
        token: '',

      );

      http.Response res= await http.post(Uri.parse('$uri/api/signin'),
       body: user.toJson(),
       headers:<String,String>{
        'Content-Type':'application/json; charset=UTF-8',
       },
       );
       httpErrorHandle(
         response: res,
         context: context,
         onSuceess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context,listen: false).setUSer(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context, 
            BottomBar.routeName, 
            (route) => false,
            );
          },
       );
    } catch(e){
      showSnackBar(context, e.toString());
    }
  }
  void getUserData(
    BuildContext context,
  ) async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if(token==null){
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
      headers:<String, String>{
        'Content-Type':'application/json; charset=UTF-8',
        'x-auth-token': token!,
      },
      );

      var response =jsonDecode(tokenRes.body);

      if(response==true){
        // await 
       http.Response useRes = await http.get(Uri.parse('$uri/'),
        headers:<String,String>{
          'Content-Type':'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
       );
        var userProvider = Provider.of<UserProvider>(context,listen:false);
        userProvider.setUSer(useRes.body);
      }
    } 
    catch(e){
      showSnackBar(context, e.toString());
    }
  }
}