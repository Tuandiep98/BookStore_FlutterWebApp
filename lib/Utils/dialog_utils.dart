import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../core/bloc/setting_bloc/setting_bloc.dart';

class DialogUtils {
  static Future<void> showDialogWithChild(
    BuildContext context, {
    Widget child = const SizedBox(),
    bool barrierDismissible = true,
    EdgeInsets padding = const EdgeInsets.all(24),
    double paddingCloseBtn = 5,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: IntrinsicHeight(
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: context.read<SettingBloc>().isDarkMode()
                    ? context.read<SettingBloc>().getTheme().primaryColor
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(3),
              ),
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 3.5,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: paddingCloseBtn,
                    right: paddingCloseBtn,
                    child: Container(
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
                  ),
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

  static Future<void> showModalBottomSheet(
      BuildContext context, Widget child) async {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) => child,
    );
  }
}
