import 'package:flutter/material.dart';
import 'package:todo/model/methodsqlite.dart';

import 'Addtodo.dart';

class allTodo extends StatefulWidget {
  @override
  _allTodoState createState() => _allTodoState();
}

class _allTodoState extends State<allTodo> {
  @override
  List data = new List();
  void loadData()async{
    Notes().getData().then((value) =>
    setState((){
      data.addAll(value);
    })
    );
  }

  @override
  void initState() {
    loadData();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {},
                        color: Colors.orangeAccent,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Notes',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            listtodo(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.border_clear),
                  onPressed: () {},
                  color: Colors.orangeAccent,
                ),
                Text(' ${data.length} Notes'),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addtodo(),
                        ));
                  },
                  color: Colors.orangeAccent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget listtodo() {
    if(data != null && data.length > 0) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              title: Text(
                '${data[index]['note']}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                'thursday johnny lve is leaving apple f...',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Notes().delete(id: data[index]['id']);
                  setState(() {
                    data.removeAt(index);
                  });


                },
                color: Colors.red,
              ),
            ),
            Divider(
              thickness: 2.0,
            )
          ],
        );
      },
      itemCount: data.length,
      shrinkWrap: true,
    );}else{
      return Center(child: Text('NO DATA AT THIS TIME'),);
    }
  }
}
