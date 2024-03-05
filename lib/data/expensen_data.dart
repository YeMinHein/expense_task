import 'package:expensetracker/data/hive_database.dart';
import 'package:flutter/material.dart';
import '../component/date_time_helper.dart';
import '../models/expense_item.dart';

class ExpenseData extends ChangeNotifier{
  //list all expense

  List<ExpenseItem> overallExpenseList =[];
  //prepare display data
  final db = HiveDataBase();
  void PrepareDate (){
    if(db.ReadDate().isNotEmpty){
      overallExpenseList = db.ReadDate();
    }
  }

  //get expense list
  List<ExpenseItem> getAllexpnselist (){
    return overallExpenseList;

  }
  //get new expense

void addNewExpense(ExpenseItem expense){
    overallExpenseList.add(expense);
    notifyListeners();
    db.SaveData(overallExpenseList);
}
  //get week day from date time object
void deleteExpense(ExpenseItem expense){
    overallExpenseList.remove(expense);
    notifyListeners();
    db.SaveData(overallExpenseList);
}

   String getDayName(DateTime dateTime){
    switch(dateTime.weekday){
      case 1: return "Mon";
      case 2: return "Tue";
      case 3: return "Wed";
      case 4: return "Thu";
      case 5: return "Fri";
      case 6: return "Sat";
      case 7: return "Sun";
      default: return "";
    }
   }
//get date from a start of week(sunday)
  DateTime startoWeekDate() {
    DateTime ? startofweek;
    DateTime today = DateTime.now();
    //go backward from today to find sunday
    for (int i = 0; i < 7; i++) {
      if(getDayName(today.subtract(Duration(days: i)))=='Sun'){
        startofweek = today.subtract(Duration(days: i));
      }

    }
    return startofweek!;
  }

  Map<String,double> calculateDailyExpenseSummary(){
    Map<String,double>dailyExpenseSummary ={

    };
    for(var expense in overallExpenseList){
      String date = convertDateTimeToString(expense.date);
      double amount = double.parse(expense.amount);
      if(dailyExpenseSummary.containsKey(date)){
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date]= currentAmount;
      }
      else{
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}