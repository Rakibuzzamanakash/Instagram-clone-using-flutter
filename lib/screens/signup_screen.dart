import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController ();
  final TextEditingController _emailController = TextEditingController ();
  final TextEditingController _passwordController = TextEditingController ();
  final TextEditingController _bioController = TextEditingController ();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }
  void selectImage() async{
   Uint8List im = await pickImage(ImageSource.gallery);
   setState(() {
     _image = im ;
   });
  }
  void signUpUser()async{
     setState(() {
       _isLoading = true;
     });
          String res = await  AuthMethods().signUpUser(
          email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text,
          bio: _bioController.text,
          file:_image!); 

        if(res != 'success'){
          showSnackBar(context,res);
        }
        setState(() {
          _isLoading = false;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            //  Flexible(
            //    child: Container(),
            //    flex: 2, 
            //  ),
            SizedBox(
              height: 40,
            ),
             SvgPicture.asset(
               'assets/ic_instagram.svg',
               color: primaryColor,
               height: 64,
             ),
             SizedBox(
              height: 20,
            ),
             Stack(
               children: [
                 _image!=null
                 ?CircleAvatar(
                   radius: 64,
                   backgroundImage: MemoryImage(_image!),
                   )
                : const CircleAvatar(
                   radius: 64,
                   backgroundImage: NetworkImage(
                     'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg'
                   ),
                   backgroundColor: Colors.red,
                 ),
                 Positioned(
                   bottom: -10,
                   left: 80,
                   child: IconButton(
                       onPressed: selectImage,
                       icon: Icon(Icons.add_a_photo),
                       iconSize: 35,
                   )
                   ),
               ],
             ),
             const SizedBox(
               height: 24,
             ),
             TextFieldInput(
               textEditingController: _usernameController, 
               hintText: 'Enter your username', 
               textInputType: TextInputType.text,
               ),
             const SizedBox(
               height: 24,
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
             TextFieldInput(
               textEditingController: _bioController, 
               hintText: 'Enter your bio', 
               textInputType: TextInputType.text,
               ),
             const SizedBox(
               height: 24,
             ),
             InkWell(
               onTap: signUpUser,
               child: Container(
                 child:_isLoading ? const Center(child: CircularProgressIndicator(color: primaryColor,),): const Text(
                   'Sign up',
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
             ),
             const SizedBox(
               height: 12,
             ),
            //  Flexible(
            //    child: Container(),
            //    flex: 2,
            //  ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   child: const Text(
                     'Already have an account ?',
                   ),
                   padding: const EdgeInsets.symmetric(vertical: 8),
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context, MaterialPageRoute(builder: (context)=> const LoginScreen()),
                       );
                   },
                   child: Container(
                     child: const Text(
                       ' Login .',
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
      ),
    );
  }
}