import './transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WastedMoney',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(
      id: 1,
      title: 'Try 1',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 1,
      title: 'Try 1',
      amount: 99.99,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Wasted Money'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.red,
              elevation: 5,
              child: Text(
                'Hello',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
            children: transactions
                .map(
                  (tx) => Card(
                    child: Text(tx.title),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
