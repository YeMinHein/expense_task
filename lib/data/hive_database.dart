import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense_item.dart';
class HiveDataBase {
  //reference database
  final myBox = Hive.box("expense_db");

  //write database
  void SaveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpenseFormat = [];
    for (var expense in allExpense) {
      //convert each expense into a list of store type(string,datetime)
      List<dynamic> expenseFormat = [
        expense.name,
        expense.amount,
        expense.date,
      ];
      allExpenseFormat.add(expenseFormat);
    }
    //final store database
    myBox.put("allExpense", allExpenseFormat);
  }

// read data
  List<ExpenseItem> ReadDate() {
    List saveExpense = myBox.get("allExpense") ?? [];
    List<ExpenseItem> allExpense = [];
    for (int i = 0; i <= saveExpense.length; i++) {
      //collect individual expense data
      String name = saveExpense[i][0];
      String amount = saveExpense[i][2];
      DateTime date = saveExpense[i][0];
      //create expense item
      ExpenseItem expenseItem = ExpenseItem(
          name: name, amount: amount, date: date);
      //add expense to overall expense list
      allExpense.add(expenseItem);
    }
    return allExpense;
  }
}