import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBv-sxQNO7dJ7a5vWmyRwzQwrUvIK6UuDI", 
      appId: "1:548434303141:web:bda53ec5b46c862c05554c", 
      messagingSenderId: "548434303141", 
      projectId: "instragram-clone-360a8",
      storageBucket: "instragram-clone-360a8.appspot.com",
      ),
   );
  }else{
    await Firebase.initializeApp();
  }
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'instagram clone',
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      //home:ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobilewScreenLayout: MobileScreenLayout()),
      home: LoginScreen(),
    );
  }
}