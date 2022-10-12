import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sales/model/review_model.dart';
import 'package:http/http.dart' as http;

class avisPage extends StatelessWidget {
  const avisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ReviewModel> lsReview = [
      ReviewModel(1, "Fabrice", 2, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", "men's clothing", "https://picsum.photos/80/80"),
      ReviewModel(3, "Quentin", 3.5, "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.", "men's clothing", "https://picsum.photos/80/80"),
   ];
    return Scaffold(
      appBar: AppBar(title: Text("Liste des avis"),),
      body: FutureBuilder<http.Response>(
          future : http.get(Uri.parse("https://fakestoreapi.com/products/")),
          builder:(_,snapshot){
            if(snapshot.hasData && snapshot.data !=null){
              String body = snapshot.data!.body;
              List<ReviewModel> lsReview = (jsonDecode(body) as List)
                  .map((e) => ReviewModel.fromJson(e))
                  .toList();
              return ListeAvis(lsReview: lsReview);
            }
            return const Center(child: CircularProgressIndicator());
          }
      )


    );
  }
}

class ListeAvis extends StatelessWidget {
  const ListeAvis({
    Key? key,
    required this.lsReview,
  }) : super(key: key);

  final List<ReviewModel> lsReview;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lsReview.length,
      itemBuilder: (context, int index) {
        final ReviewModel review = lsReview[index];
        return Card(
            child: ListTile(
              title: Row(
                children: [
                  ClipOval(
                    child: Image.network(review.profilePic,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return
                            CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes !=
                                  null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,

                            );
                        }
                        , width: 30, height: 30),
                  ),
                  Text("    ${review.username}")
                ],
              ),

              subtitle: Column(
                children: [
                  RatingBar.builder(
                    initialRating: review.note,
                    minRating: 0,

                    allowHalfRating: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text(review.titre, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black)),
                  Text("${review.avis} €"),
                ],
              ),
            )

        );

      },

    );
  }
}




