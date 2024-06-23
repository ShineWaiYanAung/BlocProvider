import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_bloc/Bloc/counter_bloc.dart';
import 'package:provider_bloc/BlocCard/Bloc_AddToCart/boc_add_tocount.dart';

import 'package:provider_bloc/increment_but_page.dart';

import 'BlocCard/BlocAddToCardPage.dart';
import 'BlocCubit/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context) => CounterCubit(),),
        BlocProvider(create: (BuildContext context) => CounterBloc()),
        BlocProvider(create: (context) => AddToCartPageBloc(),)
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: AddToCartPage(),
      ),
    );
  }
}
