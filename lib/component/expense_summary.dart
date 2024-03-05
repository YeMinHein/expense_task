import 'package:expensetracker/data/expensen_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../bar_graph/bar_graph.dart';
import 'date_time_helper.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startoweek;
  const ExpenseSummary({super.key , required this.startoweek});
//calculate max amount in bar graph
  double calculateMax (ExpenseData value,
  String sunday,
  String monday,
  String tueday,
  String wedday,
  String thuday,
  String firday,
  String satday,){
    double ? max = 100;
    List<double> values= [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tueday] ?? 0,
      value.calculateDailyExpenseSummary()[wedday] ?? 0,
      value.calculateDailyExpenseSummary()[thuday] ?? 0,
      value.calculateDailyExpenseSummary()[firday] ?? 0,
      value.calculateDailyExpenseSummary()[satday] ?? 0,
    ];
    values.sort();
    max =values.last * 1.1;
    return max ==0 ? 100 : max;
  }

  //calculate week total
  String calculateWeekTotal(ExpenseData value,
      String sunday,
      String monday,
      String tueday,
      String wedday,
      String thuday,
      String firday,
      String satday,){
    List<double> values= [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tueday] ?? 0,
      value.calculateDailyExpenseSummary()[wedday] ?? 0,
      value.calculateDailyExpenseSummary()[thuday] ?? 0,
      value.calculateDailyExpenseSummary()[firday] ?? 0,
      value.calculateDailyExpenseSummary()[satday] ?? 0,
    ];
    double total =0;
    for(int i = 0 ; i<values.length;i++){
      total += values[i];
  }
    return total.toStringAsFixed(2);
  }
  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(startoweek.add(const Duration(days: 0)));
    String monday = convertDateTimeToString(startoweek.add(const Duration(days: 1)));
    String tueday = convertDateTimeToString(startoweek.add(const Duration(days: 2)));
    String wedday = convertDateTimeToString(startoweek.add(const Duration(days: 3)));
    String thuday = convertDateTimeToString(startoweek.add(const Duration(days: 4)));
    String firday = convertDateTimeToString(startoweek.add(const Duration(days: 5)));
    String satday = convertDateTimeToString(startoweek.add(const Duration(days: 6)));
    return Consumer<ExpenseData>(builder: (context,value,child)=>
    Column(
      children :[
        Padding(padding:EdgeInsets.all(25.0),child:  Row (children: [
          const Text( "Week Total : ",style: TextStyle(fontWeight: FontWeight.bold),),
          Text('MMK ${calculateWeekTotal(value, sunday, monday, tueday, wedday, thuday, firday, satday)}')
        ],)),
        SizedBox(
        height: 200,
        child: Bar_Graph(maxY: calculateMax(value, sunday, monday, tueday, wedday, thuday, firday, satday),
        sunAmount: value.calculateDailyExpenseSummary()[sunday]??0,
        monAmount: value.calculateDailyExpenseSummary()[monday]??0,
        tueAmount: value.calculateDailyExpenseSummary()[tueday]??0,
        wedAmount: value.calculateDailyExpenseSummary()[wedday]??0,
        thuAmount: value.calculateDailyExpenseSummary()[thuday]??0,
        firAmount: value.calculateDailyExpenseSummary()[firday]??0,
        satAmount: value.calculateDailyExpenseSummary()[satday]??0,
        ),
      ),
        ]
    )
    );
  }
}
