import 'package:civil_manager/res/color.dart';
import 'package:flutter/material.dart';

class MyTextStyle{
 static TextStyle heading()
  {
    return const TextStyle(
      fontSize: 35,
      decoration: TextDecoration.underline
    );
  }
  
 static TextStyle title()
  {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: AppColors.primaryColor
    );
  }
   
 static TextStyle simpleTextWithColor()
  {
    return const TextStyle(
      fontSize: 16,
      color: AppColors.primaryColor
    );
  }
   
 static TextStyle simpleText()
  {
    return const TextStyle(
      fontSize: 16,
    );
  }
  static TextStyle feadText()
  {
    return const TextStyle(
      fontSize: 15,
      decoration: TextDecoration.underline,
      color:Color.fromARGB(255, 148, 133, 105),
    );
  }
  
  static TextStyle formLable()
  {
    return const TextStyle(
      fontSize: 17,
    );
  }
  static Text inputFormLable(String value)
  {
    return Text(value,style: const TextStyle(color: AppColors.primaryColor),);
  }
  static InputDecoration inputDecoration(String title)
  {
    return InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 2.0),
                          ),
                          hintText: "Labour Type",
                          label: MyTextStyle.inputFormLable("Labour Type"),
                          prefixIcon: const Icon(
                            Icons.alternate_email,
                            color: AppColors.primaryColor,
                          ),
                          fillColor: AppColors.primaryColor);
  }
}

String addOrdinalSuffix(int num) {
  var lastDigit = num % 10;
  var lastTwoDigits = num % 100;
  if (lastTwoDigits >= 11 && lastTwoDigits <= 13) {
    return '${num}th';
  }
  switch (lastDigit) {
    case 1:
      return '${num}st';
    case 2:
      return '${num}nd';
    case 3:
      return '${num}rd';
    default:
      return '${num}th';
  }
}