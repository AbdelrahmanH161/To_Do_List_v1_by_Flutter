import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/provider/list_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);
    return ListView(
      children: provider.listcheacked
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
                          icon: FaIcon(FontAwesomeIcons.deleteLeft),
                          onPressed: () {
                            provider.removefromlistchecked(e.id);
                          })),
                ),
                onDismissed: (direction) {
                  provider.removefromlistchecked(e.id);
                },
              ))
          .toList(),
    );
  }
}
