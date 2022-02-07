import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:instagram_clone/utils/colors.dart';
class PostCard extends StatelessWidget {
  const PostCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding:const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
            Container(
              padding:const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ).copyWith(
                right: 0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2021/12/15/04/48/animal-6871771__340.jpg'
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:const EdgeInsets.only(
                        left: 8
                        ) ,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("username",
                            style: TextStyle(
                              fontWeight: FontWeight.bold)
                              ,)
                          ],
                        ),
                      )
                    ),
                   IconButton(
                     onPressed: (){
                       showDialog(
                         context: context , builder: (context) => Dialog(
                            child: ListView(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shrinkWrap: true,
                              children: [
                                'Delete',
                              ].map((e) => InkWell(
                                onTap: (){},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                                  child: Text(e),
                                ),
                              ),
                              ).toList(),
                            ),
                         ),
                       );
                     },
                     icon: Icon(Icons.more_vert),
                   ), 
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.35,
              width: double.infinity,
              child: Image.network(
                'https://cdn.pixabay.com/photo/2022/01/29/11/58/dog-6977210_960_720.jpg',
                fit: BoxFit.cover,
              ),
            ),
          Row(
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  ),
              ),
              
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.comment_outlined
                  ),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.send,
                  ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.bookmark_border),
                  ),
                )
                )
            ],
          ),
          Container(
             padding: const EdgeInsets.symmetric(
               horizontal: 16,
             ),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 DefaultTextStyle(
                   style: Theme.of(context).textTheme.subtitle2!.copyWith(
                     fontWeight: FontWeight.w800,
                   ), 
                   child: Text(
                     '1231 likes',
                     style: Theme.of(context).textTheme.bodyText2,
                   ) ,
                   ),
                   Container(
                     width: double.infinity,
                     padding: const EdgeInsets.only(
                       top: 8,
                     ),
                     child: RichText(
                       text: TextSpan(
                         style: const TextStyle(
                           color: primaryColor,
                         ),
                         children: [
                           TextSpan(
                             text: 'Username',
                             style: const TextStyle(
                               fontWeight: FontWeight.bold
                             )
                           ),
                           
                           TextSpan(
                             text: ' Hey this is some description to be repleced',
                             
                           ),
                         ]
                       ),
                       ),
                   ),
                   InkWell(
                     onTap: (){},
                     child: Container(
                       padding: const EdgeInsets.symmetric(vertical: 4),
                       child: Text(
                         'View all 200 comments',
                         style: const TextStyle(
                           fontSize: 16,
                           color: secondaryColor),
                       ),
                     ),
                   ), 
                   Container(
                       padding: const EdgeInsets.symmetric(vertical: 4),
                       child: Text(
                         '07/02/2022',
                         style: const TextStyle(
                           fontSize: 16,
                           color: secondaryColor),
                       ),
                     ),
               ],
             ),
          ),
      ],
      ),
    );
  }
}