import 'package:expensetracker/component/expense_summary.dart';
import 'package:expensetracker/component/expense_title.dart';
import 'package:expensetracker/component/mytextfield.dart';
import 'package:expensetracker/data/expensen_data.dart';
import 'package:expensetracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController amount = TextEditingController();
  TextEditingController name = TextEditingController();
  void initialState(){
    super.initState();
    Provider.of<ExpenseData>(context,listen: false).PrepareDate();
  }
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextField(
                hintText: "Name",
                obscureText: false,
                controller: name,
                icon: null,
                textType: TextInputType.text),
            SizedBox(
              height: 12,
            ),
            MyTextField(
                hintText: "Amount",
                obscureText: false,
                controller: amount,
                icon: null,
                textType: TextInputType.number),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: Theme.of(context).colorScheme.tertiary,
                onPressed: Save,
                child: Text("Save"),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.tertiary,
                onPressed: Calcen,
                child: Text("Calcen"),
              )
            ],
          ),
        ],
      ),
    );
  }

   Delete(ExpenseItem expenseItem){
    Provider.of<ExpenseData>(context,listen:false).deleteExpense(expenseItem);
   }
  Save() {
   if(amount.text.isNotEmpty && name.text.isNotEmpty){
     ExpenseItem newExpe =
     ExpenseItem(name: name.text, amount: amount.text, date: DateTime.now());
     Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpe);
   }
     Navigator.pop(context);
    clear();
  }

  clear() {
    name.clear();
    amount.clear();
  }

  Calcen() {
    clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: addNewExpense,
                child: Icon(Icons.add),
              ),
              body:SafeArea(
                child:
                Container( padding: EdgeInsets.only(top: 10),
                  child: ListView(children :[
                      // weeky barchat
                      ExpenseSummary(startoweek:value.startoWeekDate()),
                      SizedBox(height: 20),
                      //daily list
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: value.getAllexpnselist().length,
                        itemBuilder: (context, index) => ExpenseTitle(
                            amount: value.getAllexpnselist()[index].amount,
                            name: value.getAllexpnselist()[index].name,
                            date: value.getAllexpnselist()[index].date,
                            deleteTapped: (p0)=> Delete(value.getAllexpnselist()[index]),
                        )),
                              ]
                  ),
                ),
              ),
            ));
  }
}
