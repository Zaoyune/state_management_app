import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bloc/counter.bloc.dart';
import 'package:untitled/bloc/counter.cubit.dart';
import 'package:untitled/provider/counter.state.dart';
class CounterBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build.....");
    return Scaffold(
      appBar: AppBar(title: Text('Counter Provider'),),
      body: BlocBuilder<CounterBloc,int>(//on spécifie le type du bloc qu'on va ecouter
        builder: (context,statevar) {
          return Center(
           child: Text('Counter Value => $statevar',style: Theme.of(context).textTheme.headline4),
          );
         }
        ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: (){
                context.read<CounterBloc>().add(CounterEvent.DECREMENT);
              }
              //on met Listen:false car on n'a pas besoin de faire un subscribe pour les buttons car les buttons n'ont pas besoin de recevoir de notifications
              //car ils sont les declancheurs des operations et on a juste besoin d'une reference vers CounterState sans avoir besoin de faire un subscribe
          ),
          SizedBox(width:10,),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                context.read<CounterBloc>().add(CounterEvent.INCREMENT);
              }
          )
        ],
      ),
    );
  }
}



