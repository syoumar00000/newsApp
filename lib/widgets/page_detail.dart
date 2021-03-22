import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'texte_sy.dart';
import 'package:sy_news/models/data_convertisseur.dart';

class PageDetail extends StatelessWidget {
  PageDetail (RssItem item){
    this.item = item;
  }
  RssItem item;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detail de l'article"),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            padding(),
            new TexteSy(item.title, fontSize: 25.0, fontStyle: FontStyle.italic,),
            padding(),
            new Card(
              elevation: 7.5,
              child: new Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: new Image.network(item.enclosure.url, fit: BoxFit.fill,),
              ),
            ),
            padding(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new TexteSy(item.author),
                new TexteSy(ConvertisseurDate().convertirDate(item.pubDate.toString()), color: Colors.red,),
              ],
            ),
            padding(),
            new TexteSy(item.description),
            padding(),
          ],
        ),
      ),
    );
  }
  Padding padding() {
    return new Padding(padding: EdgeInsets.only(top: 20.0));
  }
}