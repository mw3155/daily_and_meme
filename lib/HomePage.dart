import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: buildBottomSheet(context),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(defaultEdgeInsets),
          child: _buildHomepage(),
        ),
      ),
    );
  }

  void _showAddPersonDialog() {
    showDialog(
      context: context,
      builder: (_) {
        var nameController = TextEditingController();
        return AlertDialog(
          title: Text('Teilnehmer hinzufügen'),
          content: TextFormField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Abbrechen"),
                    ),
                    Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          meetingPersons.add(nameController.text);
                        });
                        Navigator.pop(context);
                      },
                      child: Text("Hinzufügen"),
                    )
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildNewDomainMessage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        onPressed: _launchURL,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.black),
            ))),
        child: Text(
          "Guten Morgen liebe DailyAndMemer!"
                  "\n" +
              "Aufgrund von finanziellen Engpässen sieht sich unser Team leider dazu gezwungen die Domain dailyandmeme.xyz aufzugeben."
                  "\n" +
              "Unser Service steht Ihnen ab sofort unter www.dailyandmeme2022.xyz zur Verfügung.",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  void _launchURL() async {
    if (!await launch("http://www.dailyandmeme2022.xyz")) throw 'Could not launch';
  }

  Widget _buildHomepage() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center, // no effect?
      children: [
        //_buildNewDomainMessage(),
        Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
        Text(
          "Teilnehmer:",
          textAlign: TextAlign.start, // does not work
        ),
        SizedBox(
          //height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.2,
          child: ReorderableListView.builder(
            onReorder: (oldIdx, newIdx) {
              if (oldIdx < newIdx) {
                newIdx -= 1;
              }
              String movedPerson = meetingPersons.removeAt(oldIdx);
              meetingPersons.insert(newIdx, movedPerson);
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            buildDefaultDragHandles: false,
            itemCount: meetingPersons.length,
            itemBuilder: (context, index) {
              final item = meetingPersons[index];
              return Row(
                key: ValueKey(item),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReorderableDragStartListener(child: 
                    Text(
                      item,
                      textAlign: TextAlign.left,
                    ),
                  index: index),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        meetingPersons.removeAt(index);
                      });
                    },
                    child: Icon(Icons.cancel_presentation),
                  ),
                ],
              );
            },
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAddPersonDialog();
              },
              child: Icon(Icons.add),
            ),
            Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
            ElevatedButton(
              onPressed: () {
                meetingPersons.shuffle();
              },
              child: Icon(Icons.shuffle),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
        Text("Gesamtdauer (Minuten):"),
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          }),
          child: NumberPicker(
              selectedTextStyle: TextStyle(
                fontSize: myResponsiveFontSize,
                color: Colors.amber,
              ),
              value: nMeetingMinutes,
              minValue: 1,
              textStyle: TextStyle(
                fontSize: myResponsiveFontSize,
                color: Colors.black,
              ),
              maxValue: 100,
              step: 1,
              haptics: true,
              axis: Axis.horizontal,
              onChanged: (newValue) => setState(() => nMeetingMinutes = newValue)),
        ),
        Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
        Text("Animation:"),
        ToggleButtons(
          borderColor: Colors.blueGrey,
          children: [
            // borders between togglebuttons are too complicated, use this instead...
            Text("  " + animationOptions[0] + "  "),
            Text("  " + animationOptions[1] + "  "),
            Text("  " + animationOptions[2] + "  "),
          ],
          isSelected: List.generate(
              animationOptions.length, (index) => index == chosenAnimation ? true : false),
          onPressed: (int index) {
            setState(() {
              selectedAnimation = List.generate(animationOptions.length, (index) => false);
              selectedAnimation[index] = true;
              chosenAnimation = index;
            });
          },
        ),
        Padding(padding: EdgeInsets.all(defaultEdgeInsets)),
        ElevatedButton(
          onPressed: () {
            // init time for each person
            int nSecondsPerPerson = nMeetingMinutes * 60 ~/ meetingPersons.length;
            durationPerPerson = Duration(seconds: nSecondsPerPerson);
            if (animationOptions[chosenAnimation].contains("Luke")) {
              // floor duration per person to be divisible by durationPick
              nSecondsPerPerson = nSecondsPerPerson ~/
                  durationPicks[chosenAnimation].inSeconds *
                  durationPicks[chosenAnimation].inSeconds;
              durationPerPerson = Duration(seconds: nSecondsPerPerson);
              if (durationPerPerson.inSeconds < durationPicks[chosenAnimation].inSeconds)
                durationPerPerson = durationPicks[chosenAnimation];
            }

            // init pickHistories
            pickHistoryPerPerson = List.generate(meetingPersons.length, (index) => []);

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
                      onPressed: () async {
                        // save configured settings
                        await saveSettingsAsync();
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
