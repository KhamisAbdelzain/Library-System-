import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:library_ms/Models/adminModel.dart';
import 'package:library_ms/Models/book';
import 'package:library_ms/Models/memberModel.dart';
import 'package:library_ms/Models/transactionModel.dart';

class LibraryService {
  final Dio _dio = Dio();
  final String _dataSource = "Cluster0";
  final String _database = "library";
  final String _collection = "books"; // Replace with your collection name
  final String _endpoint =
      "https://eu-central-1.aws.data.mongodb-api.com/app/data-rspqaan/endpoint/data/v1"; // Replace with your endpoint URL
  static const _apiKey = "ebKIO2gU1UcGTx491FZGb3bfVEsjPfkFFWsU5WVE1gtCeAZHQtOjrbwMe04nJ1jg"; // Replace with your API key
//get books function from data base
  Future<List<Book>> getBooks() async {
    try {
      Response response = await _dio.post(
          '$_endpoint/action/find', options: Options(
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
//get Names of books function from data base
  Future<Book?> getBookByName(String name) async {
    try {
      Response response = await _dio.post(
        '$_endpoint/action/find',
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
              "title": {"\$regex": name}
            },
          },
        ),
      );
      List<dynamic> data = response.data['documents'];
      if (data.isNotEmpty) {
        return Book.fromJson(data.first);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get book by name: $e');
    }
  }

//Update books function from data base
  Future<void> updateBook(String name, Book book) async {
    try {
      Response response = await _dio.post(
        '$_endpoint/action/updateOne',
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
              "title": name
            },
            "update": {
              "\$set": book.toJson()
            }
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update book: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update book: $e');
    }
  }
//create book function in data base

  Future<void> createBook(Book book) async {
    try {
      Response response = await _dio.post(
          '$_endpoint/action/insertOne', options: Options(
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
//get  count of books  from data base
  Future<int> countBooks(Map<String, dynamic> filter) async {
    try {
      Response response = await _dio.post(
        '$_endpoint/action/count',
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
            "filter": filter,
          },
        ),
      );
      return response.data['count'];
    } catch (e) {
      throw Exception('Failed to count books: $e');
    }
  }

//get Members function from data base
  Future<List<Member>> getMembers() async {
    try {
      Response response = await _dio.post(
          '$_endpoint/action/find', options: Options(
          headers: {
            "content-type": "application/json",
            "api-key": _apiKey,
          }
      ), data: jsonEncode(
        {
          "dataSource": _dataSource,
          "database": _database,
          "collection": "members", // Corrected collection name to "members"
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
//get Members by name function from data base
  Future<Member?> getMemberByName(String name) async {
    try {
      Response response = await _dio.post(
        '$_endpoint/action/find',
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
              "name": {"\$regex": name}
            },
          },
        ),
      );
      List<dynamic> data = response.data['documents'];
      if (data.isNotEmpty) {
        return Member.fromJson(data.first);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get member by name: $e');
    }
  }
//update Members function in data base

  Future<void> updateMember(String id, Member member) async {
    try {
      Response response = await _dio.post(
          '$_endpoint/action/updateOne', options: Options(
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
//create Members  function in data base

  Future<void> createMember(Member member) async {
    try {
      Response response = await _dio.post(
          '$_endpoint/action/insertOne', options: Options(
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
//get Admin  function from data base

  Future<List<Admin>> getAdmins() async {
    try {
      Response response = await _dio.post(
          '$_endpoint/action/find', options: Options(
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

  Future<Admin?> getAdminByName(String name) async {
    try {
      Response response = await _dio.post(
        '$_endpoint/action/find',
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
              "name": {"\$regex": name}
            },
          },
        ),
      );
      List<dynamic> data = response.data['documents'];
      if (data.isNotEmpty) {
        return Admin.fromJson(data.first);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get admin by name: $e');
    }
  }

  Future<void> updateAdmin(String id, Admin admin) async {
    try {
      Response response = await _dio.post(
        '$_endpoint/action/updateOne',
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
              "_id": {"\$oid": id} // Corrected to filter by admin ID
            },
            "update": {
              "\$set": admin.toJson()
            }
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update admin: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update admin: $e');
    }
  }

  Future<void> createAdmin(Admin admin) async {
    try {
      Response response = await _dio.post(
          '$_endpoint/action/insertOne', options: Options(
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




}






