import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

void main(List<String> args) {
  runApp(const Planner());
}

class Planner extends StatelessWidget {
  const Planner({super.key});
  static const appTitle = "Planner app";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.indigo.shade900,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransaction = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.9, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New T-shirt', amount: 23.9, date: DateTime.now()),
  ];

  void addNewTransactioN(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      userTransaction.add(newTransaction);
    });
  }

  void startAddNewTransaction() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTransaction(addNewTx: addNewTransactioN);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: startAddNewTransaction,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(Planner.appTitle),
        actions: [
          IconButton(
            onPressed: startAddNewTransaction,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text(
                  "Chart",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            NewTransaction(addNewTx: addNewTransactioN),
            TransactionList(userTransaction: userTransaction),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        ],
      ),
    );
  }
}
