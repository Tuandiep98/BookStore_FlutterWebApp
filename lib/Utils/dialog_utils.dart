import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/setting_bloc/setting_bloc.dart';

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
          contentPadding: EdgeInsets.zero,
          content: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: context.read<SettingBloc>().isDarkMode()
                    ? context.read<SettingBloc>().getTheme().primaryColor
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(3),
              ),
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 3.5,
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
                          color: context.read<SettingBloc>().isDarkMode()
                              ? context
                                  .read<SettingBloc>()
                                  .getTheme()
                                  .backgroundColor
                              : Colors.grey[350],
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
