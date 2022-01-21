import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController ();
  final TextEditingController _passwordController = TextEditingController ();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController;
    _passwordController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2, 
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              TextFieldInput(
                textEditingController: _emailController, 
                hintText: 'Enter your email', 
                textInputType: TextInputType.emailAddress,
                ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _passwordController, 
                hintText: 'Enter your password', 
                textInputType: TextInputType.text,
                isPass: true,
                ),
              const SizedBox(
                height: 24,
              ),
              Container(
                child: const Text(
                  'Log in',
                ),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4)
                    )
                  ),
                  color: blueColor,
                   ) ,
              
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Dont have an account ?',
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SignupScreen())
                        );
                    },
                    child: Container(
                      child: const Text(
                        ' SignUp .',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24,)
            ],
          ),
        ) ,
        ),
    );
  }
}