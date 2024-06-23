import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc_AddToCart/boc_add_tocount.dart';

class CartPageSuper extends StatefulWidget {
  const CartPageSuper({super.key});

  @override
  State<CartPageSuper> createState() => _CartPageSuperState();
}

class _CartPageSuperState extends State<CartPageSuper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CartPage"),
      ),
      body: BlocBuilder<AddToCartPageBloc, CartState>(
        builder: (context, state) {
          if (state.newItems.isEmpty) {
            return Center(child: Text("Item is Empty"));
          }
          else {
            return ListView.builder(
              itemCount: state.newItems.length,
              itemBuilder: (context, index) {
            final    product = state.newItems[index];
                return Card(
                  child: ListTile(
                    title: Text(state.newItems[index].name),
                    trailing: IconButton(
                      onPressed: (){
                       final removeBloc = context.read<AddToCartPageBloc>();
                       removeBloc.add(CartDecrement(product));
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                );
              },

            );
          }
        }
      ),
    );
  }
}
