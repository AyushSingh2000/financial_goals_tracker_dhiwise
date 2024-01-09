import 'package:financial_goals_tracker/colors.dart';
import 'package:financial_goals_tracker/widgets/fetch_container.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FetchSalary extends StatefulWidget {
  const FetchSalary({Key? key}) : super(key: key);

  @override
  State<FetchSalary> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchSalary> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Salary');

  Widget listItem({required Map salary}) {
    return Container(
      height: 110,
      color: Pallete.mainbgcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FetchContainer(
            text1: salary['month'],
            text2: salary['amount'],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map salary = snapshot.value as Map;
            salary['key'] = snapshot.key;

            return listItem(salary: salary);
          },
        ),
      ),
    );
  }
}
