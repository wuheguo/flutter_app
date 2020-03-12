import 'package:flutter/material.dart';

const double _KTextAndIconHeight = 53.0;
const double _KMarginBottom = 3.0;
class IconTab extends StatefulWidget{

  const IconTab({
    Key key,
    this.text,
    this.icon,
    this.color,
  }):assert(text!=null||icon!=null||color!=null),
  super(key:key);

  final String text;
  final String icon;
  final Color  color;

  @override
  State createState() {
    return new IconTabState();
  }
}

class IconTabState extends State<IconTab>{

  Widget _bulidTextLab(){
     return new Text(
       widget.text,softWrap: false,
       overflow: TextOverflow.fade,
       style: new TextStyle(color: widget.color),
     );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    double height = _KTextAndIconHeight;
    Widget lab = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          child: new Image(
            image: new AssetImage(widget.icon),
             height: 30.0,
             width: 30.0),
          margin: const EdgeInsets.only(bottom: _KMarginBottom)
        ),
        _bulidTextLab()
      ],);
    return SizedBox(
      height: height,
      child: new Center(
        child: lab,
        widthFactor: 1.0,
      ),
    );
  }
}