class Transaction {
  String id;
  String memberId;
  String bookId;
  String issueDate;
  String dueDate;
  String? returnDate;
  double? fineAmount;

  Transaction({
    required this.id,
    required this.memberId,
    required this.bookId,
    required this.issueDate,
    required this.dueDate,
    this.returnDate,
    this.fineAmount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['_id'],
      memberId: json['member_id'],
      bookId: json['book_id'],
      issueDate: json['issue_date'],
      dueDate: json['due_date'],
      returnDate: json['return_date'],
      fineAmount: json['fine_amount']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'member_id': memberId,
      'book_id': bookId,
      'issue_date': issueDate,
      'due_date': dueDate,
      'return_date': returnDate,
      'fine_amount': fineAmount,
    };
  }
}
