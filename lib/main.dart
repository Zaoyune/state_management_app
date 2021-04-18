import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bloc/counter.bloc.dart';
import 'package:untitled/bloc/counter.cubit.dart';
import 'package:untitled/pages/counter.bloc.page.dart';
import 'package:untitled/pages/counter.cubit.page.dart';
import 'package:untitled/pages/counter.provider.page.dart';
import 'package:untitled/pages/counter.statful.page.dart';
import 'package:untitled/provider/counter.state.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>CounterCubit(0)),//pour rendre le cubit disponible pour l'application
          BlocProvider(create: (context) => CounterBloc())
        ],
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.deepOrange
          ),
          routes: {
           // "/": (context) => CounterProviderPage()
            //"/": (context) => CounterCubitPage()
            "/": (context) => CounterBlocPage()
          },
        ),

    );
  }
}
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CounterState())        
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange
        ),
        routes: {
          "/":(context)=>CounterProviderPage()
        },
      ),
    );
  }
}

