import 'package:financial_goals_tracker/colors.dart';
import 'package:financial_goals_tracker/widgets/global_widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/add/add_goals.dart';
import '../widgets/add/add_salary.dart';
import '../widgets/global_widgets/container_buttons.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.mainbgcolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome User',
                        style: TextStyle(
                          color: Pallete.txt2color,
                          fontSize: 32,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 20),
                    child: IconButton(
                      icon: const Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Pallete.txt2color,
                      ),
                      onPressed: () {
                        Provider.of<ValueNotifier<int>>(context, listen: false)
                            .value = 3;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Row(
                children: [
                  ContainerButton(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text(
                          'Enter Monthly Salary',
                          style: TextStyle(
                            color: Pallete.txt1color,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        content: InsertSalary(),
                        backgroundColor: Pallete.txt2color,
                      ),
                    ),
                    text1: 'Enter Salary',
                    imgtext: 'assets/undraw_Credit_card_re_blml.png',
                    fntsize: 20,
                  ),
                  ContainerButton(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text(
                          'Enter Financial Goal',
                          style: TextStyle(
                            color: Pallete.txt1color,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        content: InsertGoals(),
                        backgroundColor: Pallete.txt2color,
                      ),
                    ),
                    text1: 'Enter Financial goals',
                    imgtext: 'assets/undraw_Pie_graph_re_fvol.png',
                    fntsize: 18,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                  onTap: () {
                    Provider.of<ValueNotifier<int>>(context, listen: false)
                        .value = 1;
                  },
                  text1: 'Manage and Track\n Your Transactions',
                  imgtext: 'assets/undraw_Credit_card_re_blml.png',
                  fntsize: 20),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                  onTap: () {
                    Provider.of<ValueNotifier<int>>(context, listen: false)
                        .value = 2;
                  },
                  text1: 'Check your Financial \ngoals',
                  imgtext: 'assets/undraw_Pie_graph_re_fvol.png',
                  fntsize: 20),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            title: Text(
              'Enter Monthly Salary',
              style: TextStyle(
                color: Pallete.txt1color,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            content: InsertSalary(),
            backgroundColor: Pallete.txt2color,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Pallete.txt2color,
        label: const Text(
          'Enter Salary',
          style: TextStyle(
            color: Pallete.txt1color,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: const Icon(
          Icons.wallet,
          color: Pallete.txt1color,
        ),
      ),
    );
  }
}
