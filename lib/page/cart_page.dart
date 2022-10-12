import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:provider/provider.dart';

class cartPage extends StatelessWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panier Flutter Sales"),),
      body:
      Column(
        children: [
          Text("Votre panier contient "
              "${context.watch<CartModel>().lsProducts.length}"
              " éléments"),
          Row(
            children: [
              Text("Votre panier total est de :"),
              Text("${context.watch<CartModel>().getPrixTotal()}€")
            ],
          ),
              Consumer<CartModel>(
                  builder: (_,cart,__)=>Expanded(
                    child: ListView.builder(
                          itemCount: cart.lsProducts.length,
                          itemBuilder: (_,index)=>Card(
                            child: ListTile(
                              leading: Hero(
                                  tag:cart.lsProducts[index].id,
                                  child: Image.network(cart.lsProducts[index].image, loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent? loadingProgress)
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
                              title: Text(cart.lsProducts[index].nom),
                              subtitle: Text("${cart.lsProducts[index].prix} €", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
                              trailing: TextButton(onPressed: ()=> context.read<CartModel>().removeProduct(cart.lsProducts[index]), child: Text("RETIRER"),),),
                          )
                    ),
                  )
              ),
          IconButton(onPressed: ()=> context.read<CartModel>().removeAllProduct(), icon: Icon(Icons.restore_from_trash))
            ],

          ),






    );
  }
}
