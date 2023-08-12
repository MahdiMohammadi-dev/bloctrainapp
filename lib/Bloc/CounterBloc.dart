import 'package:flutter_bloc/flutter_bloc.dart';

//State of App
class CounterAppState {
  final int value;
  CounterAppState(this.value);
}

//Abstract Classes
abstract class CounterAppEvent {}

class PlusEvent extends CounterAppEvent {}

class MinusEvent extends CounterAppEvent {}

class CounterBloc extends Bloc<CounterAppEvent, CounterAppState> {
  CounterBloc() : super(CounterAppState(0)) {
    //Increment Event
    on<PlusEvent>((event, emit) => emit(CounterAppState(state.value + 1)));
    //Decrement Event
    on<MinusEvent>((event, emit) => emit(CounterAppState(state.value - 1)));
  }
}
