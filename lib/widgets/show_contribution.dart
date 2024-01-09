import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../colors.dart';

// --> creating custom container for contribution detail at home homePage

class ContributionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Pallete.txt2color),
      child: Padding(
        padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
        child: Column(
          children: [
            // contribution --> show history
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Contributions",
                  style: TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                //you saved text
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Show History",
                    style: TextStyle(
                      color: Pallete.txt1color,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),

            //linear indicator
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width * 0.87,
              lineHeight: 12.0,
              backgroundColor: Colors.grey,
              barRadius: Radius.circular(15),
              clipLinearGradient:
                  true, // Clip the gradient to the bounds of the progress bar
              padding: EdgeInsets
                  .zero, // Remove padding to properly align the progress segments
              animation: true,
              animateFromLastPercent: true,
              linearGradient: const LinearGradient(
                colors: [
                  Pallete.P1blue,
                  Pallete.P1blue,
                  Pallete.P2yellow,
                  Pallete.P2yellow,
                  Pallete.P3green,
                  Pallete.P3green,
                ],
                stops: [
                  0.0,
                  0.7,
                  0.7,
                  0.9,
                  0.9,
                  1.0,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              percent:
                  1.0, // Set to 1.0 for demonstration (represents full progress)
            ),
            const SizedBox(
              height: 20,
            ),
            //monthly salary
            Row(
              children: [
                // dot indicator
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Monthly Salary",
                  style: TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                //you saved text
                const Text(
                  "\$15,000",
                  style: TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),

            // monthly expanses
            const SizedBox(
              height: 12,
            ),

            Row(
              children: [
                // dot indicator
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Pallete.txt5color,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Monthly Expenses",
                  style: TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                //you saved text
                const Text(
                  "\$10,000",
                  style: TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),

            // monthly investment
            SizedBox(
              height: 12,
            ),

            Row(
              children: [
                // dot indicator
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Pallete.txt4color,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Total Investment",
                  style: TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                //you saved text
                const Text(
                  "\$5,000",
                  style: TextStyle(
                    color: Pallete.txt1color,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
