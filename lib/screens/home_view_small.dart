import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/bottom_panel_widget.dart';
import '../widgets/cleaner_widget.dart';
import '../widgets/list_hours_widget.dart';

class HomeViewSmall extends StatefulWidget {
  const HomeViewSmall({super.key});

  @override
  State<HomeViewSmall> createState() => _HomeViewSmallState();
}

class _HomeViewSmallState extends State<HomeViewSmall> {

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.4,
            child: Center(
              child: BottomPanel(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGrayColor.withOpacity(.20),
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black.withOpacity(.80),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Maid Service",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(.80),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 5,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dubai International Airport (DXB) - Dubai - United Arab Emirates",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.brown2Color.withOpacity(.80),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(width: 20,),
                Text("Change Location",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(width: 10,),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How many cleaners do you need?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 80,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1/1.8,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      //physics: AlwaysScrollableScrollPhysics(),
                      //shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return CleanerCard(cleanerCount: index+1, imageUrl: '', color: Colors.amberAccent, borderColor: Colors.amberAccent,);
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("How many hours do you need?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index){
                          return HourCard(hours: '', unitPrice: 0, title: '', unitOfMeasure: '', color: Colors.amberAccent, borderColor: Colors.amberAccent,);
                        }),
                  ),
                  SizedBox(height: 20,),
                  Text("Mention any special instruction here..",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 400,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.grayColor.withOpacity(.50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text("Mention any special instruction here..",
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.grayColor.withOpacity(.50),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Container(
                height: 35,
                width: 500,
                color: AppColors.lightGreenColor.withOpacity(.40),
                child: Center(
                  child: Text("2 Promos available at checkout",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.forestGreenColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("AED 85.00",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Row(
                        children: [
                          Text("View Order Summary",
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.brown2Color,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              displayBottomSheet(context);
                            },
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: AppColors.brown2Color,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.orangeColor
                      ),
                      child: Center(
                        child: Text("Proceed to Book",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
