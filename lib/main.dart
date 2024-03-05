import 'package:expensetracker/data/expensen_data.dart';
import 'package:expensetracker/pages/homePage.dart';
import 'package:expensetracker/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize hive
  await Hive.initFlutter();
  //open hive
  await Hive.openBox("expense_db");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>ExpenseData(),
    builder: (context,child)=>MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: lightMode,)
    );
  }
}
