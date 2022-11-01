import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup_using_sqlite/screen/LoginForm.dart';

class GradientButton extends StatefulWidget {
  static   String msg="";
  GradientButton(String text){
    msg=text;
  }
  //const GradientButton({Key? key}) : super(key: key);


  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Ink(
      width:150,
      height: 55,
      decoration: BoxDecoration(
          gradient:

          const LinearGradient(
            //begin: Alignment.topLeft,
            //end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFFc6c96e),
              Color(0xFF8fcb7e),
              Color(0xFF39cf95),
            ],
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Text(
            '${GradientButton.msg}',
            style: GoogleFonts.ubuntu(
                fontSize: 20, fontWeight: FontWeight.bold),

          ),
          SizedBox(
            width: 5,
          ),
          Icon( // <-- Icon
            Icons.arrow_forward_outlined,
            size:25,

          ),
          SizedBox(
            width:20,
          ),
        ],
      ),
    );
  }
}
