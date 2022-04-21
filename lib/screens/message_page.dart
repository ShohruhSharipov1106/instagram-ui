import 'package:flutter/material.dart';
import 'package:instagram_ui/data/data.dart';

class DirectPage extends StatelessWidget {
  int? _messageIndex;
  DirectPage(this._messageIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 32.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 130.0,
        centerTitle: false,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 32.0,
              ),
            ),
            const SizedBox(width: 10.0),
            CircleAvatar(
              backgroundImage: AssetImage(
                Data.image_avatar[_messageIndex!],
              ),
              radius: 20.0,
            ),
          ],
        ),
        title: Text(
          Data.username[_messageIndex!],
        ),
        actions: const [
          Icon(
            Icons.phone_outlined,
          ),
          Icon(
            Icons.videocam_outlined,
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            CircleAvatar(
              backgroundImage: AssetImage(
                Data.image_avatar[_messageIndex!],
              ),
              radius: 50.0,
            ),
            Text(
              Data.username[_messageIndex!],
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Data.username[_messageIndex!],
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5.0),
                const Icon(
                  Icons.circle,
                  size: 3.0,
                  color: Colors.white,
                ),
                const SizedBox(width: 5.0),
                const Text(
                  "Instagram",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Data.followers[_messageIndex!],
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 5.0),
                const Text(
                  "followers",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 5.0),
                const Icon(
                  Icons.circle,
                  size: 3.0,
                  color: Colors.grey,
                ),
                const SizedBox(width: 5.0),
                Text(
                  Data.posts[_messageIndex!].toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 5.0),
                const Text(
                  "posts",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                fixedSize: const Size(
                  150.0,
                  20.0,
                ),
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DirectPage(_messageIndex),
                  ),
                );
              },
              child: const Text(
                "View Profile",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 400.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800],
                shape: const StadiumBorder(),
                fixedSize: const Size(
                  380.0,
                  50.0,
                ),
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.camera_alt),
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Message...",
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.mic_none,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Icon(
                    Icons.image_outlined,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Icon(
                    Icons.sticky_note_2_outlined,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
