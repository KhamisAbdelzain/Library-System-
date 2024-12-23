import 'package:flutter/material.dart';
import 'package:library_ms/Models/transactionModel.dart';
import 'package:library_ms/Transactions/TransactionDetailsPage.dart';
import 'package:library_ms/Transactions/CreateTransactionPage.dart';
import 'package:library_ms/LibraryService.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<Transaction> _transactions = [];
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final transactions = await LibraryService().getTransactions();
      setState(() {
        _transactions = transactions;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  void _navigateToTransactionDetails(Transaction transaction) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TransactionDetailsPage(transaction: transaction)),
    );
  }

  void _navigateToCreateTransaction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTransactionPage()),
    ).then((_) {
      // Refresh transactions list after adding a new transaction
      _fetchTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transactions",
          style: TextStyle(
            color: Color(0xFF472B13),
            fontFamily: "HomePage",
            fontSize: 50,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFBD7B46),
                Color(0xFFDFC0A0),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Books.2jpg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _isError
            ? Center(
          child: Text(
            'Error loading transactions',
            style: TextStyle(color: Colors.red),
          ),
        )
            : ListView.builder(
          itemCount: _transactions.length,
          itemBuilder: (context, index) {
            final transaction = _transactions[index];
            return Container(
              margin: EdgeInsets.all(7),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFBD7B46),
                    Color(0xFFDFC0A0),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListTile(
                title: Text(
                  'Transaction ID: ${transaction.id}',
                  style: TextStyle(fontFamily: "Det", color: Colors.black),
                ),
                subtitle: Text('Issue Date: ${transaction.issueDate}'),
                onTap: () => _navigateToTransactionDetails(transaction),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateTransaction,
        child: Icon(Icons.add),
      ),
    );
  }
}
