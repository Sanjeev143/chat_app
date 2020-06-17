/// Created by Sanjeev Sangral on 14,June,2020
import 'package:chat/src/theme/custom_theme.dart';
import 'package:chat/src/ui/user_profile.dart';
import 'package:chat/src/utils/constants.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {

  final Function(int,bool) onSelectMenuItem;
  NavigationDrawer({this.onSelectMenuItem});

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  bool isSwitched = ConstantVar.selectedTheme;

  void getTheme() async {
    ConstantVar.selectedTheme = await CustomTheme.of(context).getBrightnessBool();
    setState(() {
      isSwitched = ConstantVar.selectedTheme;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/sanjeev.jpg'),
                  ),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProfilePage()
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.0,),
                Text("Sanjeev Sangral",style: TextStyle(fontSize: 18.0, color: Colors.white),),
              ],
            ),
            decoration: BoxDecoration(
              color: isSwitched? Colors.black: Colors.indigo,
            ),
          ),
          Divider(
            height: 0.5,
            color: Colors.white,
          ),
          ListTile(
            enabled: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.person),
                SizedBox(width: 15.0,),
                Text('Profile')
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProfilePage()
                ),
              );
            },
          ),
          ListTile(
            enabled: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.brightness_4),
                    SizedBox(width: 15.0,),
                    Text('Dark Theme'),
                  ],
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value){
                    setState(() {
                      isSwitched=value;
                      widget.onSelectMenuItem(1,isSwitched);
                    });
                  },
                  activeTrackColor: ConstantVar.selectedTheme? Colors.black38: Colors.indigo[200],
                  activeColor: ConstantVar.selectedTheme? Colors.black87: Colors.indigo
                ),
              ],
            ),
          ),
          ListTile(
            enabled: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.exit_to_app),
                SizedBox(width: 15.0,),
                Text('Logout')
              ],
            ),
            onTap: () {
              widget.onSelectMenuItem(2,false);
            },
          ),
        ],
      ),

    );
  }
}
