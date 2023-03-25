import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Util.dart';

class ScoreboardPage extends StatelessWidget {
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
            child: _buildScoreboardPage(context),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreboardPage(BuildContext context) {
    // TODO: sort persons by pick score; inplace sorting destroys indices -> need class :/
    //meetingPersons.sort(comparePersonsByPickAccuracy);

    // sorting too complicated for now; just add a crown
    List<bool> winners = List.generate(meetingPersons.length, (index) => false);
    int bestPickAccuracy = 0;
    for (var i = 0; i < meetingPersons.length; i++) {
      int nextAccuracy = calculatePickAccuracyofPerson(meetingPersons[i]);
      if (nextAccuracy > bestPickAccuracy) bestPickAccuracy = nextAccuracy;
    }
    for (var i = 0; i < meetingPersons.length; i++) {
      if (calculatePickAccuracyofPerson(meetingPersons[i]) >= bestPickAccuracy)
        winners[i] = true;
      else
        winners[i] = false;
    }

    // display wednesdayfrog or zebra depending on weekday
    var imageBottom;
    if (DateTime.now().weekday == 3) {
      imageBottom = Image.asset("assets/images/frosch-mittwoch.jpg",
          width: MediaQuery.of(context).size.width * 0.2, fit: BoxFit.fill);
    } else {
      imageBottom = Image.network(
          "https://media.giphy.com/media/10hO3rDNqqg2Xe/giphy.gif",
          width: MediaQuery.of(context).size.width * 0.4,
          fit: BoxFit.fill);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: meetingPersons.length,
            itemBuilder: (context, index) {
              final item = meetingPersons[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  winners[index] ? Text('👑') : Text('😭'),
                  Text(
                    item,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    calculatePickAccuracyofPersonAsString(
                        meetingPersons[index]),
                    textAlign: TextAlign.right,
                  ),
                ],
              );
            },
          ),
        ),
        Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
        imageBottom,
        Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "meme");
            },
            child: Text("Gib mir Memes!")),
        Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "chucknorris");
            },
            child: Text("Chuck Norris!")),
        Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "quizpage");
            },
            child: Text("Quiz-Time!"))
      ],
    );
  }
}
