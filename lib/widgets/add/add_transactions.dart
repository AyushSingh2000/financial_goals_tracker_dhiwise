import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final transactionNameController = TextEditingController();
  final amountController = TextEditingController();
  //final userSalaryController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
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
                controller: transactionNameController,
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
                  labelText: 'Transaction Title',
                  labelStyle: const TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: 'Enter description',
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
                controller: amountController,
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
                  hintText: 'Enter amount spent',
                  hintStyle: const TextStyle(
                    color: Pallete.txt3color,
                    fontSize: 17,
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
                      'transaction': transactionNameController.text,
                      'amount': amountController.text,
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
