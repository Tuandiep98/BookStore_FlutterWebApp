import 'package:book_store/Utils/color_utils.dart';
import 'package:book_store/core/ui_models/setting_ui_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/setting_bloc/setting_bloc.dart';

class SettingRowElement extends StatefulWidget {
  final SettingUIModel setting;
  final Function action;
  const SettingRowElement(
      {Key? key, required this.setting, required this.action})
      : super(key: key);

  @override
  State<SettingRowElement> createState() => _SettingRowElementState();
}

class _SettingRowElementState extends State<SettingRowElement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: ColorUtils.getRandomColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    widget.setting.icon,
                    size: 30,
                    color: context.read<SettingBloc>().getTheme().primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.setting.name,
                style: TextStyle(
                  fontSize: 22,
                  color: context.read<SettingBloc>().getTheme().accentColor,
                ),
              ),
              Spacer(),
              widget.setting.type == 0
                  ? Text(widget.setting.value, style: TextStyle(fontSize: 20))
                  : const SizedBox.shrink(),
              const SizedBox(width: 2),
              widget.setting.type == 1
                  ? CupertinoSwitch(
                      value: widget.setting.boolValue,
                      onChanged: (value) {
                        widget.setting.boolValue = value;
                        widget.action();
                        setState(() {});
                      },
                    )
                  : Icon(Icons.arrow_forward_ios_rounded,
                      size: 30, color: Colors.grey[300]),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
