import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'app_text.dart';
import 'colors.dart';

class AppButton extends StatelessWidget {
  final Color color ;
  final Color backGroundColor ;
  final Color borderColor ;
  final Color textcolor  ;
  double size ;
  String? text ;
  IconData? icon ;
  bool isIcon ;
  bool liked ; 
  // double margin ;
  // double 
  AppButton({Key? key ,
    this.isIcon = false ,
    this.text="NA",
    this.textcolor=Colors.black,
    this.icon,
    this.liked = false ,
    required this.size, 
    required this.color,
    required this.backGroundColor,
    required this.borderColor, 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container() ;
    return Container(
      // padding: const EdgeInsets.only(left: 17,top: 10),
      // margin: const EdgeInsets.only(right: 10),
      width: size,
      height: size,
      // child: AppText(text: index.toString() , size: 20,bold: true,),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backGroundColor,
      ),

      child: Center( child: isIcon==false? AppText(text: text!, bold: true, color: textcolor,) : Icon(icon,color: (liked?AppColors.buttonBackground:AppColors.mainColor),)),

    );
  }
}
