import 'package:chipapp/constants/size_constants.dart';
import 'package:flutter/material.dart';

import 'custom_colors.dart';

class ThemeButton {
  static ButtonStyle primaryButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
        CustomColors.onbroadingbackground.withOpacity(1)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
    ),
  );
  static ButtonStyle roundedButtonStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(Color(0xEFEFEF).withOpacity(0.7)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_30),
      ),
    ),
  );
  static ButtonStyle normalButtonStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(CustomColors.onbroadingbackground),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_0_12),
      ),
    ),
  );
  static ButtonStyle greyButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(CustomColors.greyOne),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_30),
      ),
    ),
  );
  static ButtonStyle pinkButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(CustomColors.customPink),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_5),
      ),
    ),
  );
  static ButtonStyle secondaryButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(
        color: CustomColors.greyFour,
      ),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_5),
      ),
    ),
  );
  static ButtonStyle secondaryButtonStylewithboorder = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_5),
      ),
    ),
  );
  static ButtonStyle disabledButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade100),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_5),
      ),
    ),
  );
}
