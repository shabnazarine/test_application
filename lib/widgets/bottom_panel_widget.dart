import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_application/constants/colors.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Container(
              width: 200,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.grayColor.withOpacity(.50)
              ),
            ),
          ),
        ),
        SizedBox(height: 40,),
        Container(
          width: 500,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grayColor.withOpacity(.50)),
            color: Colors.orangeAccent.withOpacity(.10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("1 Cleaner, 2 hours+ 30 mins",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Text("AED 85.00",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Edit",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blueColor,
                  ),),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sub Total",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text("AED 85.00",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total (Inclusive 5% VAT)",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text("AED 85.00",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
