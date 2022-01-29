// import 'package:js/js.dart';
// import "dart:html"; 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'instagram clone',
        theme:ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        //home:,
       home: StreamBuilder(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context,snapshot){
           if(snapshot.connectionState == ConnectionState.active){
             if(snapshot.hasData){
               return const ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(), 
                  mobilewScreenLayout: MobileScreenLayout()
                  );
             }else if(snapshot.hasError){
               return Center(
                 child: Text('${snapshot.error}'),
               );
             }
           }
           if(snapshot.connectionState == ConnectionState.waiting){
             return const Center(
               child: CircularProgressIndicator(
                 color: primaryColor,
               ),
             );
           }
           return const LoginScreen();
         },
         
         ),
      ),
    );
  }
}
