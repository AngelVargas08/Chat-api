

class PetitionModel {
String answer;
bool force;
String image;

PetitionModel({ required this.answer, required this.force, required this.image});

factory PetitionModel.fromJsonMap(Map<String, dynamic> json)=>
  PetitionModel(
    answer: json['answer'],
     force: json['forced'], 
     image: json['image']
     );
}