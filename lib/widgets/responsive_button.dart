import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semesterproject/pages/welcome_page.dart';
import 'package:semesterproject/widgets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width ;
  String text ;
  ResponsiveButton({Key? key , this.text="null" , this.width , this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      
      // padding: const EdgeInsets.only(left: 230),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.mainColor,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          (isResponsive==true  ? AppText(text: text , color: Colors.white, size: 15, bold: true,) : Container() ) ,

          Image.asset("img/button-one.png"),
        ],
        
      ),
    );
  }
}
