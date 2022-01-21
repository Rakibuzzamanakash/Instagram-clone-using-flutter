 import 'package:flutter/material.dart';

import 'package:instagram_clone/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
final Widget webScreenLayout;
final Widget mobilewScreenLayout;

  const ResponsiveLayout({ Key? key, required this.webScreenLayout,required this.mobilewScreenLayout }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints ){
        if(constraints.maxWidth > webScreenSize){
            return webScreenLayout;
        }
        return mobilewScreenLayout ;
        // mobile screen
      },
    );
  }
}