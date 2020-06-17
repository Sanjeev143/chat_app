/// Created by Sanjeev Sangral on 14,June,2020
import 'package:chat/src/ui/home_screen.dart';
import 'package:chat/src/ui/login_screen.dart';
import 'package:chat/src/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:chat/src/theme/custom_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('screen', false);
  runApp(MyApp(preferences: preferences,));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  MyApp({this.preferences});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      defaultBrightness: Brightness.light,
      data: (Brightness brightness) => ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme,
            home: handleCurrentScreen(),//MyHomePage(title: 'Flutter Demo Home Page')
        );
      },
    );
  }
  Widget handleCurrentScreen() {
    bool screenNo = preferences.getBool('login')?? false;
    if(screenNo){
      return HomeScreen();
    }else{
      return LoginScreen();
    }
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool themeDark = false;

  void getTheme() async {
    themeDark = await CustomTheme.of(context).getBrightnessBool();
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
      appBar: AppBar(
        title: const Text('Holmusk'),
      ),
      drawer: NavigationDrawer(onSelectMenuItem: (index,theme){
        print("TOGGLE"+index.toString() +theme.toString());
        if(theme){
          setState(() {
            themeDark = theme;
          });
          CustomTheme.of(context).setBrightness(Brightness.dark);
        }else{
          setState(() {
            themeDark = theme;
          });
          CustomTheme.of(context).setBrightness(Brightness.light);
        }

      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    ); 
  }
}
