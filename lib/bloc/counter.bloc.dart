import 'package:bloc/bloc.dart';

enum CounterEvent {INCREMENT,DECREMENT}
class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc() : super(0);//on appel le state initial qui est un int = 0


  @override
  Stream<int> mapEventToState(CounterEvent event) async*{//toutes mes methodes qui retournes stream sont asynchrone marqué avec * (async*)
    switch (event){
      case CounterEvent.INCREMENT:
        yield state+1;
        break;
      case CounterEvent.DECREMENT:
        yield state-1;
        break;

    }

  }


}