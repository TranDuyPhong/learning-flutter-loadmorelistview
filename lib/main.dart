import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class InfiniteListView extends StatefulWidget {
    @override 
    State<StatefulWidget> createState() {
        return new InfiniteListViewState();
    }
}

class InfiniteListViewState extends State<InfiniteListView> {
    var items = new List<String>.generate(20, (index) {
        return 'Item $index';
    });

    @override 
    Widget build(BuildContext buildContext) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('LoadMore with ListView'),
            ),
            body: new Container(
                child: new ListView.builder(
                    itemCount: items.length + 1,
                    itemBuilder: (context, index) {
                        final widgetItem = (index == items.length) ? 
                            new RaisedButton(
                                onPressed: () {
                                    var nextItems = new List<String>.generate(20, (i) {
                                        var itemId = items.length + i;
                                        return 'Item $itemId';
                                    });
                                    setState(() {
                                        this.items.addAll(nextItems);
                                    });
                                },
                                child: new Text(
                                    'LoadMore',
                                    style: new TextStyle(
                                        color: Colors.white
                                    ),
                                ),
                                color: Colors.blue,
                                splashColor: Colors.red,
                                elevation: 4.0,
                            ) : 
                            new ListTile(
                                title: new Text(
                                    this.items[index],
                                    style: new TextStyle(
                                        fontSize: 18.0,
                                        color: index.isEven ? Colors.red : Colors.blue
                                    ),
                                ),
                            );
                        return widgetItem;
                    },
                ),
            )
        );
    }
}

class MyApp extends StatelessWidget {
    @override 
    Widget build(BuildContext buildContext) {
        return new MaterialApp(
            title: 'My App',
            home: new InfiniteListView()
        );
    }
}