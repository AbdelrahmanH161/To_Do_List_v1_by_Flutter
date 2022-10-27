import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/provider/list_provider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var title;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(
          "Add Work",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    this.title = value;
                  });
                },
                decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(
                    gapPadding: 40,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: ElevatedButton(
                  onPressed: () {
                    provider.addtolist(this.title);
                  },
                  child: Text("Add for To Do",
                      style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      )),
    );
  }
}
