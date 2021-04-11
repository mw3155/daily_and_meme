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
  int n_meeting_minutes = 15;
  int n_meeting_persons = 5;

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
        Text("Wie viele Personen nehmen teil?",
            style: TextStyle(fontSize: myFontSizeMed)),
        NumberPicker(
            value: n_meeting_persons,
            minValue: 1,
            maxValue: 100,
            step: 1,
            haptics: true,
            axis: Axis.horizontal,
            onChanged: (newValue) =>
                setState(() => n_meeting_persons = newValue)),
        Text("Wie viele Minuten sind insgesamt eingeplant?",
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
              onPressed: () => _showConfirmDialog(),
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

  Future<void> _showConfirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Einstellungen'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Es gibt $n_meeting_persons Teilnehmer.'),
                Text(
                    'Jeder hat eine Redezeit von ${n_meeting_minutes / n_meeting_persons} Minuten.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Abbrechen")),
            TextButton(
              child: Text('Starten'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
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

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
