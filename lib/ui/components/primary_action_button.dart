// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cxl/ui/common/colors.dart';

class PrimaryActionButton extends StatelessWidget {
  final void Function() callback;
  final String label;
  final IconData? icon;

  const PrimaryActionButton(
    this.label, {
    Key? key,
    required this.callback,
    this.icon,
  }) : super(key: key);

  Text _text() {
    return Text(
      label,
      style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          color: CxlColors.White),
    );
  }

  Icon _icon() {
    return Icon(
      icon,
      color: CxlColors.White,
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(CxlColors.Red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? TextButton(
            onPressed: callback,
            child: _text(),
            style: _buttonStyle(),
          )
        : TextButton.icon(
            onPressed: callback,
            icon: _icon(),
            label: _text(),
            style: _buttonStyle(),
          );
  }
}
