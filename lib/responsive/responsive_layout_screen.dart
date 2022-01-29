 import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';

import 'package:instagram_clone/utils/global_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
final Widget webScreenLayout;
final Widget mobilewScreenLayout;

  const ResponsiveLayout({ Key? key, required this.webScreenLayout,required this.mobilewScreenLayout }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }
  addData() async{
   UserProvider _userPrivider = Provider.of(context , listen: false);
   await _userPrivider.refreshUser();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints ){
        if(constraints.maxWidth > webScreenSize){
            return widget.webScreenLayout;
        }
        return widget.mobilewScreenLayout ;
        // mobile screen
      },
    );
  }
}