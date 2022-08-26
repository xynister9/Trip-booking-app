import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semesterproject/cubit/app_cubit.dart';
import 'package:semesterproject/cubit/app_cubit_logics.dart';
import 'package:semesterproject/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  	const MyApp({Key? key}) : super(key: key);

  	// This widget is the root of your application.
  	// @override
  	@override
  	Widget build(BuildContext context) {
  	  	return MaterialApp(
  	  	    title: 'Flutter Demo',
  	  	    theme: ThemeData(
  	  	      // This is the theme of your application.
  	  	      // Try running your application with "flutter run". You'll see the
  	  	      // application has a blue toolbar. Then, without quitting the app, try
  	  	      // changing the primarySwatch below to Colors.green and then invoke
  	  	      // "hot reload" (press "r" in the console where you ran "flutter run",
  	  	      // or simply save your changes to "hot reload" in a Flutter IDE).
  	  	      // Notice that the counter didn't reset back to zero; the application
  	  	      // is not restarted.
  	  	      	primarySwatch: Colors.deepPurple,
  	  	    ),
  	  	    
            home: BlocProvider<AppCubits>(
              create: (context)=>AppCubits( data:DataServices() ),
              child:const AppCubitLogics(),
            ),
				);   
		}

}


//BlocProvider<AppCubits>()