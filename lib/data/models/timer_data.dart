import 'category.dart';

class TimerData {
  final String titie;
  final Category category;
  final DateTime creationDateTime;
  final DateTime time;
  final DateTime? completedDateTime;

  TimerData({
    required this.titie,
    required this.category,
    required this.creationDateTime,
    required this.time,
    this.completedDateTime,
  });
}
