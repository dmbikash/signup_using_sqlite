import 'package:flutter/material.dart';
import 'package:signup_using_sqlite/Model/User_Model.dart';
import 'package:signup_using_sqlite/comm/CommHelper.dart';
import 'package:signup_using_sqlite/comm/GetTextFormField.dart';
import 'package:signup_using_sqlite/widgets/gradient_button.dart';
import 'package:toast/toast.dart';
import 'package:signup_using_sqlite/widgets/header.dart';

import '../Model/DB_Helper.dart';
import '../widgets/header_text.dart';


class SignupForm extends StatefulWidget {
  //const SignupForm({Key? key}) : super(key: key);
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();

  final _conEmail = TextEditingController();
  final _conName = TextEditingController();
  final _conPassword1 = TextEditingController();
  final _conPassword2 = TextEditingController();

  var dbHelper;
  @override
  void initState(){
    super.initState();
    dbHelper = DataBaseHelper();
  }
  signUp() async {
    //print("working");
    final form = _formKey.currentState;

    String userEmail =_conEmail.text;
    String userName = _conName.text;
    String userPass1 = _conPassword1.text;
    String userpass2 = _conPassword2.text;
    //print(form);
    //print("working");

    if(form!.validate()){
      if(userPass1 != userpass2){
        //alertDialog(context, "Password Mismatch");
        print("duplicate");

      }else {
        form.save();
        UserModel userModel = UserModel(userName, userPass1, userEmail);
        print(userModel.userName);
        await dbHelper.saveData(userModel).then((userData){
              print("save hoise ");
        }).catchError((error){
            print(error);
            print("jobon manei bedona");
        });
      }
      print("Form is valid...ProceeeD");
     // print(userName);

    }
    // if(userName.isEmpty) {
    //   ToastContext().init(context);
    //   Toast.show("Please Enter your Name", duration: Toast.lengthLong, gravity:  Toast.bottom);
    //     print('no name');
    // }
    // else if(userEmail.isEmpty){
    //   //Toast.show("Please Enter your Email", duration: Toast.lengthLong, gravity:  Toast.bottom);
    //   print('no mail');
    // }else if(userPass1.isEmpty){
    //   print('no pass');
    //   //Toast.show("Please Enter a Password", duration: Toast.lengthLong, gravity:  Toast.bottom);
    // }else if(userpass2.isEmpty){
    //   print('no pass 2');
    //   //Toast.show("Please Retype your Password", duration: Toast.lengthLong, gravity:  Toast.bottom);
    // }
    // print('button working ok');
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              //SizedBox(height: 5,),
              HeaderText("Create Account"),

              Container(// full form
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(

                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 10,
                      width: w,
                      //child: Text("form er container"),
                    ),
                    GetTextFormField(controller: _conName, hintName: 'Name',inputTextType: TextInputType.name, icon: Icons.person , suffixbutton: false,),
                    SizedBox(
                      height: 10,
                      width: w,

                    ),
                    GetTextFormField(controller: _conEmail, hintName: "Email",inputTextType: TextInputType.emailAddress, icon: Icons.mail,suffixbutton: false),
                    SizedBox(
                      height: 10,
                      width: w,

                    ),
                    GetTextFormField(controller: _conPassword1, hintName: 'Password',isObsecureText: true, icon: Icons.lock,suffixbutton: false),
                    SizedBox(
                      height: 10,
                      width: w,

                    ),
                    GetTextFormField(controller: _conPassword2, hintName: 'ReType Password',isObsecureText: true, icon: Icons.lock,suffixbutton: false),
                    SizedBox(
                      height: 10,
                      width: w,
                    ),

                    ],
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Container(width: w*.50),
                    ElevatedButton(

                      onPressed: () {
                        print("yooo");
                        signUp();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: GradientButton("Signup"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(width: w*.13,),//w we 13%
                  Text( "Already have an Account? ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                    ),
                  ),
                  TextButton(
                    onPressed: (){ Navigator.pushNamed(context, "LoginForm");},
                    child: Text("Sign In",
                      style: TextStyle(
                        color: Color(0xFF15D2A7),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
