import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_bloc/BlocCard/BlocAddToCardPage.dart';

import '../Mode.dart';

part  'bloc_event.dart';
part  'bloc_state.dart';
class AddToCartPageBloc extends Bloc<CartEvent,CartState>{
  AddToCartPageBloc() : super(CartState([])){
   on<CartIncrement>(_mapEventToState);
   on<CartDecrement>(_mapEventToState2);
  }
  Future<void> _mapEventToState(CartIncrement event, Emitter<CartState> emit) async{
        if(event is CartIncrement){
          final updateCart = List<Product>.from(state.newItems)..add(event.product);
          print('Updated Cart Items: ${updateCart.map((product) => product.name).toList()}');
          emit(CartState(updateCart));
        }
        else{
          print("U cannot Access");
        }
  }

Future<void> _mapEventToState2(CartDecrement event, Emitter<CartState> emit) async{
   if(event is CartDecrement){
    final updateCart = List<Product>.from(state.newItems)..remove(event.product);
    emit(CartState(updateCart));
  }
  else{
    print("U cannot Access");
  }

}
}


