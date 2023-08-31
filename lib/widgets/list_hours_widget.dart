import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HourCard extends StatelessWidget {

  final String hours;
  final int unitPrice;
  final String title;
  final String unitOfMeasure;
  final Color color;
  final Color borderColor;

  const HourCard({super.key, required this.hours, required this.unitPrice, required this.title, required this.unitOfMeasure,
    required this.color, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
        Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color.withOpacity(.20),
            border: Border.all(color: borderColor,
              width: 1
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(hours,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                //maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              SizedBox(width: 20,),
            ],
          ),
        ),
      ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("AED 40.00/hr",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grayColor,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        decoration: TextDecoration.lineThrough
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text("AED" + unitPrice.toString() +"/" + unitOfMeasure,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.greenColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
                Text(title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
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
