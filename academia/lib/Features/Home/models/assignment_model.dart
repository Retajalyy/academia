class AssignmentModel {
  final String title;
  final String dueDate;

  AssignmentModel({
    required this.title,
    required this.dueDate,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      title: json['title'],
      dueDate: json['due_date'],
    );
  }
}