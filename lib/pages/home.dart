import 'package:flutter/material.dart';

import '../dtos/post.dart';
import '../util/bubble_Story.dart';
import '../util/user_posts.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});
  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<Post> people = [];

  @override
  void initState() {
    people.add(Post(name: "elton", liked: false));
    people.add(Post(name: "marcos", liked: false));
    people.add(Post(name: "pamila", liked: false));
    people.add(Post(name: "edith", liked: false));
    people.add(Post(name: "cubana", liked: false));
    people.add(Post(name: "marcos", liked: false));

    super.initState();
  }

  void likePost(int index) {
    setState(() {
      people[index].liked = !people[index].liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Instagram", style: TextStyle(color: Colors.black)),
            Row(
              children: const [
                Icon(Icons.add),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite),
                ),
                Icon(Icons.share),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //STORIES
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: people.length,
              itemBuilder: (context, index) {
                return BubbleStories(text: people[index].name);
              },
            ),
          ),
          //POSTS
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                return UserPosts(
                  name: people[index].name,
                  liked: people[index].liked,
                  likeFunction: () => likePost(index),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
