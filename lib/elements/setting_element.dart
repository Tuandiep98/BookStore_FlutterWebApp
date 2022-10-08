import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/bloc/setting_bloc/setting_bloc.dart';
import '../core/ui_models/setting_ui_model.dart';
import 'setting_row_element.dart';

class SettingElement extends StatefulWidget {
  const SettingElement({Key? key}) : super(key: key);

  @override
  State<SettingElement> createState() => _SettingElementState();
}

class _SettingElementState extends State<SettingElement> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 80,
              child: Image.asset(
                'assets/images/girl_emoji_01.png',
                height: 160,
                width: 160,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: context.read<SettingBloc>().isDarkMode()
                    ? context.read<SettingBloc>().getTheme().backgroundColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SettingRowElement(
                    action: () {},
                    setting: SettingUIModel(
                      name: 'Accounts',
                      icon: Icons.account_circle_outlined,
                      type: 2,
                    ),
                  ),
                  SettingRowElement(
                    action: () {},
                    setting: SettingUIModel(
                      name: 'Language',
                      value: 'English',
                      icon: Icons.language,
                    ),
                  ),
                  SettingRowElement(
                    action: () {
                      var _settingBloc = context.read<SettingBloc>();
                      _settingBloc.add(
                          ThemeChaged(setToDark: !_settingBloc.isDarkMode()));
                    },
                    setting: SettingUIModel(
                      name: 'Dark mode',
                      type: 1,
                      icon: Icons.wb_sunny_rounded,
                      boolValue: context.read<SettingBloc>().isDarkMode(),
                    ),
                  ),
                  SettingRowElement(
                    action: () {},
                    setting: SettingUIModel(
                      name: 'Sign out',
                      icon: Icons.logout_rounded,
                      type: 2,
                    ),
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
