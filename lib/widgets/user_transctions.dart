import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'new_transaction.dart';
import '../models/transaction.dart';

class UserTransctions extends StatefulWidget {
  @override
  _UserTransctionsState createState() => _UserTransctionsState();
}

class _UserTransctionsState extends State<UserTransctions> {
  final List<Transaction> transactions = [
    Transaction(
      id: DateTime.now(),
      title: 'Try 1',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now(),
      title: 'Try 1',
      amount: 99.99,
      date: DateTime.now(),
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
