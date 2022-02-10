import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({ Key? key }) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16,
      ),
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
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Usermane',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(
                          text: ' some description to insert',
                        ),
                      ]
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '11/02/2022',style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.favorite,size: 16,),
                  ),
                ],
              ),
              ),
          ),
        ],
      ),
    );
  }
}