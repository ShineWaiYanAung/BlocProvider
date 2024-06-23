import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_bloc/BlocCard/Bloc_AddToCart/boc_add_tocount.dart';
import 'package:provider_bloc/BlocCard/Mode.dart';
import 'package:provider_bloc/BlocCard/cartPage.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> items = [
      Product(name: "Apple", id: 1, price: 11.2),
      Product(name: "StrawBerry", id: 2, price: 10.2),
      Product(name: "Orange", id: 3, price: 8.2),
      Product(name: "Garage", id: 4, price: 1.2),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("SuperMarket"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartPageSuper(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_bag))
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          Product item = items[index];
          return Card(
            child: ListTile(
              minVerticalPadding: 30,
              leading: CircleAvatar(
                child: Text('${item.id}'),
              ),
              title: Align(alignment: Alignment.center, child: Text(item.name)),
              trailing: IconButton(
                onPressed: () {
                  final addBloc = context.read<AddToCartPageBloc>();
                  addBloc.add(CartIncrement(item));
                  print("Clicked");
                },
                icon: Icon(Icons.shop),
              ),
            ),
          );
        },
      ),
    );
  }
}
