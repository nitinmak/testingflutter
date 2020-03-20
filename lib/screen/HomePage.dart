import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/Constant.dart';
import 'package:flutter_app/model/newsArticle.dart';
import 'package:flutter_app/services/webservice.dart';

class HomeScreenState extends State<NewsList> {
  List<NewsArticle> litems = List<NewsArticle>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {
    Webservice().load(NewsArticle.all).then((newsArticles) => {
          setState(() => {litems = newsArticles})
        });
  }

  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        body: ListView.builder(
      itemBuilder: (context, position) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Image.network(litems[position].urlToImage,width:MediaQuery.of(context).size.width-70,height:200),
                    ),
                    Padding(

                      child: Container(
                      width: MediaQuery.of(context).size.width-70,
                        child: Text(
                          litems[position].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.access_alarm,
                            size: 24,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Alarm",
                              style: TextStyle(color: Colors.green),
                            ))
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "q5m",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.star_border,
                          size: 32.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
      itemCount: litems.length,
    ));
  }
}

class NewsList extends StatefulWidget {
  @override
  createState() => HomeScreenState();
}
