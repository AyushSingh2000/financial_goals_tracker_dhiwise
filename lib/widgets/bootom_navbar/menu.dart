import 'package:financial_goals_tracker/Pages/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Pages/chart.dart';
import '../../Pages/settings.dart';
import '../../Pages/user_home.dart';
import '../../colors.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _navigateBottomBar(int index) {
    Provider.of<ValueNotifier<int>>(context, listen: false).value = index;
  }

  final List<Widget> _pages = [
    UserHome(),
    UserTransaction(),
    UserCharts(),
    UserSettings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[Provider.of<ValueNotifier<int>>(context).value],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            color: Pallete.txt1color,
          ),
          unselectedLabelStyle: const TextStyle(color: Pallete.txt3color),
          unselectedItemColor: Pallete.txt3color,
          selectedItemColor: Pallete.txt1color,
          currentIndex: Provider.of<ValueNotifier<int>>(context).value,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: Provider.of<ValueNotifier<int>>(context, listen: false)
                              .value ==
                          0
                      ? Pallete.txt1color
                      : Pallete.txt3color),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restart_alt,
                  color: Provider.of<ValueNotifier<int>>(context, listen: false)
                              .value ==
                          1
                      ? Pallete.txt1color
                      : Pallete.txt3color),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart,
                  color: Provider.of<ValueNotifier<int>>(context, listen: false)
                              .value ==
                          2
                      ? Pallete.txt1color
                      : Pallete.txt3color),
              label: 'Chart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: Provider.of<ValueNotifier<int>>(context, listen: false)
                              .value ==
                          3
                      ? Pallete.txt1color
                      : Pallete.txt3color),
              label: 'Settings',
            ),
          ],
        ));
  }
}
