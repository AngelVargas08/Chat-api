// To parse this JSON data, do
//
//     final petitionModel = petitionModelFromMap(jsonString);



import 'package:yes_no_app/domain/entities/message.dart';

class PetitionModel {
    final String answer;
    final bool forced;
    final String image;

    PetitionModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

 
    factory PetitionModel.fromJsonMap(Map<String, dynamic> json) => PetitionModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };


    Message toMessageEntity() => Message(
      text: answer == 'yes'? 'Si' : 'No',
       fromWho: FromWho.hers,
       imageUrl: image
       );
}
