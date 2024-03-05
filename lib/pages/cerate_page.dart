import 'package:expensetracker/component/mytextfield.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});
  TextEditingController amount = TextEditingController();
  TextEditingController title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (Column(
          children: [
            MyTextField(
              hintText: "Title",
              obscureText: false,
              controller: title,
              textType: TextInputType.text,
              icon: null,
            ),
            SizedBox(height: 12),
            MyTextField(
              hintText: "Amount",
              obscureText: false,
              controller: amount,
              textType: TextInputType.number,
              icon: null,
            )
          ],
        )),
      ),
    );
  }
}
