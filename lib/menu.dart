import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/input_budget.dart';
import 'package:counter_7/show_budget.dart';

class DrawMenu extends StatelessWidget {
  const DrawMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'counter_7')));
            },
          ),
          ListTile( title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InputBudgetPage()));
            },
          ),
          ListTile( title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShowBudgetPage()));
            },
          ),
        ],
      ),
    );
  }
}
