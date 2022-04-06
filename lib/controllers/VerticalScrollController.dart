
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerticalScrollController extends GetxController {
  VerticalScrollController({required this.topExtent}) : super();

  final double topExtent;

  final RxDouble position = 0.0.obs;

  late ScrollController _controller;

  ScrollController get scrollController => _controller;

  @override
  void onInit() {
    _controller = ScrollController();

    _controller.addListener(() {
      position.value = _controller.offset;
    });
    _listenPositionToShowSnackBar();

    super.onInit();
  }

  _listenPositionToShowSnackBar(){
    bool canShowSnack = true;
    bool showingSnack =false;
    Duration snackDuration = Duration(seconds: 3);

    position.listen((p0) {
      if(showingSnack)return;

      if (canShowSnack && p0 >= topExtent) {
        Get.snackbar("Hi!", "It's a snackbar", snackPosition: SnackPosition.BOTTOM, duration: snackDuration);
        showingSnack=true;
        Future.delayed(snackDuration).whenComplete(() => showingSnack=false);
        canShowSnack = false;
      }
      if(!canShowSnack && p0<topExtent){
        canShowSnack=true;
      }
    });
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
