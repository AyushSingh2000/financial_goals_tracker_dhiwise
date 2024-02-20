import 'package:financial_goals_tracker/colors.dart';
import 'package:flutter/material.dart';

class FetchContainer extends StatelessWidget {
  FetchContainer({required this.text1, required this.text2, Key? key})
      : super(key: key);

  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.sizeOf(context).width / 1.12,
            height: 72,
            decoration: BoxDecoration(
              color: Pallete.txt2color,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 5,
                  offset: const Offset(-4, 2),
                  spreadRadius: 3,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 40,
                          width: 36,
                          child: Image.asset('assets/bill.png')),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Description: $text1',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Amount: $text2',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: 40,
                          width: 36,
                          child: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.edit,
                                size: 24,
                              ))),
                      Container(
                          height: 40,
                          width: 40,
                          child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.delete,
                                size: 24,
                              ))),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
