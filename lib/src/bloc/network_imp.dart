import 'package:chat/src/interfaces/abstract_network.dart';
import 'package:chat/src/models/message_model.dart';
import 'package:chat/src/models/user_model.dart';

class NetworkImplement extends NetworkCall{


  @override
  Future<Message> getMessages() {
    // TODO: implement getMessages
    ////for actual json
    throw UnimplementedError();
  }

  @override
  Future<User> login() {
    // TODO: implement login
    //for actual json
    throw UnimplementedError();
  }

}