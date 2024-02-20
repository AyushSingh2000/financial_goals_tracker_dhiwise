import 'package:flutter/material.dart';

import '../../colors.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.69,
        child: Center(
            child: CircularProgressIndicator(
          color: Pallete.txt2color,
        )));
  }
}
