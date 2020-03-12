import 'dart:convert';
import 'package:meta/meta.dart';

class Msg{
  final String name;
  final String avatar;
  final String company;
  final String position;
  final String msg;

  Msg({
    @required this.name,
    @required this.avatar,
    @required this.company,
    @required this.position,
    @required this.msg,
  });

  static List<Msg> fromJson(String json){
    List<Msg> _msgs = [];
    JsonDecoder jsonDecoder = new JsonDecoder();
    var mapdata = jsonDecoder.convert(json) ['list'];
    mapdata.forEach((obj){
      Msg job = new Msg(
          name: obj['name'],
          avatar: obj['avatar'],
          company: obj['company'],
          position: obj['position'],
          msg: obj['msg']);
      _msgs.add(job);
    });
    return _msgs;
  }
}