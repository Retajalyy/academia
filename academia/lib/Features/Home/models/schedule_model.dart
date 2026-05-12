class ScheduleItem {
  final String title;
  final String time;
  final String location;
  final String instructor;
  final String type;

  ScheduleItem({
    required this.title,
    required this.time,
    required this.location,
    required this.instructor,
    required this.type,
  });

  // Add this factory constructor
  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      title: json['title'] ?? 'No Title',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      instructor: json['instructor'] ?? '',
      type: json['type'] ?? 'Lecture',
    );
  }
}