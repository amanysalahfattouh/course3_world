import 'dart:convert';

import 'package:final_project_c3/screens/favirote.dart';
import 'package:final_project_c3/screens/homee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}
class _LayoutState extends State<Layout> {
  int _currentIndex = 0;
  List<Widget> _Screens =<Widget>[
    HomeScreen(),
    Favorite(),
  ];
  bool darkTheme = false;
  ThemeData _dark = ThemeData(brightness: Brightness.dark,primaryColor: Colors.black);
  ThemeData _light = ThemeData(brightness: Brightness.light,primaryColor: Colors.white);
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme? _dark: _light,
        home:  Scaffold(
          appBar: AppBar(
              title: Text('World'),
              centerTitle: true
          ),
          body: _Screens[_currentIndex],
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Dark Theme"),
                  trailing: Switch(
                    value: darkTheme,
                    onChanged: (changed) {
                      setState(() {
                        darkTheme = changed;
                      });
                    },
                  ),
                )
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            iconSize: 30,

            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.home) , label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.star_rate_outlined), label: 'Favorite'),
            ],
            onTap: (_val){
              setState(() {
                _currentIndex = _val;
              });
            },
          ),
        )
    );
  }
}




