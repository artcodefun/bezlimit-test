import 'package:bezlimit/components/ContentPartView.dart';
import 'package:bezlimit/components/ElementView.dart';
import 'package:bezlimit/controllers/VerticalScrollController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double topExtent = 400;
    var vController =Get.put(VerticalScrollController(topExtent: topExtent));

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -50,
            top: -50,
            child:
                Obx(()=>Transform.rotate(
                  angle: vController.position.value/100,
                  child: SvgPicture.asset(
                    "assets/images/circle.svg",
                    height: 300,
                    width: 300,
                  ),
                ))
          ),
          Positioned.fill(
              child: SingleChildScrollView(
                controller: vController.scrollController,
            child: Container(
              margin: EdgeInsets.only(top: topExtent),
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: ContentPartView(width: (i + 1) * 100),
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: ElementView.size,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 100,
                        itemBuilder: (ctx, i) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ElementView(child: Center(child: Text("$i", style: Theme.of(context).textTheme.headline6,)),),
                        )),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
