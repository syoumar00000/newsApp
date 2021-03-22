import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sy_news/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'chargement.dart';
import 'liste.dart';
import 'grille.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    RssFeed feed;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: (){
            setState(() {
              feed = null;
              parse();
            });
          })
        ],
      ),
      body: choixDuBody(),
    );
  }

  Widget choixDuBody() {
    if(feed == null){
      return new Chargement();
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if(orientation == Orientation.portrait){
        //liste
        return new Liste(feed);
      } else {
        //grille
        return new Grille(feed);
      }
    }
  }

  Future<Null> parse() async {
    RssFeed recu = await Parser().chargerRSS();
    if(recu != null){
      setState(() {
        feed = recu;
        print(feed.items.length);
        feed.items.forEach((feedItem) {
           RssItem  item = feedItem;
           print(item.title);
           print(item.pubDate);
           print(item.description);
           print(item.enclosure.url);
        });
      });
    }
  }
}

