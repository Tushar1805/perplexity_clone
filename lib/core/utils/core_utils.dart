import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/app_colors.dart';
import '../resources/app_images.dart';

// void showToast(final String message) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.CENTER,
//     backgroundColor: Colors.black,
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }

Future<bool> isInternetConnected() async {
  final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    return true;
  }

  return false;
}

void customPrint(final Object? value) {
  if (kDebugMode) {
    print(value);
  }
}

void showLoaderDialog(final BuildContext context, final String? message) {
  final alert = AlertDialog(
    content: Row(
      children: [
        CircularProgressIndicator(),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Text(message ?? ''),
        ),
      ],
    ),
  );
  showDialog<AlertDialog>(
    barrierDismissible: false,
    context: context,
    useRootNavigator: false,
    builder: (final BuildContext context) => alert,
  );
}

void showIOSAlertDialog(
  final BuildContext context, {
  required final String title,
  final String? subtitle,
}) {
  showCupertinoDialog<void>(
    context: context,
    builder: (final BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(subtitle ?? ''),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          textStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

void popDialog(final BuildContext context) {
  Navigator.pop(context);
}

void showToast({
  required final FToast fToast,
  required final BuildContext context,
  required final String msg,
  final ToastGravity? gravity,
  final int duration = 2,
}) {
  final toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: AppColors.background,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 12,
          child: Image.asset(
            AppImages.appLogoIcon,
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Flexible(
          child: Text(
            msg,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
  fToast.showToast(
    child: toast,
    gravity: gravity ?? ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: duration),
  );
}
