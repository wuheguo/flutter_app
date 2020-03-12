import 'package:flutter/material.dart';
import 'package:flutter_app/app/component/icon_tab.dart';
import 'package:flutter_app/app/view/msg_view.dart';
import 'package:flutter_app/app/view/jobs_view.dart';
class BossApp extends StatefulWidget{
  @override
  HomeState createState()  => new HomeState();
}

const double _kTabTextSize = 11.0;
const int INDEX_JOB = 0;
const int INDEX_COMPARY = 1;
const int INDEX_MESSAGE = 2;
const int INDEX_MINE = 3;
Color _kPrimaryColor = new Color.fromARGB(255,0,215,198);
class HomeState extends State<BossApp> with SingleTickerProviderStateMixin{


  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChange;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(initialIndex: _currentIndex,length: 4,vsync: this);
    onChange = (){
      setState(() {
        _currentIndex =this._controller.index;
      });
    };

    _controller.addListener(onChange);
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       body: new TabBarView(
         children: <Widget>[
           new JobsTab(),
           new JobsTab(),
           new MsgsTab(),
           new JobsTab(),
         ],
         controller: _controller,
       ),
       bottomNavigationBar: new Material(
         color: Colors.white,
         child: new TabBar(
           controller: _controller,
             indicatorSize: TabBarIndicatorSize.label,
             labelStyle: new TextStyle(fontSize: _kTabTextSize),
             tabs: <IconTab>[
               new IconTab(
                 text:"职位",
                 icon:_currentIndex==INDEX_JOB
                   ?"assets/images/tab_contact_select.png"
                   :"assets/images/tab_contact_unselect.png" ,
                   color:_currentIndex==INDEX_JOB?_kPrimaryColor:Colors.grey[900]
               ),
               new IconTab(
                   icon:_currentIndex==INDEX_COMPARY
                       ?"assets/images/tab_home_select.png"
                       :"assets/images/tab_home_unselect.png",
                   text:"公司",
                   color:_currentIndex==INDEX_COMPARY?_kPrimaryColor:Colors.grey[900]
               ),
               new IconTab(
                   icon:_currentIndex==INDEX_MESSAGE
                       ?"assets/images/tab_more_select.png"
                       :"assets/images/tab_more_unselect.png",
                   text:"消息",
                   color:_currentIndex==INDEX_MESSAGE?_kPrimaryColor:Colors.grey[900]
               ),
               new IconTab(
                   icon:_currentIndex==INDEX_MINE
                       ?"assets/images/tab_speech_select.png"
                       :"assets/images/tab_speech_unselect.png",
                   text:"我的",
                   color:_currentIndex==INDEX_MINE?_kPrimaryColor:Colors.grey[900]
               )
         ]

         ),
       ),
     );
  }

}
