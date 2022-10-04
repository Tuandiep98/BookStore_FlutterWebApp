import 'package:flutter/material.dart';
import 'dart:js' as js;

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Row(
          children: [
            const Icon(Icons.link_rounded, color: Colors.white),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                js.context
                    .callMethod('open', ['https://github.com/Tuandiep98']);
              },
              child: Tooltip(
                message: 'https://github.com/Tuandiep98',
                child: Text(
                  'Powered by tuandiep.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
