import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/controll.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GetBuilder<HomeController>(builder: (logic) {
            return RefreshIndicator(onRefresh:logic.pullToRefresh,
              child: ListView.builder(controller:logic.scrollController,
                  itemCount: logic.myDataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap: (){
logic.changeColor(index);
                    },
                      child: Card(color:logic.myDataList[index].backColor?Colors.greenAccent:Colors.white ,elevation: 8,child: Column(children: [
                        Text(logic.myDataList[index].name!),
                          Text(logic.myDataList[index].language!)
                        ,
                        Text(logic.myDataList[index].classification!)
                        ,
                        Text(logic.myDataList[index].created!)
                        ,
                        Text(logic.myDataList[index].skinColors!)
                      ]),),
                    );
                  }),
            );
          }),
        ),
      ),
    );
  }
}
