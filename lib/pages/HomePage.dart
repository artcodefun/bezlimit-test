import 'dart:math';

import 'package:bezlimit/components/ContentPartView.dart';
import 'package:bezlimit/components/ElementView.dart';
import 'package:bezlimit/controllers/ElementController.dart';
import 'package:bezlimit/controllers/VerticalScrollController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'ElementPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double topExtent = 400;
    double elementHPadding = 10;
    double elementSize = 100;
    var vController = Get.put(VerticalScrollController());
    var eController = Get.put(
        ElementController(elementWidth: elementSize + 2 * elementHPadding));

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: -50,
              top: -50,
              child: Obx(() => Transform.rotate(
                    angle: vController.position.value / 100,
                    child: SvgPicture.asset(
                      "assets/images/circle.svg",
                      height: 300,
                      width: 300,
                    ),
                  ))),
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
                    height: elementSize,
                    child: ListView.builder(
                        controller: eController.scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: eController.elementsCount,
                        itemBuilder: (ctx, i) {
                          var r = Random(i);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () => Get.to(() => ElementPage(
                                    initial: i,
                                  )),
                              child: ElementView(
                                color: i == eController.chosenElement.value
                                    ? Color.fromARGB(255, r.nextInt(256),
                                        r.nextInt(256), r.nextInt(256))
                                    : null,
                                child: Center(
                                    child: Text(
                                  "$i",
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                                size: elementSize,
                              ),
                            ),
                          );
                        }),
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
