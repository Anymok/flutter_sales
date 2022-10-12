import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:flutter_sales/page/avis_page.dart';
import 'package:flutter_sales/page/detail_page.dart';
import 'package:flutter_sales/page/home_page.dart';
import 'package:flutter_sales/page/product_check_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sales/page/cart_page.dart';
import 'package:flutter_sales/page/list_product_page.dart';
import 'package:flutter_sales/model/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider<CartModel>(
        create: (_)=>CartModel([]),
          child: MyApp()
      )
  );
}


class MyApp extends StatelessWidget {
  MyApp({super.key});


  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      // Route LIST
      GoRoute(
        path: '/',
        builder: (_, state) => const HomePage(),
      routes : [
      GoRoute(
        path: 'list',
        builder: (_, state) => const ListProductPage(),
          routes: [
            // Route CART
            GoRoute(
            path: 'cart',
            builder: (_, state) => const cartPage(),
            ),
            // Route DETAIL
            GoRoute(
            path: 'detail',
            builder: (_, state) => DetailPage(state.extra as Products),
              routes: [
                GoRoute(
                  path: 'avis',
                  builder: (_, state) => const avisPage(),
                ),
              ]
          ),
        ],
      ),
  ])
    ],
  );


  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerConfig: _router,
    title: 'E-commerce',
  );


}





