
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({ Key? key }) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
         child: Container(
           height: kToolbarHeight,
           margin: EdgeInsets.only(
             bottom: MediaQuery.of(context).viewInsets.bottom
           ),
           padding: const EdgeInsets.only(left: 16, right: 8),
           child: Row(
             children: [
               CircleAvatar(
                 backgroundImage: NetworkImage(
                   'https://cdn.pixabay.com/photo/2022/01/28/21/10/honeybee-6975865__340.jpg'
                 ),
                 radius: 18,
               ),
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.only(left: 16,right: 8),
                   child: TextField(
                     decoration: InputDecoration(
                       hintText: 'Comment as Username',
                       border: InputBorder.none,
                     ),
                   ),
                   )
                 ),
                 InkWell(
                   onTap: (){},
                   child: Container(
                     padding: const EdgeInsets.symmetric(
                       vertical: 8,
                       horizontal: 8,
                     ),
                     child: const Text(
                       'post',style: TextStyle(
                         color: blueColor
                       ),
                     ),
                   ),
                 ), 
             ],
           ),
         ),
      ),
    );
  }
}