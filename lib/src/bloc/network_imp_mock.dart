/// Created by Sanjeev Sangral on 17,June,2020
import 'package:chat/src/interfaces/abstract_network.dart';
import 'package:chat/src/models/message_model.dart';
import 'package:chat/src/models/user_model.dart';

class NetworkImplementMock extends NetworkCall{
  @override
  Future<Message> getMessages() {
    // TODO: implement getMessages
    //for mock json
    throw UnimplementedError();
  }

  @override
  Future<User> login() {
    // TODO: implement login
    //for mock json
    throw UnimplementedError();
  }

}