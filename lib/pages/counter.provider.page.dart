import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/counter.state.dart';
class CounterProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterState counterState=Provider.of<CounterState>(context,listen:false);//listen:false veux dire de desactiver le subscribevers ce state
    print("Build.....");
    return Scaffold(
      appBar: AppBar(title: Text('Counter Provider'),),
      body: Consumer<CounterState>(
        builder:(context,CounterState,child){
          print('Text Generation......');
          return Center(
            child: Text('Counter Value => ${CounterState.counter}',style: Theme.of(context).textTheme.headline4),

          );
        }
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: (){
                  counterState.decrement();
              }
              //on met Listen:false car on n'a pas besoin de faire un subscribe pour les buttons car les buttons n'ont pas besoin de recevoir de notifications
              //car ils sont les declancheurs des operations et on a juste besoin d'une reference vers CounterState sans avoir besoin de faire un subscribe
          ),
          SizedBox(width:10,),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                counterState.increment();
              }
          )
        ],
      ),
    );
  }
}



