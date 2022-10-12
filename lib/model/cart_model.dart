import 'package:flutter/foundation.dart';
import 'package:flutter_sales/model/products.dart';

class CartModel extends ChangeNotifier{
  final List<Products> lsProducts;

  CartModel(this.lsProducts);

  addProduct(Products product){
    lsProducts.add(product);
    notifyListeners();
  }

  removeProduct(Products product){
    lsProducts.remove(product);
    notifyListeners();
  }

  removeAllProduct(){
    lsProducts.clear();
    notifyListeners();
  }

  num getPrixPanier() {
    return lsProducts.fold<num>(0, (previousValue, element) => previousValue+element.prix);
  }


  getPrixTotal() {
  num _total = 0;
  lsProducts.forEach((product) {_total = _total + product.prix;});
  return _total;
  }

}