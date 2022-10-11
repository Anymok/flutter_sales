class Products {
  int id;
  String nom;
  String description;
  num prix;
  String image;
  String categorie;

  Products(this.id, this.nom, this.prix, this.description, this.categorie, this.image);


  String getPrix()=> "Le prix du produit est $prix";
}