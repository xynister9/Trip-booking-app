import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:semesterproject/widgets/app_text.dart';

// class MainDrawer extends StatelessWidget {
//   const MainDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer();
//     // return Scaffold(
//     //   appBar: AppBar(title: const Text('Hello User!')),
//     //   // ListView.builder(itemBuilder: itemBuilder)
//     // );
//   }
// }

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget listTileBuilder(Icon icon, String title,
      GestureTapCallback? tapHandler, BuildContext context) {
    return InkWell(
      onTap: tapHandler,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  final Divider divider = const  Divider() ;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 90,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: const AppText(
              text: 'Hello User!!',
              bold: true,
              size: 20,
              // font: 'RobotoCondensed',
              color: Colors.white,
            ),
          ),
          listTileBuilder(
            const Icon(Icons.person),
            'My Profile',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            context,
          ),
          divider ,
          listTileBuilder(
            const Icon(Icons.card_travel_outlined),
            'My Orders',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            context,
          ),
          divider ,
          listTileBuilder(
            const Icon(Icons.search),
            'Explore',
            () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => const MainDrawer(),) );
            },
            context,
          ),
          divider ,
          listTileBuilder(
            const Icon(Icons.settings),
            'Filters',
            () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => const MainDrawer(),) );
            },
            context,
          ),
        ],
      ),
    );
  }
}
