import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../data/api/item_api.dart';
import '../widgets/bottom_panel_widget.dart';
import '../widgets/cleaner_widget.dart';
import '../widgets/list_hours_widget.dart';

class HomeViewSmall extends StatefulWidget {
  const HomeViewSmall({super.key});

  @override
  State<HomeViewSmall> createState() => _HomeViewSmallState();
}

class _HomeViewSmallState extends State<HomeViewSmall> {

  bool showProgress = false;
  late String displayText = "";
  int selectedIndex = 0;
  int selectedListIndex = 0;
  //List<Item> itemList = new List<Item>;
  late String totalCleaner = "";
  late String totalHours = "";
  late String imageUrl = "";
  late int unitPrice ;
  //late Map<String, dynamic> itemList = {};
  late List itemList = [];
  late List subItemList = [];
  late int totalPrice = 0;
  late String selectedItemName = "";

  late String itemName = "";
  late int subUnitPrice = 0;
  late String subTitle = "";
  late String unitOfMeasure = "";

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: MediaQuery.of(context).size.height  * 0.4,
            child: Center(
              child: BottomPanel(totalCleaner: selectedIndex+1, itemName: selectedItemName, totalPrice: totalPrice,),
            ),
          );
        });
  }

  void getItemFromApi() async {
    ItemApi.fetchJSON(context).then((response) async {
      if(response != null){
        String responseBody = response.body;
        //Map<String, dynamic> myMap = json.decode(responseBody);
        var responseJSON = json.decode(responseBody);
        totalCleaner = responseJSON["data"]["title"];
        totalHours = responseJSON["data"]["itemTitle"];
        imageUrl = responseJSON["data"]["items"][0]["image"];
        unitPrice = responseJSON["data"]["items"][0]["items"][0]["unitPrice"];

        itemList = json.decode(response.body)["data"]["items"];

        subItemList = itemList[selectedIndex]["items"];
        //print(temp);
        //subItemList = json.decode(response.body)["data"]["items"][0]["items"];

        //print(subItemList);
        await Future.delayed(const Duration(seconds: 5));
        setState(() {
          showProgress = false;
        });
      }else{

      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      showProgress = true;
    });
    getItemFromApi();
  }

  _onSelected(int index) {
    setState(() => selectedIndex = index);
    totalPrice = subItemList[selectedListIndex]['unitPrice'];
    //print(totalPrice);
  }

  _onListSelected(int index) {
    setState(() => selectedListIndex = index);
    totalPrice = subItemList[selectedListIndex]['unitPrice'];
    selectedItemName = subItemList[selectedListIndex]['itemName'];
    //print(totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return !showProgress ? Scaffold(
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
            const SizedBox(height: 5,),
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
                const SizedBox(width: 20,),
                const Text("Change Location",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(width: 10,),
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
                  Text(totalCleaner,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 80,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        Color color = selectedIndex == index
                            ? AppColors.orangeColor
                            : Colors.white;
                        Color borderColor = selectedIndex == index
                            ? AppColors.yellowColor
                            : AppColors.grayColor.withOpacity(.20);
                        displayText = itemList[index]['displayText'];
                        return GestureDetector(
                          onTap: (){
                            _onSelected(index);
                            totalPrice = 0;
                            selectedListIndex = 0;
                            subItemList = itemList[selectedIndex]["items"];
                            //totalPrice = subItemList[selectedListIndex]['unitPrice'];
                            //print(temp);
                          },
                          child: CleanerCard(cleanerCount: displayText,
                            imageUrl: imageUrl, color: color, borderColor: borderColor,),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(totalHours,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemCount: subItemList.length,
                        itemBuilder: (BuildContext context, int index){

                          itemName = subItemList[index]['itemName'];
                          subUnitPrice = subItemList[index]['unitPrice'];
                          subTitle = subItemList[index]['subTitle'];
                          unitOfMeasure = subItemList[index]['unitOfMeasure'];

                          Color color = selectedListIndex == index
                              ? AppColors.orangeColor
                              : Colors.white;
                          Color borderColor = selectedListIndex == index
                              ? AppColors.yellowColor
                              : AppColors.grayColor.withOpacity(.20);
                          return GestureDetector(
                              onTap: (){
                                _onListSelected(index);
                              },
                              child: HourCard(hours: itemName, unitPrice: subUnitPrice, title: subTitle, unitOfMeasure: unitOfMeasure,
                                color: color, borderColor: borderColor,)
                          );
                        }),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Mention any special instruction here..",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 10,),
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
                child: const Center(
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
                      Text("AED $totalPrice",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Row(
                        children: [
                          const Text("View Order Summary",
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.brown2Color,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              displayBottomSheet(context);
                            },
                            child: const Icon(
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
                      child: const Center(
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
            const SizedBox(height: 20,)
          ],
        ),
      ),
    )
        : const Center(
      child: CircularProgressIndicator(
        color: AppColors.yellowColor,
      ),
    );
  }
}
