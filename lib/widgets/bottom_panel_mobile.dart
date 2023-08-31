import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_application/constants/colors.dart';

class BottomPanelMobile extends StatelessWidget {
  final int totalCleaner;
  final String itemName;
  final int totalPrice;
 // final Context context;

  const BottomPanelMobile({super.key, required this.totalCleaner, required this.itemName, required this.totalPrice});

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
          width: 300,
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
                    Text("${totalCleaner} Cleaner, ${itemName}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Text("AED ${totalPrice}",
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
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("Edit",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.blueColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blueColor,
                    ),),
                ),
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
              Text("AED ${totalPrice}",
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
              Text("AED ${totalPrice}",
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
