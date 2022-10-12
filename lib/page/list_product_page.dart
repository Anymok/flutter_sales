import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'dart:convert';
import 'package:flutter_sales/model/products.dart';
import 'package:flutter_sales/page/cart_page.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ListProductPage extends StatelessWidget {
  const ListProductPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-Commerce"),
        actions: [ IconButton(
            onPressed: ()=> context.go('/home/list/cart'),
            icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
        body: FutureBuilder<http.Response>(
            future : http.get(Uri.parse("https://fakestoreapi.com/products/")),
            builder:(_,snapshot){
              if(snapshot.hasData && snapshot.data !=null){
                String body = snapshot.data!.body;
                List<Products> lsProducts = (jsonDecode(body) as List)
                    .map((e) => Products.fromJson(e))
                    .toList();
                return ListProductBuilder(lsProducts: lsProducts);
              }
              return const Center(child: CircularProgressIndicator());
            }
        )
        );
  }
}


class ListProductBuilder extends StatelessWidget {
  const ListProductBuilder({
    Key? key,
    required this.lsProducts,
  }) : super(key: key);

  final List<Products> lsProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: lsProducts.length,
        itemBuilder: (context, int index) {
          final Products product =lsProducts[index];
          return Card(
            child: InkWell( onTap: () => context.go('/home/list/detail', extra: product),
                child: ListTile(
                  leading: Hero(
                      tag:product.id,
                      child: Image.network(product.image, loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent? loadingProgress)
                      { if (loadingProgress == null) {
                        return child;
                      }
                      return
                        CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,

                        );}
                        , width: 80, height: 80,)),
                  title: Text(product.nom),
                  subtitle: Text("${product.prix} €", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
                  trailing: TextButton(onPressed: ()=> context.read<CartModel>().addProduct(product), child: Text("AJOUTER"),),)
            ),
          );
        },
      ),
    );
  }
}


