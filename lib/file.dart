import 'dart:convert';
import 'package:dio/dio.dart';

class LibraryService {
  final Dio _dio = Dio();
  final String _dataSource = "Cluster0";
  final String _database = "library";
  final String _collection = "books"; // Replace with your collection name
  final String _endpoint =
      "https://eu-central-1.aws.data.mongodb-api.com/app/data-rspqaan/endpoint/data/v1"; // Replace with your endpoint URL
  static const _apiKey = "ebKIO2gU1UcGTx491FZGb3bfVEsjPfkFFWsU5WVE1gtCeAZHQtOjrbwMe04nJ1jg"; // Replace with your API key

  Future<List<Book>> getBooks() async {
    try {
      Response response = await _dio.post('$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": _collection,
          "filter": {},
        },
      ));
      List<dynamic> data = response.data['documents'];
      List<Book> books = data.map((json) => Book.fromJson(json)).toList();
      return books;
    } catch (e) {
      throw Exception('Failed to get books: $e');
    }
  }

  Future<Book> getBookById(String id) async {
    try {
      Response response = await _dio.post('$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": _collection,
          "filter": {
            "_id": {"\$oid": id}
          },
        },
      ));
      var resp = response.data['documents'][0];
      var contact = Book.fromJson(resp);
      return contact;
    } catch (e) {
      throw Exception('Failed to get book by ID: $e');
    }
  }

  Future<void> updateBook(String id, Book book) async {
    try {
      Response response = await _dio.post('$_endpoint/action/updateOne', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": _collection,
          "filter": {
            "_id": {"\$oid": id}
          },
          "update": {
            "\$set": book.toJson()
          }
        },
      ));
      if (response.statusCode != 200) {
        throw Exception('Failed to update book: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update book: $e');
    }
  }

  Future<void> createBook(Book book) async {
    try {
      Response response = await _dio.post('$_endpoint/action/insertOne', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": _collection,
          "document": book.toJson()
        },
      ));
      if (response.statusCode != 201) {
        throw Exception('Failed to create book: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create book: $e');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      Response response = await _dio.delete(
        '$_endpoint/action/deleteOne',
        options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          },
        ),
        data: jsonEncode(
          {
            "dataSource": _dataSource,
            "database": _database,
            "collection": _collection,
            "filter": {
              "_id": {"\$oid": id}
            },
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to delete book: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete book: $e');
    }
  }



  Future<List<Member>> getMembers() async {
    try {
      Response response = await _dio.post('$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "members",
          "filter": {},
        },
      ));
      List<dynamic> data = response.data['documents'];
      List<Member> members = data.map((json) => Member.fromJson(json)).toList();
      return members;
    } catch (e) {
      throw Exception('Failed to get members: $e');
    }
  }

  Future<Member> getMemberById(String id) async {
    try {
      Response response = await _dio.post('$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "members",
          "filter": {
            "_id": {"\$oid": id}
          },
        },
      ));
      var resp = response.data['documents'][0];
      var member = Member.fromJson(resp);
      return member;
    } catch (e) {
      throw Exception('Failed to get member by ID: $e');
    }
  }

  Future<void> updateMember(String id, Member member) async {
    try {
      Response response = await _dio.post('$_endpoint/action/updateOne', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "members",
          "filter": {
            "_id": {"\$oid": id}
          },
          "update": {
            "\$set": member.toJson()
          }
        },
      ));
      if (response.statusCode != 200) {
        throw Exception('Failed to update member: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update member: $e');
    }
  }

  Future<void> createMember(Member member) async {
    try {
      Response response = await _dio.post('$_endpoint/action/insertOne', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "members",
          "document": member.toJson()
        },
      ));
      if (response.statusCode != 201) {
        throw Exception('Failed to create member: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create member: $e');
    }
  }

  Future<void> deleteMember(String id) async {
    try {
      Response response = await _dio.delete(
        '$_endpoint/action/deleteOne',
        options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          },
        ),
        data: jsonEncode(
          {
            "dataSource": _dataSource,
            "database": _database,
            "collection": "members",
            "filter": {
              "_id": {"\$oid": id}
            },
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to delete member: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete member: $e');
    }
  }

  Future<List<Admin>> getAdmins() async {
    try {
      Response response = await _dio.post('$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "admins",
          "filter": {},
        },
      ));
      List<dynamic> data = response.data['documents'];
      List<Admin> admins = data.map((json) => Admin.fromJson(json)).toList();
      return admins;
    } catch (e) {
      throw Exception('Failed to get admins: $e');
    }
  }

  Future<Admin> getAdminById(String id) async {
    try {
      Response response = await _dio.post('$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "admins",
          "filter": {
            "_id": {"\$oid": id}
          },
        },
      ));
      var resp = response.data['documents'][0];
      var admin = Admin.fromJson(resp);
      return admin;
    } catch (e) {
      throw Exception('Failed to get admin by ID: $e');
    }
  }

  Future<void> updateAdmin(String id, Admin admin) async {
    try {
      Response response = await _dio.post('$_endpoint/action/updateOne', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "admins",
          "filter": {
            "_id": {"\$oid": id}
          },
          "update": {
            "\$set": admin.toJson()
          }
        },
      ));
      if (response.statusCode != 200) {
        throw Exception('Failed to update admin: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update admin: $e');
    }
  }

  Future<void> createAdmin(Admin admin) async {
    try {
      Response response = await _dio.post('$_endpoint/action/insertOne', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "admins",
          "document": admin.toJson()
        },
      ));
      if (response.statusCode != 201) {
        throw Exception('Failed to create admin: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create admin: $e');
    }
  }

  Future<void> deleteAdmin(String id) async {
    try {
      Response response = await _dio.delete(
        '$_endpoint/action/deleteOne',
        options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          },
        ),
        data: jsonEncode(
          {
            "dataSource": _dataSource,
            "database": _database,
            "collection": "admins",
            "filter": {
              "_id": {"\$oid": id}
            },
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to delete admin: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete admin: $e');
    }
  }


  Future<List<Transaction>> getTransactions() async {
    try {
      Response response = await _dio.post('$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "transactions",
          "filter": {},
        },
      ));
      List<dynamic> data = response.data['documents'];
      List<Transaction> transactions = data.map((json) =>
          Transaction.fromJson(json)).toList();
      return transactions;
    } catch (e) {
      throw Exception('Failed to get transactions: $e');
    }
  }

  Future<Transaction> getTransactionById(String id) async {
    try {
      Response response = await _dio.post('$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "transactions",
          "filter": {
            "_id": {"\$oid": id}
          },
        },
      ));
      var resp = response.data['documents'][0];
      var transaction = Transaction.fromJson(resp);
      return transaction;
    } catch (e) {
      throw Exception('Failed to get transaction by ID: $e');
    }
  }

  Future<void> createTransaction(Transaction transaction) async {
    try {
      Response response = await _dio.post('$_endpoint/action/insertOne', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "transactions",
          "document": transaction.toJson()
        },
      ));
      if (response.statusCode != 201) {
        throw Exception('Failed to create transaction: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create transaction: $e');
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      Response response = await _dio.delete(
        '$_endpoint/action/deleteOne',
        options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          },
        ),
        data: jsonEncode(
          {
            "dataSource": _dataSource,
            "database": _database,
            "collection": "transactions",
            "filter": {
              "_id": {"\$oid": id}
            },
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to delete transaction: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete transaction: $e');
    }
  }
}



class Book {
  String id;
  String title;
  List<String> author;
  String ISBN;
  String genre;
  String publicationDate;
  int quantity;
  String availability;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.ISBN,
    required this.genre,
    required this.publicationDate,
    required this.quantity,
    required this.availability,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'],
      title: json['title'],
      author: List<String>.from(json['author']),
      ISBN: json['ISBN'],
      genre: json['genre'],
      publicationDate: json['publication_date'],
      quantity: json['quantity'],
      availability: json['availability'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'author': author,
      'ISBN': ISBN,
      'genre': genre,
      'publication_date': publicationDate,
      'quantity': quantity,
      'availability': availability,
    };
  }
}

class Member {
  String id;
  String name;
  String email;
  String address;
  String phone;
  List<String> booksIssued;
  String membershipStatus;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.booksIssued,
    required this.membershipStatus,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      booksIssued: List<String>.from(json['books_issued']),
      membershipStatus: json['membership_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'books_issued': booksIssued,
      'membership_status': membershipStatus,
    };
  }
}

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
      '_id': id,
      'member_id': memberId,
      'book_id': bookId,
      'issue_date': issueDate,
      'due_date': dueDate,
      'return_date': returnDate,
      'fine_amount': fineAmount,
    };
  }
}

class Admin {
  String id;
  String username;
  String password;
  String role;

  Admin({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['_id'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'password': password,
      'role': role,
    };
  }
}