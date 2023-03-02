import 'package:bloc/bloc.dart';
import 'package:example_cubit/cubit/greeting_state.dart';

class GreetingCubit extends Cubit<GreetingState> {
  GreetingCubit(): super(GreetingInitial());
}