import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

alertDialog(BuildContext Context, String msg){
Toast.show("$msg", duration:Toast.lengthLong,);
}


validatedEmail(String email){
  final emailReg= new RegExp("");
  return emailReg.hasMatch(email);
}