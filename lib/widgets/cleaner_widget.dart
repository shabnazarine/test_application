import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CleanerCard extends StatelessWidget {

  final int cleanerCount;
  final String imageUrl;
  final Color color;
  final Color borderColor;

  const CleanerCard({super.key, required this.cleanerCount, required this.imageUrl, required this.color, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      //width: 200,
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
            for(int i =0; i<cleanerCount; i++)
              Icon(
                Icons.person,
                color: AppColors.yellowColor,
              ),
            //Image.network(imageUrl),
            SizedBox(width: 10,),
            Text(cleanerCount.toString(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}
