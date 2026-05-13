class FeeModel {
  final String id;
  final String title;
  final double amount;
  final String status; // 'paid' | 'unpaid'
  final DateTime? paidOn;
  final DateTime? dueDate;
  final String? invoiceUrl;

  FeeModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.status,
    this.paidOn,
    this.dueDate,
    this.invoiceUrl,
  });

  bool get isPaid => status == 'paid';

  factory FeeModel.fromJson(Map<String, dynamic> json) {
    return FeeModel(
      id: json['id'],
      title: json['title'],
      amount: (json['amount'] as num).toDouble(),
      status: json['status'],
      paidOn: json['paid_on'] != null ? DateTime.parse(json['paid_on']) : null,
      dueDate: json['due_date'] != null ? DateTime.parse(json['due_date']) : null,
      invoiceUrl: json['invoice_url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'amount': amount,
    'status': status,
    'paid_on': paidOn?.toIso8601String(),
    'due_date': dueDate?.toIso8601String(),
    'invoice_url': invoiceUrl,
  };
}