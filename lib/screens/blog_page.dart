import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instagram_ui/data/data.dart';
import 'package:instagram_ui/screens/message_page.dart';

class BlogPage extends StatelessWidget {
  int? _kelganIndex;
  BlogPage(this._kelganIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          Data.username[_kelganIndex!],
        ),
        actions: [
          _bottomSheet(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            SizedBox(
              width: 400.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage(
                      Data.image_avatar[_kelganIndex!],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Data.posts[_kelganIndex!].toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: "\nPosts",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Data.followers[_kelganIndex!].toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: "\nFollowers",
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Random().nextInt(15).toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: "\nFollowing",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 150.0),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      fixedSize: const Size(
                        160.0,
                        30.0,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Follow",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      fixedSize: const Size(
                        160.0,
                        30.0,
                      ),
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DirectPage(_kelganIndex),
                        ),
                      );
                    },
                    child: const Text(
                      "Message",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: const EdgeInsets.all(5.0),
                      minimumSize: const Size(
                        35.0,
                        33.0,
                      ),
                      fixedSize: const Size(
                        35.0,
                        33.0,
                      ),
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {},
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              height: 500.0,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 150.0,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) => SizedBox(
                  child: Image(
                    image: NetworkImage(
                      "https://source.unsplash.com/random/$index",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _bottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).showBottomSheet(
          (context) => const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Report...\n\nBlock\n\nAbout This Account\n\nRestrict\n\nHide your story\n\nCopy Profile URL\n\nShare this profile\n",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.grey[700],
          constraints: const BoxConstraints(
            maxHeight: 350.0,
            minWidth: double.infinity,
          ),
        );
      },
      icon: const Icon(
        Icons.more_vert,
      ),
    );
  }
}
