
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semesterproject/cubit/app_cubit.dart';
import 'package:semesterproject/cubit/app_cubit_states.dart';
import 'package:semesterproject/pages/Navpages/detail_page.dart';
import 'package:semesterproject/pages/Navpages/main_page.dart';
import 'package:semesterproject/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context , state){
          if(state is WelcomeState ){
            return WelcomePage() ;
          } 
          else if(state is LoadingState ){
            return Center(child: CircularProgressIndicator() ,) ;
          }
          else if(state is LoadedState ){
            return MainPage() ;
          }
          else if(state is DetailState ){
            return DetailPage() ;
          }
          else{
            return Container() ;
          }
        }
      ),
    ) ;
  }
}