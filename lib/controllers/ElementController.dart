import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ElementController extends GetxController {
  ElementController({int? initial, required this.elementWidth, this.elementsCount=100}) : chosenElement=RxnInt(initial),  super();

  final int elementsCount;

  final double elementWidth;

  final RxnInt chosenElement;

  late ScrollController _controller;

  ScrollController get scrollController => _controller;

  chooseElement(int? element){
    chosenElement.value=element;
  }

  TextEditingController? _textEditingController;

  TextEditingController get textEditingController => _textEditingController ?? getNewTextEditingController();

  TextEditingController getNewTextEditingController([String? initial]){
    _textEditingController?.dispose();
    return _textEditingController = TextEditingController(text: initial);
  }

  @override
  void onInit() {
    _controller = ScrollController();

    _listenChosenElementToScroll();

    super.onInit();
  }

  _listenChosenElementToScroll(){
    chosenElement.listen((p0) {
      if(p0==null) return;
      _controller.animateTo(p0*elementWidth, curve: Curves.easeInOut, duration: Duration(seconds: 1));
    });
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
