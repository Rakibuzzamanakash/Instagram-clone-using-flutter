import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({ Key? key }) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child:IconButton(
    //     onPressed: (){}, 
    //     icon: Icon(Icons.upload)
    //     ) ,
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.arrow_back)
          ),
          title: const Text('Post to'),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: (){}, 
              child: const Text('Post',style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
               ),
          ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CircleAvatar(
                 backgroundImage: NetworkImage(
                   'https://cdn.pixabay.com/photo/2022/01/21/07/21/ring-tailed-lemur-6954076__340.jpg'
                 ),
               ),
               SizedBox(
                 width: MediaQuery.of(context).size.width *0.4,
                 child: TextField(
                   decoration: const InputDecoration(
                     hintText: 'Write a caption....',
                     border: InputBorder.none
                   ),
                   maxLines: 8,
                 ),
               ),
               SizedBox(
                 height: 45,
                 width: 45,
                 child: AspectRatio(
                   aspectRatio: 486/451,
                   child: Container(
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: NetworkImage(
                           'https://cdn.pixabay.com/photo/2022/01/21/07/21/ring-tailed-lemur-6954076__340.jpg'
                           ),
                           fit: BoxFit.fill,
                           alignment: FractionalOffset.topCenter,
                         ),
                     ),
                   ),
                   ),
               ),
            ],
          ),
        ],
      ) ,
    );
  }
}