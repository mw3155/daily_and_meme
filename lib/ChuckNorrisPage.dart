import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChuckNorrisPage extends StatefulWidget {
  @override
  _ChuckNorrisPageState createState() => _ChuckNorrisPageState();
}

class _ChuckNorrisPageState extends State<ChuckNorrisPage> {
  String _currentJoke = 'Bist du bereit für einen Spruch? Sicher?';
  bool _isLoading = false;

  Future<String> _getRandomJoke() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://api.chucknorris.io/jokes/random?category=dev'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setState(() {
        _currentJoke = json['value'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load joke from api');
    }
    return 'No Joke available';
  }

  Widget _buildJokeWidget() {
    if (_isLoading) {
      return SpinKitFadingCircle(
        color: Colors.amber,
        size: 100.0,
      );
    } else {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icons8-chuck-norris-100.png',
                height: 250, fit: BoxFit.cover),
            Text(
              _currentJoke,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris Sprüche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildJokeWidget(),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _getRandomJoke,
                  child: Text('Gib mir einen neuen Spruch'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
