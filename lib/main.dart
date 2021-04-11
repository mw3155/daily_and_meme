import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StehaufUhr',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

double myFontSizeMed = 36;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final int maxMeetingPersons = 10;
final int minMeetingDuration = 10;
final int maxMeetingDuration = 31;

class _HomePageState extends State<HomePage> {
  int n_meeting_minutes = 5;

  List<bool> isSelectedPersons =
      List.generate(maxMeetingPersons, (index) => false);
  List<Widget> optionsMeetingPersons =
      List.generate(maxMeetingPersons, (index) => Text((index + 1).toString()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      padding: const EdgeInsets.all(32),
      child: _buildHomepage(),
    )));
  }

  Widget _buildHomepage() {
    return Column(
      children: [
        Text("Wie viele Personen?", style: TextStyle(fontSize: myFontSizeMed)),
        ToggleButtons(
          children: optionsMeetingPersons,
          onPressed: (int index) =>
              {updateIsSelectedList(index, isSelectedPersons)},
          isSelected: isSelectedPersons,
        ),
        Text("Wie viele Minuten insgesamt?",
            style: TextStyle(fontSize: myFontSizeMed)),
        NumberPicker(
            value: n_meeting_minutes,
            minValue: 1,
            maxValue: 100,
            step: 1,
            haptics: true,
            axis: Axis.horizontal,
            onChanged: (newValue) =>
                setState(() => n_meeting_minutes = newValue)),
        Padding(
          child: ElevatedButton(
              onPressed: null,
              child: Text(
                "Start Meeting!",
                style: TextStyle(fontSize: myFontSizeMed),
              )),
          padding: EdgeInsets.all(32),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  void updateIsSelectedList(int index, List<bool> isSelected) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < isSelected.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          isSelected[buttonIndex] = true;
        } else {
          isSelected[buttonIndex] = false;
        }
      }
    });
  }
}
