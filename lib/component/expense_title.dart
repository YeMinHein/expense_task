import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTitle extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime date;
  void Function(BuildContext)? deleteTapped;
  ExpenseTitle(
      {super.key,
      required this.amount,
      required this.name,
      required this.date,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(4),
          )
        ],
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(date.day.toString() +
            '-' +
            date.month.toString() +
            '-' +
            date.year.toString()),
        trailing: Text('MMK ' + amount),
      ),
    );
  }
}
