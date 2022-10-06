import 'package:flutter/material.dart';

import '../core/ui_models/setting_ui_model.dart';
import 'setting_row_element.dart';

class SettingElement extends StatefulWidget {
  const SettingElement({Key? key}) : super(key: key);

  @override
  State<SettingElement> createState() => _SettingElementState();
}

class _SettingElementState extends State<SettingElement> {
  List<SettingUIModel> settings = [];
  @override
  void initState() {
    settings = [
      SettingUIModel(
          name: 'Accounts', icon: Icons.account_circle_outlined, type: 2),
      SettingUIModel(name: 'Language', value: 'English', icon: Icons.language),
      SettingUIModel(name: 'Dark mode', type: 1, icon: Icons.wb_sunny_rounded),
      SettingUIModel(name: 'Sign out', icon: Icons.logout_rounded, type: 2),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 80,
            child: Image.asset(
              'assets/images/girl_emoji_01.png',
              height: 160,
              width: 160,
            ),
          ),
          const SizedBox(height: 50),
        ]..addAll(settings.map((e) => SettingRowElement(setting: e)).toList()),
      ),
    );
  }
}
