class Expensemodel{
  String? name;
  double? expense;

//<editor-fold desc="Data Methods">
  Expensemodel({
    required this.name,
    required this.expense,
  });

  Expensemodel copyWith({
    String? name,
    double? expense,
  }) {
    return Expensemodel(
      name: name ?? this.name,
      expense: expense ?? this.expense,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'expense': this.expense,
    };
  }

  factory Expensemodel.fromMap(Map<String, dynamic> map) {
    return Expensemodel(
      name: map['name'] as String,
      expense: map['expense'] ,
    );
  }
}