import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/colors.dart';
import '../constants/colors.dart';
import '../data/api/item_api.dart';
import '../model/item_model.dart';
import '../widgets/bottom_panel_mobile.dart';
import '../widgets/bottom_panel_widget.dart';
import '../widgets/cleaner_widget.dart';
import '../widgets/list_hours_widget.dart';
import 'package:http/http.dart' as http;

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({super.key});

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {

  int selectedIndex = 0;
  int selectedListIndex = 0;
  //List<Item> itemList = new List<Item>;
  late String totalCleaner = "";
  late String totalHours = "";
  late String imageUrl = "";
  late int unitPrice ;
  //late Map<String, dynamic> itemList = {};
  late List itemList = [];
  late List<Item> itemListFromModel = [];
  late int totalPrice = 0;
  late String selectedItemName = "";

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.4,
            child: Center(
              child: BottomPanelMobile(totalCleaner: selectedIndex+1, itemName: selectedItemName, totalPrice: totalPrice,),
            ),
          );
        });
  }

  void getItemFromApi() async {
    ItemApi.fetchJSON().then((response) {
      setState(() {
        String responseBody = response.body;
        //Map<String, dynamic> myMap = json.decode(responseBody);
        var responseJSON = json.decode(responseBody);
        totalCleaner = responseJSON["data"]["title"];
        totalHours = responseJSON["data"]["itemTitle"];
        imageUrl = responseJSON["data"]["items"][0]["image"];
        unitPrice = responseJSON["data"]["items"][0]["items"][0]["unitPrice"];

        itemList = json.decode(response.body)["data"]["items"][0]["items"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getItemFromApi();
  }

  _onSelected(int index) {
    setState(() => selectedIndex = index);
    totalPrice = itemList[selectedListIndex]['unitPrice'] * (selectedIndex+1);
    //print(totalPrice);
  }

  _onListSelected(int index) {
    setState(() => selectedListIndex = index);
    totalPrice = itemList[selectedListIndex]['unitPrice'] * (selectedIndex+1);
    selectedItemName = itemList[selectedListIndex]['itemName'];
    //print(totalPrice);
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
                Flexible(
                  child: Text("Dubai International Airport (DXB) - Dubai - United Arab Emirates",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.brown2Color.withOpacity(.80),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                ),
                SizedBox(width: 10,),
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
              padding: const EdgeInsets.only(left: 30, top: 10, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(totalCleaner,
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
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      //physics: AlwaysScrollableScrollPhysics(),
                      //shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        Color color = selectedIndex != null && selectedIndex == index
                            ? AppColors.orangeColor
                            : Colors.white;
                        Color borderColor = selectedIndex != null && selectedIndex == index
                            ? AppColors.yellowColor
                            : AppColors.grayColor.withOpacity(.20);
                        return GestureDetector(
                          onTap: (){
                            _onSelected(index);
                          },
                          child: CleanerCard(cleanerCount: index+1,
                            imageUrl: imageUrl, color: color, borderColor: borderColor,),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(totalHours,
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
                        itemCount: itemList.length,
                        itemBuilder: (BuildContext context, int index){
                          String itemName = itemList[index]['itemName'];
                          int unitPrice = itemList[index]['unitPrice'];
                          String subTitle = itemList[index]['subTitle'];
                          String unitOfMeasure = itemList[index]['unitOfMeasure'];
                          Color color = selectedListIndex != null && selectedListIndex == index
                              ? AppColors.orangeColor
                              : Colors.white;
                          Color borderColor = selectedListIndex != null && selectedListIndex == index
                              ? AppColors.yellowColor
                              : AppColors.grayColor.withOpacity(.20);
                          return GestureDetector(
                            onTap: (){
                              _onListSelected(index);
                            },
                              child: HourCard(hours: itemName, unitPrice: unitPrice, title: subTitle, unitOfMeasure: unitOfMeasure,
                                color: color, borderColor: borderColor,)
                          );
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
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Container(
                      //width: 400,
                      width: MediaQuery.of(context).size.width,
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Container(
                height: 35,
                //width: 500,
                width: MediaQuery.of(context).size.width,
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("AED ${totalPrice}",
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
                      padding: const EdgeInsets.only(left: 10),
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
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
