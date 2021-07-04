import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';

import 'Util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: buildBottomSheet(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: _buildHomepage(),
        ),
      ),
    );
  }

  Widget _buildHomepage() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center, // no effect?
      children: [
        Text(
          "Teilnehmer:",
          textAlign: TextAlign.left,
        ),
        SizedBox(
          //height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: meetingPersons.length,
            itemBuilder: (context, index) {
              final item = meetingPersons[index];
              return Dismissible(
                // Each Dismissible must contain a Key. Keys allow Flutter to
                // uniquely identify widgets.
                key: Key(item),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    meetingPersons.removeAt(index);
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("RIP $item"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                // Show a red background as the item is swiped away.
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text(
                    //TextStyle(fontSize: myResponsiveFontSize, color: Colors.amber),
                    '$item',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: myResponsiveFontSize * 0.7,
                      color: Colors.amber,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.height * 0.2,
          child: TextField(
            onChanged: (String newName) {
              // TODO: this seems like a hack, how to do better?
              newMeetingPerson = newName;
            },
            onSubmitted: (value) {
              setState(() {
                meetingPersons.add(newMeetingPerson);
              });
            },
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Neuer Teilnehmer',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            meetingPersons.shuffle();
          },
          child: Icon(Icons.shuffle),
        ),
        Padding(padding: EdgeInsets.all(32)),
        Text("Gesamtdauer (Minuten):"),
        NumberPicker(
            selectedTextStyle: TextStyle(
              fontSize: myResponsiveFontSize,
              color: Colors.amber,
            ),
            value: nMeetingMinutes,
            minValue: 1,
            maxValue: 100,
            step: 1,
            haptics: true,
            axis: Axis.horizontal,
            onChanged: (newValue) => setState(() => nMeetingMinutes = newValue)),
        Padding(padding: EdgeInsets.all(32)),
        ElevatedButton(
          onPressed: () {
            int nSecondsPerPerson = nMeetingMinutes * 60 ~/ meetingPersons.length;
            // floor duration per person to be divisible by durationPick
            nSecondsPerPerson =
                nSecondsPerPerson ~/ durationPick.inSeconds * durationPick.inSeconds;
            durationPerPerson = Duration(seconds: nSecondsPerPerson);
            if (durationPerPerson.inSeconds < durationPick.inSeconds)
              durationPerPerson = durationPick;
            _showConfirmDialog();
          },
          child: Text(
            "Meeting starten",
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Future<void> _showConfirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Es gibt ${meetingPersons.length} Teilnehmer\nJeder hat eine Redezeit von ${durationPerPerson.inMinutes} Minuten und ${durationPerPerson.inSeconds.remainder(60)} Sekunden.'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(), child: Text("Abbrechen")),
                  ElevatedButton(
                      child: Text('Starten'),
                      onPressed: () {
                        currentSpeaker = 0;
                        Navigator.pushNamed(context, "timer");
                      }),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void updateIsSelectedList(int index, List<bool> isSelected) {
    setState(
      () {
        for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
          if (buttonIndex == index) {
            isSelected[buttonIndex] = true;
          } else {
            isSelected[buttonIndex] = false;
          }
        }
      },
    );
  }
}
