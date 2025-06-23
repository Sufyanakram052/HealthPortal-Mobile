import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'loader.dart';

class CustomSmartRefresher extends StatelessWidget {
  const CustomSmartRefresher(
      {super.key, this.child, this.onLoading, required this.controller});

  final Widget? child;
  final Function()? onLoading;
  final RefreshController controller;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      onLoading: onLoading,
      controller: controller,
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body = const SizedBox.shrink();
          if (mode == LoadStatus.idle) {
            // body =  Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = const Loader();
          } else if (mode == LoadStatus.failed) {
            // body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            // body = Text("release to load more");
          } else {
            // body = Text("No more Data");
          }
          return SizedBox(
            height: 100.0,
            child: Column(
              children: [
                body,
              ],
            ),
          );
        },
      ),
      child: child,
    );
  }
}
