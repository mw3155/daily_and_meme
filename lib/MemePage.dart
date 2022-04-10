import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:http/http.dart' as http;

import 'Util.dart';

class MemePage extends StatefulWidget {
  @override
  _MemePageState createState() => _MemePageState();
}

class _MemePageState extends State<MemePage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // disable going back
      onWillPop: () => Future.value(false),
      child: Scaffold(
        bottomSheet: buildBottomSheet(context),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: _buildMemePage(),
          ),
        ),
      ),
    );
  }

  String currentMemeTitle = "";
  String currentMemeImage = "";

  Widget _buildMemePage() {
    if (memeCounter == 0) getNextMeme();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              alignment: FractionalOffset.center,
              child: Text(currentMemeTitle),
            ),
            Container(
              alignment: FractionalOffset.bottomRight,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white70),
                onPressed: () {
                  setState(() {
                    isLanguageGerman ^= true;
                    memeCounter = 0;
                  });
                },
                child: Flag.fromString((isLanguageGerman ? "US" : "DE"),
                  height: 32,
                  width: 32,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
        memeCounter == 0
            ? Icon(Icons.photo)
            : Image.network(
                currentMemeImage,
                //height: 600,
                height: MediaQuery.of(context).size.height -
                    (32 + 32 + 0 + 16 + 32 + 32 + 8 + 32 + 8 + 50),
                // memetitle + padding to buttons + ... + 50 (magic number..)
                fit: BoxFit.contain,
              ),
        Padding(padding: EdgeInsets.all(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "work"),
              child: Text(
                "Ran an die Arbeit!",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getNextMeme();
              },
              child: Text(
                "Noch ein Meme!",
              ),
            ),
          ],
        )
      ],
    );
  }

  void getNextMeme() async {
    // get json from programmerhumor and decode it
    String memeSite = "www.reddit.com";
    String memeSiteEnding = isLanguageGerman ? "r/ich_iel/top.json" : "/r/ProgrammerHumor/top.json";
    final response = await http.get(Uri.https(memeSite, memeSiteEnding));

    Map<String, dynamic> memeJson = jsonDecode(response.body);

    while (true) {
      memeCounter++;
      bool isVideo = memeJson["data"]["children"][memeCounter]["data"]["is_video"];
      if (!isVideo && memeJson["data"]["children"][memeCounter]["data"]["thumbnail_height"] != null)
        break;
    }

    setState(() {
      currentMemeTitle = memeJson["data"]["children"][memeCounter]["data"]["title"];
      currentMemeImage = memeJson["data"]["children"][memeCounter]["data"]["url"];
    });

    print(currentMemeImage);
  }
}
