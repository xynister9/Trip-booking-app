
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semesterproject/cubit/app_cubit.dart';
import 'package:semesterproject/cubit/app_cubit_states.dart';
import 'package:semesterproject/pages/Navpages/book_trip_form.dart';
import 'package:semesterproject/pages/welcome_page.dart';
import 'package:semesterproject/widgets/app_button.dart';
import 'package:semesterproject/widgets/app_large_text.dart';
import 'package:semesterproject/widgets/app_text.dart';
import 'package:semesterproject/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  double textSize = 30 ;
  int selectedIndex = -1 ;
  bool liked = false ;
   
  Widget build(BuildContext context) {
    // var stack = Stack();
    return  BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {

        if(state is DetailState ){
          DetailState detail = state as DetailState ;

          return Scaffold(

      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
            children: [
              
              Positioned(
                left: 0,
                right: 0,
                
                child: Container(
                  width: 500,
                  height: 300,

                  decoration:  BoxDecoration( 
                    color: AppColors.buttonBackground,
                    image: DecorationImage(
                      image: NetworkImage(
                        "http://mark.bslmeiyu.com/uploads/" + detail.place.img ,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),


                ),
              ),

              Positioned(
                left: 20,
                top: 50,
                child: Container(
                  width: 330,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      IconButton(onPressed: (){
                        BlocProvider.of<AppCubits>(context).goHome() ;
                      } , icon: Icon(Icons.arrow_back), iconSize: 40, color: Colors.white, ) ,
                      IconButton(onPressed: (){} , icon: Icon(Icons.more_vert_rounded ), iconSize: 40, color: Colors.white,  ),
                      // IconButton(onPressed: (){} , icon: Icon(Icons.menu_rounded ), iconSize: 45, color: Colors.white, ) ,
                    ],
                  ),
                )
              ),
              
              Positioned(
                left: 0, 
                right:0,
                top: 270,
                child: Container(
                    height: 500,
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 35,left: 30,right: 30),
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),

                    child: Column(  
                      crossAxisAlignment: CrossAxisAlignment.start,                 
                      children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              
                              AppLargeText(text: detail.place.name , color: Colors.black87,size: 27,),
                              AppLargeText(text: " \$" + detail.place.price.toString() , color: AppColors.mainColor, size: 25,),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined , color: AppColors.mainColor, size: 15, ),
                              AppText(text: detail.place.location , color: AppColors.mainColor, size: 15,)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index){
                                  return Icon(Icons.star ,color: index<detail.place.stars? AppColors.starColor : AppColors.textColor2 , size: 20,) ;
                                  }
                                ),  
                              ),
                              SizedBox(width: 10,),
                              AppText(text: detail.place.stars.toString()+".0") ,
                            ],
                          ),
                          

                          // section
                          SizedBox(height: 20,),

                          AppText(text: "People" , color: Colors.black87, size: 20, bold: true,),
                          SizedBox(height: 5,),
                          AppText(text: "Number of people  in your group", size: 15, color: Colors.black54,) ,
                          
                          //section
                          SizedBox(height: 20,),

                          Wrap(
                            children: List.generate(5, (index){
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex = (selectedIndex==index? -1 : index ) ; 
                                  });
                                },
                                
                                child:
                                  Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      // onPressed:(){}
                                      child: AppButton(
                                        text :(index+1).toString(), 
                                        size:45, 
                                        textcolor : (index==selectedIndex ? AppColors.buttonBackground : Colors.black  ), 
                                        color: (index==selectedIndex ? Colors.black : AppColors.buttonBackground ), 
                                        backGroundColor: (index==selectedIndex? Colors.black : AppColors.buttonBackground), 
                                        borderColor: (index==selectedIndex? Colors.black : AppColors.buttonBackground), 
                                      ),
                                  ),
                                
                              );
                            
                            }),  
                          ),
                         
                          //section
                          SizedBox(height: 20,),

                          AppText(text: "Description" , color: Colors.black87, size: 20, bold: true,),
                          SizedBox(height: 5,),
                          AppText(text: detail.place.description,
                          size: 15, color: Colors.black54,) , 
                          
                      ]
                    ),
                ),
              ),
              
              Positioned(
                left: 30,
                bottom: 20,
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          liked = (liked==false? true : false ); 
                        });
                      },
                      child: AppButton(icon : (liked? Icons.favorite : Icons.favorite_border_outlined), 
                        isIcon: true ,size: 60 , 
                        liked: liked ,
                        color: AppColors.buttonBackground, 
                        backGroundColor: (liked==true ? AppColors.mainColor : Colors.white  ),
                        borderColor: AppColors.mainColor ,
                      ),
                    ),
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => EditProductScreen() )));
                      },
                      child: ResponsiveButton(text: "Book Trip Now " , width: 220, isResponsive: true, )) ,
                  ],
                ),
              ),
            ],
        ),
        
      ),
    );
  

        } else{
          return Container() ;
        }
        
    
      },
      ) ;
    
  }
}