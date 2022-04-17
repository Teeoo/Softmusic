import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

enum NotifyType { error, success, info, warning, none }

class Notify {
  static message(BuildContext context, content,
      {NotifyType? type,
      Widget? subtitle,
      EdgeInsetsGeometry? contentPadding,
      Color? foreground,
      double elevation = 16,
      bool autoDismiss = true,
      Color buttonColor = Colors.white,
      String buttonTitle = '关闭',
      VoidCallback? click,
      Key? key}) {
    showSimpleNotification(Text(content),
        subtitle: subtitle,
        trailing: Builder(
            // buttonColor
            builder: (context) => TextButton(
                onPressed: () {
                  OverlaySupportEntry.of(context)?.dismiss();
                  if (click != null) click();
                },
                child: Text(
                  buttonTitle,
                  style: TextStyle(color: buttonColor),
                ))),
        contentPadding: contentPadding,
        background: _color(type!),
        foreground: foreground,
        elevation: elevation,
        autoDismiss: autoDismiss,
        key: key);
  }

  static Color _color(NotifyType type) {
    Color color;
    switch (type) {
      case NotifyType.success:
        color = Colors.green;
        break;
      case NotifyType.warning:
        color = Colors.orange;
        break;
      case NotifyType.error:
        color = Colors.red;
        break;
      default:
        color = Colors.blue;
    }
    return color;
  }
}
