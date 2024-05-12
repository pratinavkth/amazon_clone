import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/material.dart';

enum Auth { 
  Signin, 
  Signup,
   }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() =>_AuthScreenState();
}
  class _AuthScreenState extends State<AuthScreen> {
    Auth _auth = Auth.Signup;
    final _signupFormKey = GlobalKey<FormState>();
    final _signinFormKey = GlobalKey<FormState>();

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text('Welcome to Amazon',
              style:TextStyle(
                fontSize:25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )
              ),
               ListTile(
                tileColor: _auth == Auth.Signup ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundCOlor,
                title:const  Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value:Auth.Signup,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
               ),
               if(_auth == Auth.Signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signupFormKey,
                    child:Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                          ),
                          const SizedBox(height: 10,),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          ),
                          const SizedBox(height: 10,),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          // suffixIcon: 
                          ),
                          const SizedBox(height: 10,),
                          CustomButton(
                            text: 'Sign Up', 
                            onTap: (){

                          },
                          ),

                      ],
                      ),
                  ),
                ),

              //  signin
              ListTile(
                tileColor: _auth == Auth.Signin ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundCOlor,
                title:const  Text(
                  'Sign In.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value:Auth.Signin,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
               ),
               if(_auth == Auth.Signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signinFormKey,
                    child:Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          ),
                          const SizedBox(height: 10,),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          // suffixIcon: 
                          ),
                          const SizedBox(height: 10,),
                          CustomButton(
                            text: 'Sign In', 
                            onTap: (){

                          },
                          ),

                      ],
                      ),
                  ),
                ),
            ],
          ),
        ),
        ),
    );
        
  }
  }

