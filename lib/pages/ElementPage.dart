import 'package:bezlimit/controllers/ElementController.dart';
import 'package:bezlimit/helpers/CorrectIntInputFormatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ElementPage extends StatelessWidget {
  ElementPage({Key? key, required int initial}) : super(key: key) {
    ElementController controller = Get.find();
    controller.getNewTextEditingController(
        initial.toString());
  }

  @override
  Widget build(BuildContext context) {
    ElementController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Element Page"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CorrectIntInputFormatter(
                        maxValue: controller.elementsCount - 1)
                  ],
                  autofocus: true,
                  controller: controller.textEditingController,
                  style: Theme.of(context).textTheme.headline4,
                  decoration: InputDecoration(
                      hintText:
                          "Element's index (max=${controller.elementsCount - 1} )"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.chooseElement(int.tryParse(controller.textEditingController.text));
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Save",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ))
            ],
          ),
        ));
  }
}
