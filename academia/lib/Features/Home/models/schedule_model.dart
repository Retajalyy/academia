class ScheduleItem {
  final String title;
  final String time;
  final String location;
  final String instructor;
  final String type; // Lecture, Section, etc.

  ScheduleItem({required this.title, required this.time, required this.location, required this.instructor, required this.type});
}