part of 'boc_add_tocount.dart';
class CartEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CartIncrement extends CartEvent{
  final Product product;
  CartIncrement(this.product);

  @override
  List<Object> get props =>[product];

}

class CartDecrement extends CartEvent{
  final Product product;
  CartDecrement(this.product);

  @override
  List<Object> get props =>[product];

}
