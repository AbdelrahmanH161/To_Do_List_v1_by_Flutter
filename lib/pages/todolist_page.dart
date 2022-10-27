import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/provider/list_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class todoPage extends StatefulWidget {
  const todoPage({super.key});

  @override
  State<todoPage> createState() => _todoPageState();
}

class _todoPageState extends State<todoPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);
    print(provider.datalist);
    return ListView(
      children: provider.datalist
          .map((e) => Dismissible(
                key: ValueKey(e.id),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/add",
                        arguments: {'id': e.id, "name": e.title});
                  },
                  child: ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.date.toString()),
                      trailing: IconButton(
                          icon: FaIcon(FontAwesomeIcons.check),
                          onPressed: () {
                            provider.addtolistchecked(e);
                            provider.removefromlist(e.id);
                          })),
                ),
                onDismissed: (direction) {
                  provider.addtolistchecked(e);
                  provider.removefromlist(e.id);
                },
              ))
          .toList(),
    );
  }
}
