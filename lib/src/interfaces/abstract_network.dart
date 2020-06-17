/// Created by Sanjeev Sangral on 17,June,2020
import 'package:chat/src/models/message_model.dart';
import 'package:chat/src/models/user_model.dart';

abstract class NetworkCall{
  Future<User> login();
  Future<Message> getMessages();

}