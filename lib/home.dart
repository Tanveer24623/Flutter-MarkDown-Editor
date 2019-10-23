import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _controller;
  TextEditingController _textEditingController;
  String text = "";
  
  final TextStyle style = TextStyle(color: Colors.black);

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _textEditingController = TextEditingController();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Muira",style: style,),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(child: Text("Edit", style: style,)),
            Tab(child: Text("Preview", style: style,))
          ],
        ),
      ),
      body: TabBarView(  
        controller: _controller,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Add Markdown",
              ),
              onChanged: (String text){
                setState(() {
                  this.text = text;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: MarkdownBody(data: text,),
          )
        ],
      ),
    );
  }
}