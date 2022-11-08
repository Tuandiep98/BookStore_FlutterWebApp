import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton2 extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Function? onHover;
  final bool forgeWhite;
  final bool forgeDark;
  final Color titleColor;
  final double? width;
  final double borderWidth;
  final double borderRadius;
  final double symmetricHorizonal;
  final double symmetricVertical;
  final bool maxWidth;

  const CustomButton2({
    Key? key,
    this.title = 'Read more',
    required this.onPressed,
    this.onHover,
    this.forgeWhite = false,
    this.titleColor = Colors.white,
    this.width,
    this.borderWidth = 1,
    this.borderRadius = 0,
    this.symmetricHorizonal = 5,
    this.symmetricVertical = 15,
    this.maxWidth = false,
    this.forgeDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accent = Colors.black;
    var primary = Colors.white;
    if (!forgeWhite) {
      accent = Theme.of(context).colorScheme.secondary;
      primary = Theme.of(context).primaryColor;
    }
    if(forgeDark){
      primary = Theme.of(context).colorScheme.secondary;
      accent = Theme.of(context).primaryColor;
    }
    return Container(
      width: maxWidth ? double.maxFinite : width,
      child: OutlinedButton(
        onPressed: onPressed,
        onHover: (value) {
          if (onHover != null) {
            onHover!(value);
          }
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )),
          side: MaterialStateProperty.resolveWith((states) {
            if ((states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.hovered) ||
                    states.contains(MaterialState.pressed)) &&
                !forgeWhite) {
              return BorderSide(color: accent, width: borderWidth);
            }

            return BorderSide(color: primary, width: borderWidth);
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return accent;
            }

            return primary;
          }),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 14, color: primary, letterSpacing: 1),
              );
            }

            return GoogleFonts.montserrat(
              textStyle:
                  TextStyle(fontSize: 14, color: accent, letterSpacing: 1),
            );
          }),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                  horizontal: symmetricHorizonal, vertical: symmetricVertical)),
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
