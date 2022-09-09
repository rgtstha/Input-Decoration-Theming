import 'package:flutter/material.dart';
import 'package:inputdecoration_theme/app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData.light().copyWith(
    inputDecorationTheme: inputDecorationTheme,
    textSelectionTheme: textSelectionTheme,
  );

  static get inputDecorationTheme => InputDecorationTheme(
        suffixIconColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.error)) {
              return AppColor.errorColor;
            }

            if (states.contains(MaterialState.focused)) {
              return AppColor.focusedColor;
            }

            if (states.contains(MaterialState.disabled)) {
              return AppColor.disabledColor;
            }

            return AppColor.defaultColor;
          },
        ),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          TextStyle style = const TextStyle();

          if (states.contains(MaterialState.error)) {
            return style.copyWith(color: AppColor.errorColor);
          }
          if (states.contains(MaterialState.focused)) {
            return style.copyWith(color: AppColor.focusedColor);
          }

          if (states.contains(MaterialState.disabled)) {
            return style.copyWith(color: AppColor.disabledColor);
          }

          return style.copyWith(color: AppColor.defaultColor);
        }),
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          TextStyle style = const TextStyle();

          if (states.contains(MaterialState.error)) {
            return style.copyWith(color: Colors.red);
          }
          if (states.contains(MaterialState.focused)) {
            return style.copyWith(color: AppColor.focusedColor);
          }

          if (states.contains(MaterialState.disabled)) {
            return style.copyWith(color: AppColor.disabledColor);
          }

          return style.copyWith(color: AppColor.defaultColor);
        }),
        border: MaterialStateOutlineInputBorder.resolveWith(
          (states) {
            OutlineInputBorder inputBorder = const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.defaultColor),
            );

            if (states.contains(MaterialState.error)) {
              return inputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.red),
              );
            }

            if (states.contains(MaterialState.focused)) {
              return inputBorder.copyWith(
                borderSide: const BorderSide(color: AppColor.focusedColor),
              );
            }

            if (states.contains(MaterialState.disabled)) {
              return inputBorder.copyWith(
                borderSide: BorderSide(color: AppColor.disabledColor),
              );
            }

            return inputBorder;
          },
        ),
      );

  static TextSelectionThemeData get textSelectionTheme => const TextSelectionThemeData(
        cursorColor: AppColor.focusedColor,
      );
}
