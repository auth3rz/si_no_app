import 'package:dio/dio.dart';
import 'package:si_no_app/domain/entities/message.dart';
import 'package:si_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer{

  final _dio = Dio();

  Future<Message> getAnswer() async {

    var elMensaje = Message(
      text    : 'No', 
      fromWho : FromWho.ella, 
      url     : 'https://yesno.wtf/assets/yes/7-653c8ee5d3a6bbafd759142c9c18d76c.gif'
    );

    const url = 'https://yesno.wtf/api';

    await _dio.get(url).then((v) {
      if (v.statusCode == 200) {
        final yesNoModel = YesNoModel.fromJson(v.data);

        elMensaje = yesNoModel.toMessageEntity();
      }
    });

    return elMensaje;
  }
}
