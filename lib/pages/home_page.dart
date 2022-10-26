import 'package:flutter/material.dart';
import 'dart:io'show Platform;
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _iosDialog(){
    showDialog(context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure you want to logout"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {},
                child: const Text("Cancel"),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {},
                child: const Text("Confirm"),
              )
            ],
          );
        }
    );

  }
  
  void _androidDialog(){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("are you sure you want to logout"),
        actions: [
          MaterialButton(
            child: const Text("Cancel"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            child: const Text("Confirm"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );

    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: (){
           if(Platform.isAndroid){
             _androidDialog();
           }else if(Platform.isIOS){
              _iosDialog();
           }
          },
          child: const Text("Open Dialog"),
        ),
      ),
    );
  }
}
