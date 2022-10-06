import 'package:flutter/material.dart';

class SettingUIModel {
  late String name;
  late int type;
  late bool boolValue;
  late String value;
  late IconData icon;

  SettingUIModel({
    this.name = 'setting name',
    this.type = 0,
    this.boolValue = false,
    this.value = 'value',
    this.icon = Icons.category_rounded,
  });
}
