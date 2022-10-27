// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/pages/done_page.dart';
import 'package:flutter_to_do_list/pages/todolist_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mianscreen extends StatefulWidget {
  const Mianscreen({super.key});

  @override
  State<Mianscreen> createState() => _MianscreenState();
}

class _MianscreenState extends State<Mianscreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: FaIcon(FontAwesomeIcons.ellipsisVertical,color:Colors.white),
            )
          ],
          title: Text("To_Do_List", style: TextStyle(color:Colors.white)),
          // ignore: prefer_const_literals_to_create_immutables
          bottom: TabBar(tabs: [
            Tab(icon: FaIcon(FontAwesomeIcons.list , color:Colors.white)),
            Tab(icon: FaIcon(FontAwesomeIcons.listCheck ,color:Colors.white))
          ]),
        ),
        body: TabBarView(children: [todoPage(), DonePage()]),
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/add");
          },
          icon: FaIcon(
            FontAwesomeIcons.circlePlus,
          ),
          color: Colors.cyan,
          iconSize: 80,
        ),
      ),
    );
  }
}
