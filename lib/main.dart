import './widgets/chart.dart';

import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.deepOrange,
        fontFamily: 'QuickSand',
      ),
      debugShowCheckedModeBanner: false,
      title: 'WastedMoney',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
      id: DateTime.now(),
      title: 'Books',
      amount: 400.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Clothes',
      amount: 23,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Meal',
      amount: 45,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Routing',
      amount: 33,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Chocolate',
      amount: 88,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Gone',
      amount: 107.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Books',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Clothes',
      amount: 23,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Meal',
      amount: 45,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Routing',
      amount: 33,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Chocolate',
      amount: 88,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Gone',
      amount: 107.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];

  List<Transaction> get recentTransctions {
    return transactions.where((item) {
      return item.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addTransaction({
    title,
    amount,
  }) {
    final tx = Transaction(
      id: DateTime.now(),
      amount: amount,
      title: title,
      date: DateTime.now(),
    );
    setState(
      () {
        transactions.add(tx);
      },
    );
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Wasted Money',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => {startAddNewTransaction(context)},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransctions),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {startAddNewTransaction(context)},
      ),
    );
  }
}
