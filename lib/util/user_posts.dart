import 'package:flutter/material.dart';

class UserPosts extends StatelessWidget {
  final String name;
  final bool liked;
  final void Function()? likeFunction;

  // stateless widgtes allow us to pass information through props
  const UserPosts(
      {super.key,
      required this.name,
      required this.liked,
      required this.likeFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // profile photo
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[200], shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Icon(Icons.more_vert_outlined)
            ],
          ),
        ),
        // post
        Container(
          height: 300,
          color: Colors.grey[400],
        ),

        // below post
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onDoubleTap: likeFunction,
                    child: Icon(Icons.favorite,
                        color: liked == true ? Colors.red : Colors.black),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.chat_bubble_outline),
                  ),
                  Icon(Icons.share),
                ],
              ),
              const Icon(Icons.bookmark)
            ],
          ),
        ),
        // comments
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 7),
          child: Row(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: "Liked by "),
                    TextSpan(
                        text: "elton sampaio ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "and "),
                    TextSpan(
                        text: "others",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 7),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "elton sampaio",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text:
                        " Nothing was ever the same sa,sj,jsa,jas,j,js,js,ajjsa,ja,ssaaaaaaaaaaaaaaaasssssssssssssssahsakhksahkjsahkshkhskjhsk")
              ],
            ),
          ),
        )
      ],
    );
  }
}
