import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toast/toast.dart';

import '../colors.dart';
import '../widgets/circular_progress_indicator/circular_loader.dart';
import '../widgets/show_contribution_bottommodal.dart';

//Icons for goals
final List<Icon> iconlist = [
  Icon(Icons.screenshot_monitor_rounded),
  Icon(Icons.snowshoeing_sharp),
  Icon(Icons.car_rental_rounded),
  Icon(Icons.home_rounded),
  Icon(Icons.directions_bike_rounded),
];

class UserCharts extends StatefulWidget {
  const UserCharts({super.key});

  @override
  State<UserCharts> createState() => _UserChartsState();
}

class _UserChartsState extends State<UserCharts> {
  //firebase reference
  final databaseref = FirebaseDatabase.instance.ref("Goals");

  bool isAnim = false;
  Color bgColor = Pallete.mainbgcolor;

  String calculateThirdOfAmount(String amountString) {
    double amount = double.tryParse(amountString) ?? 0.0;
    double third = amount / 3;

    // Format the result to have two decimal places
    String formattedResult = third.toStringAsFixed(2);

    return formattedResult;
  }

  String subtractFromFormattedResult(String amountString) {
    double amount = double.tryParse(amountString) ?? 0.0;
    double formattedResult =
        double.tryParse(calculateThirdOfAmount(amountString)) ?? 0.0;

    // Subtract amount from formattedResult
    double result = amount - formattedResult;

    String savedamount = result.toStringAsFixed(2);

    return savedamount;
  }

  double calculateSavingsPercentage(
      String savedAmountString, String amountString) {
    double savedAmount = double.tryParse(savedAmountString) ?? 0.0;
    double amount = double.tryParse(amountString) ?? 0.0;

    if (amount != 0.0) {
      double savingsPercentage = (savedAmount / amount).clamp(0.0, 1.0);
      return savingsPercentage;
    } else {
      // Handle the case where amount is zero to avoid division by zero
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //theme for text

      home: Scaffold(
        backgroundColor: Pallete.mainbgcolor,
        body: SafeArea(
          // top level column
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(

                //top level column
                child: Column(
              children: [
                //stream builder to fetch data from --> firebase
                StreamBuilder(
                  stream: databaseref.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData && !snapshot.hasError) {
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();

                      // slider for sliding effect
                      return CarouselSlider.builder(
                          itemCount: 5,
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.68,
                            enlargeCenterPage: false,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(
                                () {
                                  isAnim = true;
                                },
                              );
                            },
                          ),
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),

                                //top title
                                Text(
                                  "Buy a dream ${list[itemIndex]["goal"]}",
                                  style: const TextStyle(
                                    color: Pallete.txt2color,
                                    fontSize: 27,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 35,
                                ),

                                // home progress indicator, package used percent indicator
                                CircularPercentIndicator(
                                  radius: 120.0,
                                  lineWidth: 6.5,
                                  percent: calculateSavingsPercentage(
                                      subtractFromFormattedResult(
                                          list[itemIndex]['amount']),
                                      list[itemIndex]['amount']),
                                  progressColor: Colors.white,
                                  arcBackgroundColor: Colors.grey,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  animationDuration: 1800,
                                  animation: true,
                                  restartAnimation: isAnim,
                                  arcType: ArcType.FULL,
                                  center: Column(
                                    children: [
                                      const SizedBox(
                                        height: 17,
                                      ),

                                      //dream icon
                                      Icon(
                                        iconlist[itemIndex % iconlist.length]
                                            .icon,
                                        color: Colors.white,
                                        size: 130,
                                      ),

                                      //dream amount invested
                                      Text(
                                        "\$${subtractFromFormattedResult(list[itemIndex]['amount'])}",
                                        style: const TextStyle(
                                          color: Pallete.txt2color,
                                          fontSize: 25,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      //you saved text
                                      const Text(
                                        "You saved",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                // smooth page indicator -- dots indicator
                                AnimatedSmoothIndicator(
                                  activeIndex: itemIndex,
                                  count: 5,
                                  effect: const WormEffect(
                                    activeDotColor: Colors.white,
                                    dotColor: Colors.grey,
                                    dotHeight: 9,
                                    dotWidth: 9,
                                  ),
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                //dream name and total amount
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // goal text
                                          Text(
                                            "Goal",
                                            style: TextStyle(
                                              color: Pallete.txt2color,
                                              fontSize: 17,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          //you saved text
                                          Text(
                                            "by Jan 2024",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),

                                      //toat amount of goal text
                                      Text(
                                        "\$${list[itemIndex]['amount']}",
                                        style: const TextStyle(
                                          color: Pallete.txt2color,
                                          fontSize: 17,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                //light blue container for more savings and monthly projection
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          //more savings
                                          Row(
                                            children: [
                                              //more savings text
                                              const Text(
                                                "Need more Savings",
                                                style: TextStyle(
                                                  color: Pallete.txt1color,
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Spacer(),

                                              //remaining amount text
                                              Text(
                                                "\$${calculateThirdOfAmount(list[itemIndex]['amount'])}",
                                                style: const TextStyle(
                                                  color: Pallete.txt1color,
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          //monthly target
                                          Row(
                                            children: [
                                              //monthly target amount text
                                              const Text(
                                                "Monthly Savings Projection",
                                                style: TextStyle(
                                                  color: Pallete.txt1color,
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "\$${list[itemIndex]['savings']}",
                                                style: const TextStyle(
                                                  color: Pallete.txt1color,
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),
                              ],
                            );
                          });
                    } else {
                      // if snapshot data is null, this progress bar will be shown
                      return const CircularLoader();
                    }
                  },
                ),

                // custom container for showing contributions and history
                ContributionTab(),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
