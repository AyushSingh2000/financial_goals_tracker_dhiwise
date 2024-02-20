import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class InsertGoals extends StatefulWidget {
  const InsertGoals({Key? key}) : super(key: key);

  @override
  State<InsertGoals> createState() => _InsertGoalsState();
}

class _InsertGoalsState extends State<InsertGoals> {
  final goalsController = TextEditingController();
  final goalAmountController = TextEditingController();
  final savingsController = TextEditingController();
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Goals');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: goalsController,
                keyboardType: TextInputType.text,
                cursorColor: Pallete.txt1color,
                autofocus: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Goals',
                  labelStyle: const TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: 'Enter Goals Description',
                  hintStyle: const TextStyle(
                    color: Pallete.txt3color,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: goalAmountController,
                keyboardType: TextInputType.number,
                cursorColor: Pallete.txt1color,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  labelText: 'Amount',
                  hintText: 'Enter goal\'s amount',
                  hintStyle: const TextStyle(
                    color: Pallete.txt3color,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  labelStyle: const TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: savingsController,
                keyboardType: TextInputType.number,
                cursorColor: Pallete.txt1color,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  labelText: 'Savings',
                  hintText: 'Enter amount to be saved',
                  hintStyle: const TextStyle(
                    color: Pallete.txt3color,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  labelStyle: const TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // TextField(
              //   controller: userSalaryController,
              //   keyboardType: TextInputType.phone,
              //   cursorColor: Pallete.txt1color,
              //   decoration: InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     labelText: 'Salary',
              //     labelStyle: TextStyle(
              //       color: Pallete.txt1color,
              //       fontSize: 17,
              //       fontFamily: 'Poppins',
              //       fontWeight: FontWeight.w500,
              //     ),
              //     hintText: 'Enter Your Salary',
              //     hintStyle: TextStyle(
              //       color: Pallete.txt3color,
              //       fontSize: 17,
              //       fontFamily: 'Poppins',
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.mainbgcolor,
                  ),
                  onPressed: () {
                    Map<String, String> students = {
                      'goal': goalsController.text,
                      'amount': goalAmountController.text,
                      'savings': savingsController.text,
                      // 'salary': userSalaryController.text
                    };

                    dbRef.push().set(students);
                    Navigator.pop(context, 'ok');
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Pallete.txt2color,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
