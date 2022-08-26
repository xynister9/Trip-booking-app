
import 'package:flutter/material.dart';
import 'package:semesterproject/pages/Navpages/bar_item_page.dart';
import 'package:semesterproject/pages/home_page.dart';
import 'package:semesterproject/pages/Navpages/my_page.dart';
import 'package:semesterproject/pages/Navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [ HomePage() , SearchPage() , BarItemPage() , MyPage() ] ;

  int currentIndex = 0 ;
  void onTap(int Index){
    setState(() {
      currentIndex = Index ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label:("home") , icon: Icon(Icons.apps)) ,
          BottomNavigationBarItem(label:("bar") , icon: Icon(Icons.bar_chart_sharp)) ,
          BottomNavigationBarItem(label:("search") , icon: Icon(Icons.search)) ,
          BottomNavigationBarItem(label:("MY") , icon:Icon(Icons.person)) ,
        ],
      ),
    );
  }
}
