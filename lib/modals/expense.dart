class Expense {
  final int? id;
  final String title;
  final double amount;
  final int date;
  final String category;

  Expense(
      {this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date,
      'category': category,
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'] as int?,
      title: json['title'] as String,
      amount: json['amount'] as double,
      date: json['date'],
      category: json['category'] as String,
    );
  }
}
