import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';

class QuizQuestion {
  String question;
  bool answer;

  QuizQuestion({required this.question, required this.answer});
}

class QuizResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  QuizResultPage({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Ergebnis'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ihr habt $score von insgesamt $totalQuestions Fragen richtig beantwortet!',
              style: TextStyle(fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Zurück navigieren'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizTimePage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizTimePage> {
  List<dynamic> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _showAnswer = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getQuestions();
  }

  Future<void> _getQuestions() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?&amount=5&category=15&difficulty=medium&type=boolean'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'];
      final List<dynamic> questions = data.map((q) {
        return QuizQuestion(
            question: q['question'], answer: q['correct_answer'] == 'True');
      }).toList();

      setState(() {
        _questions = questions;
        _isLoading = false;
        _showAnswer = false;
      });
    } else {
      throw Exception('Failed to load questions');
    }
  }

  void _checkAnswer(bool answer) {
    setState(() {
      _showAnswer = true;
      if (answer == _questions[_currentIndex].answer) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
        _showAnswer = false;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultPage(
                score: _score, totalQuestions: _questions.length),
          ),
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _showAnswer = false;
    });
  }

  final unescape = HtmlUnescape();

  Widget _buildQuestionWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Frage ${_currentIndex + 1} von ${_questions.length}:',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        Text(
          unescape.convert(_questions[_currentIndex].question),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(height: 16.0),
        if (_showAnswer)
          Text(
            _questions[_currentIndex].answer ? 'Mega richtig!' : 'Falsch!',
            style: TextStyle(
                fontSize: 24.0,
                color: _questions[_currentIndex].answer
                    ? Colors.green
                    : Colors.red),
          ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _checkAnswer(true),
              child: Text('👍 RICHTIG'),
            ),
            ElevatedButton(
              onPressed: () => _checkAnswer(false),
              child: Text('👎 FALSCH'),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        if (_showAnswer)
          ElevatedButton(
            onPressed: _nextQuestion,
            child: Text('Nächste Frage'),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? SpinKitFadingCircle(
                color: Colors.amber,
                size: 50.0,
              )
            : _currentIndex <= _questions.length - 1
                ? _buildQuestionWidget()
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ihr habt $_score von insgesamt ${_questions.length} Fragen richtig beantwortet!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24.0),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _resetQuiz,
                          child: Text('zurück navigieren'),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
