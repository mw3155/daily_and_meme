import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'quiz_category.dart';
import 'quiz_question.dart';
import 'quiz_result_page.dart';
import 'quiz_service.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizTimePage extends StatefulWidget {
  @override
  _QuizTimePageState createState() => _QuizTimePageState();
}

class _QuizTimePageState extends State<QuizTimePage> {
  List<QuizCategory> categories = QuizService.getCategories();
  List<String> difficulties = QuizService.getDifficulties();
  List<dynamic>? questions = null;
  bool isLoading = false;
  int currentIndex = 0;
  int correctAnswers = 0;
  String? selectedCategory = null;
  String? selectedDifficulty = null;
  String? answerFeedback;
  bool answerButtonsEnabled = true;
  final unescape = HtmlUnescape();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Zeit'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : questions == null || questions!.isEmpty
              ? buildSelectionPage()
              : buildQuestionPage(questions![currentIndex]),
    );
  }

  Widget buildSelectionPage() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildCategoryDropdown(),
        buildDifficultyDropdown(),
        buildQuickQuizButton(),
        buildStartQuizButton(),
      ],
    ));
  }

  Widget buildCategoryDropdown() {
    return DropdownButton<String>(
      value: selectedCategory,
      hint: Text('Kategorie auswählen'),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedCategory = newValue;
          });
        }
      },
      items: categories.map<DropdownMenuItem<String>>((QuizCategory category) {
        return DropdownMenuItem<String>(
          value: category.id.toString(),
          child: Text(category.name),
        );
      }).toList(),
    );
  }

  Widget buildDifficultyDropdown() {
    return DropdownButton<String>(
      value: selectedDifficulty,
      hint: Text('Schwierigkeit auswählen'),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedDifficulty = newValue;
          });
        }
      },
      items: difficulties.map<DropdownMenuItem<String>>((String difficulty) {
        return DropdownMenuItem<String>(
          value: difficulty,
          child: Text(difficulty),
        );
      }).toList(),
    );
  }

  Widget buildQuickQuizButton() {
    return ElevatedButton(
      onPressed: startRandomQuiz,
      child: Text('Schnelles Quiz'),
    );
  }

  Widget buildStartQuizButton() {
    return ElevatedButton(
      onPressed: selectedCategory != null && selectedDifficulty != null
          ? startQuiz
          : null,
      child: Text('Quiz starten'),
    );
  }

  void startQuiz() async {
    setState(() {
      isLoading = true;
    });
    final fetchedQuestions = await QuizService.fetchQuestions(
      category: selectedCategory,
      difficulty: selectedDifficulty,
    );
    setState(() {
      questions = fetchedQuestions;
      isLoading = false;
    });
  }

  void startRandomQuiz() async {
    final random = Random();
    final randomCategory = categories[random.nextInt(categories.length)].id;
    final randomDifficulty = difficulties[random.nextInt(difficulties.length)];

    final fetchedQuestions = await QuizService.fetchQuestions(
      category: randomCategory.toString(),
      difficulty: randomDifficulty,
    );
    setState(() {
      questions = fetchedQuestions;
      selectedCategory = randomCategory.toString();
      selectedDifficulty = randomDifficulty;
    });
  }

  Widget buildQuestionPage(Map<String, dynamic> questionData) {
    final quizQuestion = QuizQuestion(
        question: questionData['question'], answer: questionData['answer']);
    final categoryName = categories
        .firstWhere((category) => category.id == int.parse(selectedCategory!))
        .name;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Kategorie: $categoryName - Schwierigkeit: $selectedDifficulty',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16.0),
        if (answerFeedback != null)
          Text(
            answerFeedback!,
            style: TextStyle(
                fontSize: 32,
                color: answerFeedback == "Richtig" ? Colors.green : Colors.red),
          ),
        SizedBox(height: 32.0),
        Text(
          unescape.convert(quizQuestion.question),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: answerButtonsEnabled ? () => onAnswer(true) : null,
              child: Text('Wahrheit'),
            ),
            SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: answerButtonsEnabled ? () => onAnswer(false) : null,
              child: Text('Lüge'),
            ),
          ],
        ),
      ],
    );
  }

  void resetQuiz() {
    setState(() {
      currentIndex = 0;
      correctAnswers = 0;
      selectedCategory = null;
      selectedDifficulty = null;
      questions = null;
    });
  }

  void onAnswer(bool answer) {
    bool isCorrect = questions![currentIndex]['answer'] == answer;
    if (isCorrect) {
      correctAnswers++;
    }
    setState(() {
      answerButtonsEnabled = false;
      answerFeedback = isCorrect ? 'Richtig' : 'Falsch';
    });
    showFeedback();
  }

  void showFeedback() {
    Timer(Duration(seconds: 2), () {
      if (currentIndex + 1 < questions!.length) {
        setState(() {
          currentIndex++;
          answerFeedback = null;
          answerButtonsEnabled = true;
        });
      } else {
        // Show the result page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultPage(
              score: correctAnswers,
              totalQuestions: questions!.length,
            ),
          ),
        );
      }
    });
  }
}
