
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semesterproject/cubit/app_cubit.dart';
import 'package:semesterproject/pages/Navpages/my_page.dart';
import 'package:semesterproject/pages/welcome_page.dart';
import 'package:semesterproject/widgets/app_large_text.dart';
import 'package:semesterproject/widgets/main_drawer.dart';

import '../cubit/app_cubit_states.dart';
import '../widgets/app_text.dart';




class  HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
   HomePage_State createState() => HomePage_State();
}

class HomePage_State extends State<HomePage> with TickerProviderStateMixin {
  @override
  List tt = ["kayaking" , "hiking" , "balloning" , "snorkling" , "kayaking"] ;
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this) ;
    GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldState ,
      drawer: MainDrawer(),
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      

        if(state is LoadedState ){

          var info = state.places ;

          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // menu text
          Container(
            padding: const EdgeInsets.only(top: 50 ,left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton( icon : Icon(Icons.notes_rounded, size: 40 , color: Colors.black) , onPressed: (){
                  _scaffoldState.currentState?.openDrawer();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainDrawer()),) ;
                },) ,
                Expanded(child: Container()),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyPage()));
                  },
                  child: Container(
                
                    margin : const EdgeInsets.only(right: 30,),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      image: const DecorationImage(
                        image: AssetImage("img/pfp.png"),
                      ),
                      // color: Colors.grey.withOpacity(0.5)
                    ),
                  ),
                ),
              ],
            )
          ),

          // discover text
          SizedBox(height: 10,),
          Container(
            margin : const EdgeInsets.only(left:25) ,
            child: AppLargeText(text: "Discover"),
          ),

          //tabbar text
          SizedBox(height: 10,),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 25 , right: 20),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                controller: _tabController  ,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor,radius: 4),
                tabs: [
                  Tab(text:"Places"),
                  Tab(text:"Inspiration"),
                  Tab(text:"Emotion"),
                ],
              ),
            ),
          ),

          Container(
            height: 300,
            width: double.maxFinite,
            padding: const EdgeInsets.only(top: 15 ,left: 25 ),
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: info.length ,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        BlocProvider.of<AppCubits>(context).detailPage(info[index]) ;
                      },
                      child : Stack(
                        children: [
                       
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.buttonBackground,
                              image: DecorationImage(
                                image: NetworkImage(
                                  "http://mark.bslmeiyu.com/uploads/" + info[index].img ,
                                ),
                                fit: BoxFit.cover
                              )
                            )
                          ),

                          Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // color: Colors.white,
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.center,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Colors.grey.withOpacity(0.0),
                                        Colors.black,
                                      ],
                                      stops: [  0.0, 1.0 ]
                                  )
                              ),
                          ),      
                          
                          Positioned(
                            top:15 ,
                            right:25 ,
                            child: Container(

                              child: Icon(Icons.more_vert_rounded , size: 30, color: Colors.white,) ,
                              ),
                          ),

                          Positioned(
                            top:220 ,
                            left:15 ,
                            child: AppText(text:info[index].name , size: 20, color: Colors.white,),
                          ),
                          
                          Positioned(
                            top:250 ,
                            left:10 ,
                            child: Container(

                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined , color: Colors.white, size: 20,),
                                  AppText(text:info[index].location , size: 13, color: Colors.white,),
                                ],
                              )
                              ),
                          ),
                            
                        ],
                      ),
                      
                    );
                  },

                ),
                ListView.builder(
                  itemCount:3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 200,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.withOpacity(0.25),
                      )
                    );
                  },

                ),
                ListView.builder(
                  itemCount:3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 200,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple.withOpacity(0.25),
                      )
                    );
                  },

                ),

              ],
            ),
          ),

          //Explore Text
          SizedBox(height: 20,),
          Container(
            margin : const EdgeInsets.only(left:25 , right: 25) ,
            child: Row(
                children :[
                  AppLargeText(text: "Explore More" , size:18),
                  Expanded(child: Container()),
                  AppText(text: "See All" , color: Colors.grey,)
                ]
            ),
          ),

          SizedBox(height: 20),

          Container(
            width: double.maxFinite,
            height: 100,
            margin: const EdgeInsets.only(left: 25),
            child:  ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( _  , int index ){
                  return Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.only(right: 30),
                        // color: Colors.green,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage(
                              "img/"+tt[index] + ".png",
                            )
                          ),
                          //   color:  Colors.blue.withOpacity(0.25),
                        )
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 70,
                        height: 20,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 30),
                        child :
                          AppText(text: capitalize(tt[index]) , color: AppColors.textColor2 ,size: 15,),
                            
                                                   
                      ),
                      
                    ],
                  ) ;
                },

            )
          )
          

        ],
        
        );
        
        } else{

          return Container() ;
        }
        
    
      } 
      ,)
    
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color ;
  final double radius ;
  const CircleTabIndicator({required this.color, required this.radius}) ;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color : color , radius : radius ) ;
    throw UnimplementedError();
  }

}

class _CirclePainter extends BoxPainter{
  final Color color ;
  final double radius ;
  _CirclePainter({required this.color, required this.radius}) ;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint() ;
    paint.color = color ;
    paint.isAntiAlias = true ;
    final Offset circleOffset = Offset(configuration.size!.width/2 +radius/2, configuration.size!.height-radius) ;
    canvas.drawCircle( offset +circleOffset, radius, paint);
  }
  
}