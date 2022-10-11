import 'package:flutter/material.dart';
import 'package:flutter_sales/detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sales/cart_page.dart';
import 'package:flutter_sales/list_product_page.dart';
import 'package:flutter_sales/products.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  MyApp({super.key});


  final GoRouter _router = GoRouter(
    initialLocation: '/list',
    routes: <GoRoute>[
      // Route LIST
      GoRoute(
        path: '/list',
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
          ),
        ],
      ),
    ],
  );


  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerConfig: _router,
    title: 'E-commerce',
  );


}





