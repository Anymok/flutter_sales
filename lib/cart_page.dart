import 'package:flutter/material.dart';

class cartPage extends StatelessWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panier Flutter Sales"),),
      body:
      Container(
        child : Stack(
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Votre panier total est de : "),
                Text("0.00€", style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Votre panier est actuellement vide."),
                Icon(Icons.image)
              ],
            )
            )
          ],
        )
      )
    );




      /*Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Votre panier total est de"),
                  Text("0.00€", style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Votre panier est vide.")
                ],
              )
            ],
        ),

    );*/
  }
}
