import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class InsertSalary extends StatefulWidget {
  const InsertSalary({Key? key}) : super(key: key);

  @override
  State<InsertSalary> createState() => _InsertSalaryState();
}

class _InsertSalaryState extends State<InsertSalary> {
  final monthController = TextEditingController();
  final salaryAmountController = TextEditingController();
  //final userSalaryController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Salary');
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
                controller: monthController,
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
                  labelText: 'Month',
                  labelStyle: const TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: 'Enter month',
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
                controller: salaryAmountController,
                keyboardType: TextInputType.number,
                cursorColor: Pallete.txt1color,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  labelText: 'Salary',
                  hintText: 'Enter salary amount with bonus',
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
                      'month': monthController.text,
                      'amount': salaryAmountController.text,
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
