import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sales/products.dart';

class DetailPage extends StatelessWidget {
  final Products product;
  DetailPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.nom, style: TextStyle(fontWeight: FontWeight.bold),),),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(tag:product.id, child: Container(child: Image.network(product.image, width: 150, height: 150,), padding: EdgeInsets.all(20.0),)),
              Container(child: Text(product.nom, style: Theme.of(context).textTheme.headline6), padding: EdgeInsets.all(5.0)),
              Container(
                child: Card(
                  child: ListTile(
                    title: Container(child: Text("Description", style: Theme.of(context).textTheme.headline6), padding: EdgeInsets.all(8.0)),
                    subtitle: Text(product.description),
                  ),
                ), padding: EdgeInsets.all(8.0)
              ),
              Divider(),
              Container(
                child: Card(
                  child: ListTile(
                    title: Container(child: Text("Avis", style: Theme.of(context).textTheme.headline6), padding: EdgeInsets.all(8.0)),
                    subtitle: Text(product.description),
                  ),
                ), padding: EdgeInsets.all(8.0)
              ),
              Divider(),
              Container(
                child: Card(
                  child: ListTile(
                    title: Container(child: Text("Caracteristique", style: Theme.of(context).textTheme.headline6), padding: EdgeInsets.all(8.0)),
                    subtitle: Text(product.description),
                  ),
                ), padding: EdgeInsets.all(8.0)
              )
            ],

          ))

        /*children: [
          Text("Le nom du prodyit est ${product.nom}"),

        ],*/

    );

  }
}
