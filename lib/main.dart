import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_rev/module/app_user.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyAppStatus extends ChangeNotifier{
AppUser? appUser;

updateUser(var newUser){
  appUser = newUser;
  notifyListeners();
}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=> MyAppStatus(),
        builder: (context,_) => MaterialApp(
          home: Home(),
        ),
    );
  }


}

class Home extends StatelessWidget{
  AppUser? appUser;
  AppUser? parseData(){
    String json ='''
    {
    "message" : "Sucess",
    "statusCode" : 204
    }
    ''';
  var decodedJson = jsonDecode(json);
  appUser = AppUser.fromJson(decodedJson);
  return appUser;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(Provider.of<MyAppStatus>(context).appUser?.message ?? '',
            style: Theme.of(context).textTheme.headline4
            ),
            ElevatedButton(onPressed: () =>
                Provider.of<MyAppStatus>(context,listen: false).updateUser(parseData()),
                child: Text('Press'))
          ],
        ),
      ),
    );

  }

}
