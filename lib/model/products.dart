class Products {
  int id;
  String nom;
  String description;
  num prix;
  String image;
  String categorie;

  Products(this.id, this.nom, this.prix, this.description, this.categorie, this.image);


  String getPrice()=> "Le prix du produit est $prix€";

  Products.fromJson(Map<String,dynamic> map)
      : id = map["id"],
        nom = map["title"],
        prix = map["price"],
        description = map["description"],
        categorie = map["category"],
        image = map["image"];
}