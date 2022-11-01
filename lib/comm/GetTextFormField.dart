import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup_using_sqlite/comm/CommHelper.dart';

class GetTextFormField extends StatelessWidget {
  //const GetTextFormField({Key? key}) : super(key: key);
  late TextEditingController  controller;
  late String hintName;
  late IconData icon;
  late bool isObsecureText;
  late TextInputType inputTextType ;
  bool suffixbutton = false;

  GetTextFormField({
    required this. suffixbutton,
    required this.controller,
    required this.hintName,
    required this.icon,
    this.isObsecureText = false,
    this.inputTextType = TextInputType.text,
  });




  @override
  Widget build(BuildContext context) {
    return Container(//login
      padding: EdgeInsets.symmetric(horizontal: 20),
      //margin: EdgeInsets.only(top: 20.0),
      //padding: EdgeInsets.all(10),
      child:TextFormField(
        validator: (value) {
          if(hintName=="Name"){
            if(value!.contains(new RegExp(r'[0-1]'))!){
              return "Enter a Valid Name";
            }

          }
          if(value!.length == 0) {
            return "$hintName is Required";
          }
          // if(hintName=='Email' $$ validatedEmail(value)){
          //   return "please enter a valid Email";
          // }
          if(hintName=="Password"){
            if(!RegExp(r'^(?=.*[0-9])(?=.*[A-Za-z])(?=.*[~!?@#$%^&*_-])[A-Za-z0-9~!?@#$%^&*_-]{8,40}$').hasMatch(value!)){
              return "password not valid";
            }

          }
          if(hintName=="Email"){
            if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)){
              return "email is not valid";

            }

          }
          return null;
        },
        onSaved: (value) => controller.text = value!,
        keyboardType: inputTextType,
        controller: controller,
        obscureText: isObsecureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(30.0)
          //   ),
          //   borderSide: BorderSide(color:Colors.transparent),
          // ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 5,
                  color:Color(0xFFF2F4F7),
            ),
          ),
          focusedBorder:
          OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color:Colors.transparent ),

          ),
          //hintText: hintName,
          labelText: hintName,
          labelStyle: GoogleFonts.poppins(
              fontSize: 15,
              //fontWeight: FontWeight.w700,
              letterSpacing: .9,
              color: Colors.grey[600]
          ),
          //labelStyle: TextStyle(),

          prefixIcon: Icon(Icons.person,color: Colors.grey[800]),
          suffixIcon: (suffixbutton)?suffix_button(): dummy_suffix_button(),//good job
          fillColor: Colors.transparent,
          filled: true,
        ),
      ),
    );
  }

  TextButton suffix_button() {
    return TextButton(
          onPressed: () {

          }, child: Text("FORGOT",style: TextStyle(color:Color(0xFF55DFBF) ),),

        );
  }
  TextButton dummy_suffix_button() {
    return TextButton(
      onPressed: () {

      }, child: Text("",style: TextStyle(color:Color(0xFF55DFBF) ),),

    );
  }
}
