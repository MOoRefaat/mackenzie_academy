import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/widgets/loader_widget.dart';

class LoadingManager{
  bool isLoading = false;

  void changeState() {
    // setState(() {});
  }

  void runChangeState() {
    changeState();
  }

  void showLoading() async {
    if (!isLoading) {
      isLoading = true;
      runChangeState();
    }
  }

  void hideLoading() async {
    if (isLoading) {
      isLoading = false;
      runChangeState();
    }
  }

  Widget loadingManagerWidget() {
    if (isLoading) {
      return customLoadingWidget();
    } else {
      return getEmptyWidget();
    }
  }

  Widget customLoadingWidget() {
    return FullScreenLoaderWidget.onlyAnimation();
  }

  Widget getEmptyWidget() {
    return const SizedBox.shrink();
  }
}