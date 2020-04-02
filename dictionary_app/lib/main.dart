import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _url = "https://owlbot.info/api/v4/dictionary/";
  String _token = "cae48a4b39adadbe2e1e9aeffaeb368deea84c61";
  TextEditingController _controller = TextEditingController();
  StreamController _streamController;
  Stream _stream;
  _search(){

    if(_controller.text == null || _controller.text.length == 0){
      _streamController.add(null);
    }

  }

  @override
  void initState(){
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dictionary"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(49.0),
            child: Row(
              children: <Widget>[
                Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: TextFormField(

                        onChanged: (String text){},
                        controller: _controller,
                        decoration: InputDecoration(
                        hintText: "look for a word",
                        contentPadding: const EdgeInsets.only(left: 24.0),
                        border: InputBorder.none,
                    ),
                  ),
                      ),
                ),
                
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: (){
                     _search();
                  },
                )
              ],
              ),
              

          ),
        ),
        body: StreamBuilder(builder: null)
        );
  }
}
