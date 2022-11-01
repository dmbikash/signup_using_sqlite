import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      //color: Colors.blue,
      height:200,
      width: w,
      alignment:Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/topbar.png"),
          fit: BoxFit.cover,
        ),
      ),

      //child: Text('Header ICon'),
    );
  }
}
