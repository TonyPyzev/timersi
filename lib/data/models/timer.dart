import 'category.dart';

class Timer {
  final String titie;
  final Category category;
  final DateTime creationDateTime;
  final DateTime time;
  final DateTime? completedDateTime;

  Timer({
    required this.titie,
    required this.category,
    required this.creationDateTime,
    required this.time,
    this.completedDateTime,
  });
}
