import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  late String text;
  HeaderText(text){
     this.text=text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(left: 20, right: 20),
      child: Text(
        "$text",
        style: GoogleFonts.poppins(fontSize: 29,
            fontWeight: FontWeight.w700,
            letterSpacing: .01),
      ),
    );
  }
}
