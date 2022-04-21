
import 'package:flutter/material.dart';
import 'package:instagram_ui/data/data.dart';
import 'package:instagram_ui/screens/blog_page.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<bool> _isFollow = List.generate(Data.username.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 28.0,
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          "Discover people",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemExtent: 70.0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              
              Data.username[index],
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.white,overflow: TextOverflow.ellipsis,
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                Data.image_avatar[index],
              ),
              radius: 30.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogPage(index),
                ),
              );
            },
            trailing: _isFollow[index]
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _isFollow[index] = false;
                        },
                      );
                    },
                    child: const Text(
                      "Following",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                : SizedBox(
                    width: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                _isFollow[index] = true;
                              },
                            );
                          },
                          child: const Text(
                            "Follow",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.grey[300],
                          size: 16.0,
                        ),
                      ],
                    ),
                  ),
          );
        },
        itemCount: Data.username.length,
      ),
    );
  }
}
