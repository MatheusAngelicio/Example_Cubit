import 'package:bloc/bloc.dart';
import 'package:example_cubit/cubit/greeting_state.dart';

class GreetingCubit extends Cubit<GreetingState> {
  int howManyTimes = 0;

  GreetingCubit() : super(GreetingInitial());

  Future<void> getNextGreetingstate() async {
    howManyTimes++;

    if (howManyTimes == 1) {
      emit(GreetingSecondTime());
    } else if (howManyTimes == 2) {
      emit(GreetingThirdTime());
    } else {
      emit(GreetingThereafter());
    }
  }

  Future<void> resetCouting() async {
    howManyTimes = 0;
    emit(GreetingInitial());
  }
}
