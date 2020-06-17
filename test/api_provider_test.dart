import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:chat/src/resources/api_provider.dart';

void main(){

  group("Group", (){
    test("Testing the network call statusCode 200", () async{
      //setup the test
      final apiProvider = ApiProvider();
      apiProvider.client = MockClient((request) async {
        final mapJson = {'id':123};
        return Response(json.encode(mapJson),200);
      });
      final item = await apiProvider.fetchPosts();
      expect(item.id, 123);
    });

    test("Testing the network call statusCode 400", () async{
      //setup the test
      final apiProvider = ApiProvider();
      apiProvider.client = MockClient((request) async {
        final mapJson = {'body':'bad request parameters (shame on you)'};
        return Response(json.encode(mapJson),400);
      });
      final item = await apiProvider.fetchPosts();
      expect(item.body, 'bad request parameters (shame on you)');
    });

    test("Testing the network call statusCode 401", () async{
      //setup the test
      final apiProvider = ApiProvider();
      apiProvider.client = MockClient((request) async {
        final mapJson = {'body':'sessions expired (user must re login to use the app)'};
        return Response(json.encode(mapJson),401);
      });
      final item = await apiProvider.fetchPosts();
      expect(item.body, 'sessions expired (user must re login to use the app)');
    });

    test("Testing the network call statusCode 404", () async{
      //setup the test
      final apiProvider = ApiProvider();
      apiProvider.client = MockClient((request) async {
        final mapJson = {'body':'endpoints not found'};
        return Response(json.encode(mapJson),404);
      });
      final item = await apiProvider.fetchPosts();
      expect(item.body, 'endpoints not found');
    });

    test("Testing the network call statusCode 500", () async{
      //setup the test
      final apiProvider = ApiProvider();
      apiProvider.client = MockClient((request) async {
        final mapJson = {'body':'endpoints not found'};
        return Response(json.encode(mapJson),500);
      });
      final item = await apiProvider.fetchPosts();
      expect(item.body, 'endpoints not found');
    });
  });

}