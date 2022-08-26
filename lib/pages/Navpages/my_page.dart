import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:semesterproject/widgets/app_text.dart';
import 'package:semesterproject/widgets/main_drawer.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);
  final divider = const Divider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MainDrawer(),
      appBar: AppBar(
        title: const AppText(
          text: 'My Profile',
          bold: true,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            child: const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("img/pfp.png"),
              ),
            ),
          ),
          divider,
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
            leading: const Icon(Icons.person),
            title: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AppText(
                      text: 'Name',
                      size: 15,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const AppText(
                      text: 'Kshitiz',
                      size: 15,
                      bold: true,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
            // title: AppText(text: 'Name' , size: 15, ),
            // subtitle: AppText(text: 'Kshitiz' , size: 20, bold : true ),
          ),
          divider,
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
            leading: const Icon(Icons.phone),
            title: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AppText(
                      text: 'Number',
                      size: 15,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const AppText(
                      text: '09654XXX873',
                      size: 15,
                      bold: true,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
            // title: AppText(text: 'Name' , size: 15, ),
            // subtitle: AppText(text: 'Kshitiz' , size: 20, bold : true ),
          ),
          
          divider,
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
            leading: const Icon(Icons.mail),
            title: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AppText(
                      text: 'E-mail',
                      size: 15,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const AppText(
                      text: 'email.com',
                      size: 15,
                      bold: true,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
            // title: AppText(text: 'Name' , size: 15, ),
            // subtitle: AppText(text: 'Kshitiz' , size: 20, bold : true ),
          ),
          
          divider,
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
            leading: const Icon(Icons.local_offer_sharp),
            title: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AppText(
                      text: 'My Offers',
                      size: 15,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
            // title: AppText(text: 'Name' , size: 15, ),
            // subtitle: AppText(text: 'Kshitiz' , size: 20, bold : true ),
          ),
      
          divider,
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
            leading: const Icon(Icons.emoji_events),
            title: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AppText(
                      text: 'My Rewards',
           
                      size: 15,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
            // title: AppText(text: 'Name' , size: 15, ),
            // subtitle: AppText(text: 'Kshitiz' , size: 20, bold : true ),
          ),
      
          divider,
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
            leading: const Icon(Icons.calendar_month),
            title: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AppText(
                      text: 'My Bookings',
                      size: 15,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
            // title: AppText(text: 'Name' , size: 15, ),
            // subtitle: AppText(text: 'Kshitiz' , size: 20, bold : true ),
          ),
      
          divider,
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
            leading: const Icon(Icons.favorite),
            title: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AppText(
                      text: 'Favourites',
                      size: 15,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
            // title: AppText(text: 'Name' , size: 15, ),
            // subtitle: AppText(text: 'Kshitiz' , size: 20, bold : true ),
          ),
      
          const SizedBox(height: 50,),
          // Expanded(
          //   child: Container(),
          // ),
          Padding(
            padding : const EdgeInsets.all(10),
            child: Container(
              height: 50,
              width: 100,
              child: Center(child: AppText(text: 'Log Out',bold: true , color: Theme.of(context).errorColor,)),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          const SizedBox(height: 20,),
        ]),
      
    
    );
  }
}
