import 'package:flutter/material.dart';
import 'package:postdex/arch-json.dart';
import 'post.dart';
import 'comments.dart';
import 'arch-json.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  ArchJsonPyC jsonPyC = new ArchJsonPyC();
  List<Post> _post = List<Post>();
  @override
  void initState() {
    jsonPyC.getPost().then((value) => setState(() {
          _post.addAll(value);
        }));

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post_App"),
        backgroundColor: Colors.blue
      ),
      body: ListView.builder(
        
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Card(
            
            margin: EdgeInsets.all(10),
            color: Colors.blue[100],
            child: Column(
              children: <Widget>[
                
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                     
                      Text(
                        _post[index].title,
                        style: TextStyle(
                          color: Colors.black,
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("\n${_post[index].body}",
                        style: TextStyle(color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[ 
                         IconButton(
                          color: Colors.black54,
                          iconSize: 24,
                          splashColor: Colors.blue,
                          icon: Icon(Icons.people_outline), 
                          onPressed: () {  },  
                        ),
                         IconButton(
                          color: Colors.black54,
                          iconSize: 24,
                          splashColor: Colors.blue,
                          icon: Icon(Icons.question_answer),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Comments(
                                      post: _post[index],
                                    )));
                          },
                        ),
                       
                        Text("New comments", style: TextStyle(
                          color: Colors.black,
                          fontSize: 15)),
                      ],
                    ),
                  ),
                  
                )
              ],
            ),
          );
        },
      ),
    );
  }
}



