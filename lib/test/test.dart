import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class TestPage extends StatelessWidget {
  const TestPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("You successfully logged in",style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),),
      ),
    );
  }
}