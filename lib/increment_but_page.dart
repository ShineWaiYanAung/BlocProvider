import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/counter_bloc.dart';
import 'BlocCubit/counter_bloc.dart';
class IncrementButPage extends StatelessWidget {
  const IncrementButPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit  = BlocProvider.of<CounterCubit>(context);
    final counterBloc   = BlocProvider.of<CounterBloc>(context);
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:()=>Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child:
        ElevatedButton(
          onPressed: (){
           // counterCubit.increment();
            counterBloc.add(CounterIncrement());
        },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
