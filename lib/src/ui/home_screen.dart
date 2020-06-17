/// Created by Sanjeev Sangral on 16,June,2020
import 'package:chat/src/theme/custom_theme.dart';
import 'package:chat/src/utils/constants.dart';
import 'package:chat/src/widgets/navigation_drawer.dart';
import 'package:chat/src/ui/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void getTheme() async {
    ConstantVar.selectedTheme = await CustomTheme.of(context).getBrightnessBool();
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantVar.selectedTheme? Colors.black87: Colors.white,
      appBar: AppBar(
//        leading: InkWell(
//          onTap: (){},
//          child: Icon(Icons.menu),
//        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: NavigationDrawer(onSelectMenuItem: (index,theme){
        print("TOGGLE"+index.toString() +theme.toString());
        Navigator.of(context).pop();
        if(theme){
          CustomTheme.of(context).setBrightness(Brightness.dark);
        }else{
          CustomTheme.of(context).setBrightness(Brightness.light);
        }
        setState(() {
          getTheme();
        });

      }),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ConstantVar.selectedTheme? Colors.black87: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
