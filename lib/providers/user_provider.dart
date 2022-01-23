import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User get getUser => _user!;
  Future<void> refreshUser() async{
    
  }
}