import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<List> {
    CounterCubit() : super([]);

    List fish =  [
      'A',"B",'C'
    ];
    void increment(int index) {
      if (state == 20) {
        print('Your Limit reached');
        return;
      }
      print("Before : $state");
      emit(state + fish[index]);
      emit([...state, fish[index]]);
      print("After  : ${state}");
    }
}
