import 'package:flutter/material.dart';
import 'package:test_application/screens/home_view_large.dart';
import 'package:test_application/screens/home_view_mobile.dart';
import 'package:test_application/screens/home_view_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1000) {
            if(constraints.maxWidth<600){
              return const HomeViewMobile();
            }else{
              return const HomeViewSmall();
            }
          } else {
            return const HomeViewLarge();
          }
        },
      ),
    );
  }
}
