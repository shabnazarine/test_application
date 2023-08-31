import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Text("Back",
          style: TextStyle(
            color: AppColors.yellowColor
          ),),
        ),
      ),
    );
  }
}
