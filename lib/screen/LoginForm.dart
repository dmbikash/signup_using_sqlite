import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup_using_sqlite/comm/GetTextFormField.dart';
import 'package:signup_using_sqlite/widgets/gradient_button.dart';
import 'package:signup_using_sqlite/widgets/header.dart';


import '../Model/DB_Helper.dart';
import '../widgets/header.dart';
import '../widgets/header_text.dart';

class LoginForm extends StatefulWidget {
  //const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = new GlobalKey<FormState>();

  final _conEmail = TextEditingController();
  final _conPassword1 = TextEditingController();

  var dbHelper;
  @override
  void initState(){
    super.initState();
    dbHelper = DataBaseHelper();
  }

  login() async {
    if(_formKey.currentState==null){
      print("null");
    }else{
      print("form valid");
    }

    String userEmail = _conEmail.text;
    String userPass1 = _conPassword1.text;
    print("login e achi");
    print(userEmail);
    if(_formKey.currentState!.validate()){
      print("login e achi- form validation done");
        await dbHelper.getLoginUser(userEmail,userPass1).then((userData){
           print("login hoise");
           if(userData!=null){
             Navigator.pushNamed(context, 'CarPage');
           }


        }).catchError((error){
          print("Eroor hoise login e");
          print(error);
        });

    }

  }

  //final _conUserId = TextEditingController();
  //final _conUserId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Header(),
            HeaderText("Login"),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Please Sign in to Continue",
                style: GoogleFonts.poppins(fontSize: 18,
                    color: Colors.grey[500],
                    letterSpacing: .5),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(//form er container

                padding: EdgeInsets.all(10),
                //color: Colors.teal[200],
                child: Column(

                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 30,
                      width: w,
                      //child: Text("form er container"),
                    ),
                    GetTextFormField(controller: _conEmail, hintName: 'Email',inputTextType: TextInputType.emailAddress, icon: Icons.person,suffixbutton: false),
                    SizedBox(
                      height: 30,
                      width: w,
                      //child: Text("SizedBox"),
                    ),
                    GetTextFormField(controller: _conPassword1, hintName: "Password",isObsecureText: true, icon: Icons.lock,suffixbutton: true),

                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(width: 230,),
                Container(
                  height: 100,
                  width: 150,

                  //color: Colors.lime,
                  alignment: Alignment.centerRight,

                  child: ElevatedButton(
                    onPressed: () {


                      print('Hi there..button');
                      //_submitCommand();
                      // if(_formKey.currentState!.validate()){
                      //   print("email+pass ok");
                      //
                      //
                      //   Navigator.pushNamed(context,'carPage');
                      //
                      //
                      // }else
                      // {
                      //   print("hobena");
                      // }
                      login();

                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    child: GradientButton("Login"),
                  ),
                )
              ],

            ),
            SizedBox(
              height: 45,
            ),
            Row(
              children: [
                Container(width: w*.13,),//w we 13%
                Text( "Don't Have an Account? ",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
                ),
                TextButton(
                    onPressed: (){ Navigator.pushNamed(context, "SignupForm");},
                    child: Text("Sign up",
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
    );
  }
}
