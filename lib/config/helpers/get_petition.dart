
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/petition_model.dart';

class Getpetition {

final _dio = Dio();

Future<Message> getAnswer()async{

final response = await _dio.get('https://yesno.wtf/api'); 
 
 final petition = PetitionModel.fromJsonMap(response.data);
 
  return Message(
    text: petition.answer, 
    fromWho: FromWho.hers,
    imageUrl: petition.image
    );
}

}