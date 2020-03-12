import 'package:flutter/material.dart';
import 'package:flutter_app/app/item/msglist_item.dart';
import 'package:flutter_app/app/model/msg.dart';

class MsgsTab extends StatefulWidget{

  @override
  MsgList createState()=> new MsgList();

}

class MsgList extends State<MsgsTab>{
  List <Msg> _msgs =[];

  @override
  void initState() {
    super.initState();
    getMsgList();
  }



  void getMsgList(){
    setState(() {
      _msgs = Msg.fromJson("""{
         "list": [
             {
             "name": "小可爱",
             "avatar": "http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg",
             "company": "百度",
             "position": "HR",
             "msg": "你好"
             }
             ]
         }""");
    });
  }




  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       backgroundColor: new Color.fromARGB(255,242,242,245),
       appBar: new AppBar(
         elevation: 0.0,
         title: new Center(
           child: new Text(
             "消息",
             style: new TextStyle(
               fontSize: 20.0,
               color: Colors.white
             ),
           ),
         )
         /*new Text(
           "消息",
           style: new TextStyle(
             fontSize: 20.0,
             color: Colors.white,
           ),
         )*/,
       ),
       body: new ListView.builder(
           itemCount:_msgs.length,
           itemBuilder: buildMsgItem),
     );
  }

  Widget buildMsgItem(BuildContext context,int index){
    Msg msg = _msgs[index];

    var jonItem = new InkWell(
      onTap:(){
        showDialog(
          context: context,
          child:new AlertDialog(
            content: new Text(
              "心情期待！",
              style: new TextStyle(
                fontSize: 20.0,
              ),
            ),
          )
        );
      },
      child: new MsgListItem(msg),
    );
    return jonItem;
  }

}
