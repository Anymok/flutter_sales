import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sales/model/products.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;




class ProductCheckPage extends StatelessWidget {
  const ProductCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-Commerce"), actions: [
                Container(child: InkWell( onTap: () => context.go('/list/cart'), child: Icon(Icons.shopping_basket)), padding: EdgeInsets.all(15.0))
              ],),
      body: 
      FutureBuilder<http.Response>(
        future : http.get(Uri.parse("https://fakestoreapi.com/products/")),
        builder:(_,snapshot){
          if(snapshot.hasData && snapshot.data !=null){
              String body = snapshot.data!.body;
              List<Products> lsProducts = (jsonDecode(body) as List)
                .map((e) => Products.fromJson(e))
                .toList();
            return ListView.builder(
              itemCount: lsProducts.length,
              itemBuilder: (context, int index) {
                return Card(
                  child: InkWell( onTap: () => context.go('/list/detail', extra: lsProducts[index]),
                    child: ListTile(
                      leading: Hero(
                      tag:lsProducts[index].id,
                      child: Image.network(lsProducts[index].image, width: 80, height: 80,)),
                      title: Text(lsProducts[index].nom),
                      subtitle: Text("${lsProducts[index].prix} €", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
                      trailing: Icon(Icons.add),)
                  ),
                );
              },
            );
          }
        return Center(child: const CircularProgressIndicator());
        }
      )
    );
  }
}
