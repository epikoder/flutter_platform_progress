import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

abstract class PlatformWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  I createIosWidget(BuildContext context);
  A createAndroidWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return createIosWidget(context);
    }
    return createAndroidWidget(context);
  }
}

class PlatformProgress
    extends PlatformWidget<CupertinoActivityIndicator, Center> {
  @override
  Center createAndroidWidget(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: Colors.blue,
      ),
    );
  }

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: 15,
    );
  }
}

abstract class ViewProgress {
  setBusy(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Color(0x3E908F8F),
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: PlatformProgress(),
          );
        });
  }

  setIdle(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
