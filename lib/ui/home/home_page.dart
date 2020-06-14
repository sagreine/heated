import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_names/random_names.dart';
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //RandomWordsState().build(context),
            RandomWords(),
            //_buildTitle(this.widget.randomNames[0]),
          ],
        ),
      ),
    );
  }
  Widget _buildTitle(String input2) => Text(
    //"Heated",
    input2,
    textAlign: TextAlign.center,
  );
}
*/
/*class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = generateRandomNames(1);
    return Text(wordPair[0]);
  }
}*/

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <String>[];
  final Set<String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String name) {
              return ListTile(
                title: Text(
                name,
                style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles,
          )
          .toList();
          
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {//=> Text (
    //generateRandomNames(1)[0],
    //textAlign: TextAlign.center,
    return Scaffold (
      appBar: AppBar(
        actions: <Widget> [
        IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateRandomNames(10).take(10));
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow (String name) {
    final bool alreadySaved = _saved.contains(name);
    return ListTile(
      title: Text(
        name,
        style: _biggerFont,
      ),      
      trailing: Icon(
        alreadySaved ? FontAwesomeIcons.random : FontAwesomeIcons.random,
       //alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(name);
          } else {
            _saved.add(name);
          }
        });
      }
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}