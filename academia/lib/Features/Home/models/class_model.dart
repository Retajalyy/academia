class ClassModel {
  final String title;
  final String room;
  final String startTime;

  ClassModel({
    required this.title,
    required this.room,
    required this.startTime,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      title: json['title'],
      room: json['room'],
      startTime: json['start_time'],
    );
  }
}