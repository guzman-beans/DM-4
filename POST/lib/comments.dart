import 'package:flutter/material.dart';
import 'post.dart';

import 'arch-json.dart';


class Comments extends StatefulWidget {
  final Post post;
  
  Comments({@required this.post}); 

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  ArchJsonPyC jsonPyC = new ArchJsonPyC();
  List<Comment> _comments = List<Comment>();

  @override
  void initState() {
    
    super.initState();
    jsonPyC.getComments(widget.post.id).then((value) => setState(() {
          _comments.addAll(value);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comments"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              IconButton(
                          color: Colors.blue,
                          iconSize: 24,
                          splashColor: Colors.blue,
                          icon: Icon(Icons.mode_comment),
                          onPressed: () {  },  
                        ),
              Card(
                margin: EdgeInsets.all(8),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 20.0, left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            widget.post.title,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        
                        margin: EdgeInsets.all(7),
                        width: MediaQuery.of(context).size.width - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "${_comments.length}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView.builder(
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.blue[50],
                            child: ListTile(
                                title: Text(
                                  _comments[index].name,
                                  style: TextStyle(color: Colors.black),
                                ),
                                
                                subtitle: Text(
                                    "${_comments[index].email}\n\n${_comments[index].body}",
                                    style: TextStyle(color: Colors.black)),
                                isThreeLine: true,
                                dense: false,
                                
                               ),
                               
                          );
                          
                        }),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
