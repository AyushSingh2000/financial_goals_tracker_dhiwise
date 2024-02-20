import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets/add/add_transactions.dart';
import '../widgets/fetch/fetch_container.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final ref = FirebaseDatabase.instance.ref('Students');

  double calculateTotalAmount(List<dynamic> transactions) {
    double totalAmount = 0.0;
    for (var transaction in transactions) {
      double amount = double.tryParse(transaction['amount'] ?? '0.0') ?? 0.0;
      totalAmount += amount;
    }

    return totalAmount;
  }

  Widget buildPieChart(List<dynamic> transactions) {
    List<PieChartSectionData> sections = [];
    List<Color> brightColors = [
      Colors.amber,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red.shade500,
      Colors.grey,
      Colors.tealAccent,
      Colors.pinkAccent
    ];
    for (int i = 0; i < transactions.length; i++) {
      double amount =
          double.tryParse(transactions[i]['amount'] ?? '0.0') ?? 0.0;
      Color sectionColor = brightColors[i % brightColors.length];

      sections.add(
        PieChartSectionData(
          color: sectionColor,
          value: amount,
          title: '\$${amount.toStringAsFixed(2)}',
          radius: 100,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    return PieChart(
      PieChartData(
        sections: sections,
        borderData: FlBorderData(show: false),
        centerSpaceRadius: 20,
        sectionsSpace: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.mainbgcolor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Transaction Details',
                  style: TextStyle(
                    color: Pallete.txt2color,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: ref.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Pallete.txt2color,
                        )),
                      );
                    } else {
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();
                      double totalAmount = calculateTotalAmount(list);
                      return Column(
                        children: [
                          Container(
                            height: 100,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Total Expense:\n\$${totalAmount.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Pallete.txt2color,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    'Monthly Salary:\n\$15000',
                                    style: TextStyle(
                                      color: Pallete.txt2color,
                                      fontSize: 19,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 250, // Adjust the height as needed
                            child: buildPieChart(list),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.separated(
                              itemCount:
                                  snapshot.data!.snapshot.children.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: 10);
                              },
                              itemBuilder: (context, index) {
                                return FetchContainer(
                                  text1: list[index]['transaction'],
                                  text2: list[index]['amount'],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => const AlertDialog(
                  title: Text(
                    'Enter Transactions',
                    style: TextStyle(
                      color: Pallete.txt1color,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  content: InsertData(),
                  backgroundColor: Pallete.txt2color,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              backgroundColor: Pallete.txt2color,
              label: const Text(
                'Enter Transactions',
                style: TextStyle(
                  color: Pallete.txt1color,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              icon: const Icon(
                Icons.edit,
                color: Pallete.txt1color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
