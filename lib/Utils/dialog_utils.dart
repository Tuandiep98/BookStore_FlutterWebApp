import 'package:book_store/utils/platform_utils.dart';
import 'package:book_store/elements/blur_container.dart';
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
    bool isFullScreenForDevice = true,
    Color? backgroundColor = null,
    bool enableBlur = true,
    double? maxHeight,
    double sigmaX = 5,
    double sigmaY = 5,
    bool forgeShowBottomSheet = false,
  }) async {
    if (PlatformUtils.isDevice(context) || forgeShowBottomSheet) {
      return showMaterialModalBottomSheet(
        bounce: true,
        animationCurve: Curves.easeInOutCubicEmphasized,
        backgroundColor: backgroundColor ??
            (context.read<SettingBloc>().isDarkMode()
                ? context.read<SettingBloc>().getTheme().primaryColor
                : Colors.grey[200]),
        context: context,
        builder: (context) => BlurContainer(
          opacity: 0.5,
          enabled: enableBlur,
          sigmaX: sigmaX,
          sigmaY: sigmaY,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
                // color: backgroundColor == null
                //     ? Colors.transparent
                //     : context.read<SettingBloc>().isDarkMode()
                //         ? context.read<SettingBloc>().getTheme().primaryColor
                //         : Colors.grey[200],
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(12),
                //   topRight: Radius.circular(12),
                // ),
                ),
            constraints: BoxConstraints(
              maxHeight: maxHeight ?? MediaQuery.of(context).size.height - 100,
            ),
            child:
                isFullScreenForDevice ? IntrinsicHeight(child: child) : child,
          ),
        ),
      );
    } else {
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
                    child,
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
}
