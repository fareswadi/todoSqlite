import 'package:flutter/material.dart';
import 'package:todo/showall.dart';

import 'model/methodsqlite.dart';

class Addtodo extends StatefulWidget {
  @override
  _AddtodoState createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  @override
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String notes;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {},
                          color: Colors.orangeAccent,
                          iconSize: 24,
                        ),
                        Text(
                          'Notes',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.person_add),
                          onPressed: () {},
                          color: Colors.orangeAccent,
                          iconSize: 24,
                        ),
                        IconButton(
                          icon: Icon(Icons.system_update_alt),
                          onPressed: () {},
                          color: Colors.orangeAccent,
                          iconSize: 24,
                        ),
                        InkWell(
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                            ),
                          ),
                          onTap: addNotes,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Form(
                key: formState,
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        // maxLines: null,
                      //  initialValue: null,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            // counterText: 'Enter Notes Unlimted Data',
                            suffixText: 'Your Notes'),
                        onSaved: (val) => notes = val,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Please Enter data';
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  addNotes() async {
    if (formState.currentState.validate()) {
      formState.currentState.save();
      // Notes().create();
      int add = await Notes().create({'note': '$notes'});
      print(add);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => allTodo(),
          ));
      formState.currentState.reset();
    }
  }
}
