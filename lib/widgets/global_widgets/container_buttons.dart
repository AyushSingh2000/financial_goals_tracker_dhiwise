import 'package:financial_goals_tracker/colors.dart';
import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  ContainerButton(
      {required this.onTap,
      required this.text1,
      required this.imgtext,
      required this.fntsize,
      Key? key})
      : super(key: key);
  VoidCallback onTap;
  String text1;
  String imgtext;
  double fntsize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: 132,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 2.4,
                height: 118,
                decoration: BoxDecoration(
                  color: Pallete.txt2color,
                  borderRadius: BorderRadius.all(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        text1,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: fntsize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 48,
                          child: Image.asset(
                            imgtext,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Pallete.txt1color,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
