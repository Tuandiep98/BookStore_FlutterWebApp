import 'package:flutter/material.dart';

class DialogUtils {
  static Future<void> showDialogWithChild(
    BuildContext context, {
    Widget child = const SizedBox(),
    bool barrierDismissible = true,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: IntrinsicHeight(
            child: Container(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 2,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[350],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Center(
                            child: Icon(
                              Icons.close_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  child,
                ],
              ),
            ),
          ),
        );
      },
      barrierDismissible: barrierDismissible,
    );
  }
}
