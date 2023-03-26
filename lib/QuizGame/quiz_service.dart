import 'dart:convert';
import 'package:http/http.dart' as http;
import 'quiz_category.dart';

class QuizService {
  static List<String> getDifficulties() {
    return ['any', 'easy', 'medium', 'hard'];
  }

  static List<QuizCategory> getCategories() {
    return [
      QuizCategory(id: 9, name: 'General Knowledge'),
      QuizCategory(id: 10, name: 'Entertainment: Books'),
      QuizCategory(id: 11, name: 'Entertainment: Film'),
      QuizCategory(id: 12, name: 'Entertainment: Music'),
      QuizCategory(id: 13, name: 'Entertainment: Musicals & Theatres'),
      QuizCategory(id: 14, name: 'Entertainment: Television'),
      QuizCategory(id: 15, name: 'Entertainment: Video Games'),
      QuizCategory(id: 16, name: 'Entertainment: Board Games'),
      QuizCategory(id: 17, name: 'Science & Nature'),
      QuizCategory(id: 18, name: 'Science: Computers'),
      QuizCategory(id: 19, name: 'Science: Mathematics'),
      QuizCategory(id: 20, name: 'Mythology'),
      QuizCategory(id: 21, name: 'Sports'),
      QuizCategory(id: 22, name: 'Geography'),
      QuizCategory(id: 23, name: 'History'),
      QuizCategory(id: 24, name: 'Politics'),
      QuizCategory(id: 25, name: 'Art'),
      QuizCategory(id: 26, name: 'Celebrities'),
      QuizCategory(id: 27, name: 'Animals'),
      QuizCategory(id: 28, name: 'Vehicles'),
      QuizCategory(id: 29, name: 'Entertainment: Comics'),
      QuizCategory(id: 30, name: 'Science: Gadgets'),
      QuizCategory(id: 31, name: 'Entertainment: Japanese Anime & Manga'),
      QuizCategory(id: 32, name: 'Entertainment: Cartoon & Animations')
    ];
  }

  static Future<List<dynamic>> fetchQuestions(
      {int amount = 5,
      String? category,
      String? difficulty,
      String type = 'boolean'}) async {
    String url = 'https://opentdb.com/api.php?amount=$amount&type=$type';
    if (category != null && category != 'any') {
      url += '&category=$category';
    }
    if (difficulty != null && difficulty != 'any') {
      url += '&difficulty=$difficulty';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'];
      final List<dynamic> questions = data.map((q) {
        return {
          'question': q['question'],
          'answer': q['correct_answer'] == 'True'
        };
      }).toList();
      return questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
