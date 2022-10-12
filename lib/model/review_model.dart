

class ReviewModel {
  int id;
  String username;
  String profilePic = "https://picsum.photos/80/80";
  double note;
  String avis;
  String titre;

  ReviewModel(this.id, this.username ,this.note, this.avis, this.titre, this.profilePic);

  ReviewModel.fromJson(Map<String,dynamic> map)

      : id = map["id"],
        titre = map["title"],
        note = 3.5,
        avis = map["description"],
        username = "quentin",
        profilePic = "https://picsum.photos/80/80";


}