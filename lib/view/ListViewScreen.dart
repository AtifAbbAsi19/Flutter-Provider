import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';
import '../core/FontsFamily.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key, required this.title});

  final String title;

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  var namesList = [
    "Atif",
    "Hamid",
    "Salman",
    "Danish",
    "Hameed",
    "Karan",
    "Raju",
    "Atif 1",
    "Hamid 1",
    "Salman 1",
    "Danish 1",
    "Hameed 1",
    "Karan 1",
    "Raju 1",
    "Atif 2",
    "Hamid 3",
    "Salman 4",
    "Danish 5",
    "Hameed 6",
    "Karan 7",
    "Raju 8"
  ];

  Widget _buildListRow(BuildContext context, String? name) {
    return Text(
      'Hello, $name! How are you?',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRowPadding(Widget row) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: row,
    );
  }


  /**
   *  divider for rows
   */
  Widget _buildRowDivider(double? height) {
    return Divider(
      height: height,
      thickness: 2.0,
    );
  }

  /**
   * Screen background View , Container or SizedBox
   *  with background color
   */
  Widget _buildScreenBackground(Widget child) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueAccent.shade100,
      child: child,
    );
  }


  Widget _buildRowView(Widget row) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26,width: 2),
        color: Colors.white, borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            blurRadius: 51,
            offset: const Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Center(child: row),
    );
  }


  Widget _buildListTile(int index, String? name){

    return ListTile(
      leading: Text("$index"),
      title: Text("Hello $name"),
      subtitle: const Text("Welcome to Hello App" ,style:TextStyle(fontFamily: "Play Fair" ,fontWeight: FontWeight.w500,fontSize: 16)),
      trailing: const Icon(Icons.connecting_airports_sharp),
    );
  }


  /**
   *  ******** Recycler View **********
   * Separated List View for screen
   */
  Widget _buildSeparatedListViewContent() {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _buildListTile(index,namesList[index]);
        //  return _buildRowView(_buildListRow(context, namesList[index]));
        },
        itemCount: namesList.length,
        //  itemExtent: 100, //will work for list builder
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return _buildRowDivider(2.0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /*   appBar: AppBar(
          title: Text(widget.title),
        ),*/
        // body: ListView.builder(
        body: Container(
          //  margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            child: _buildScreenBackground(_buildSeparatedListViewContent()))
    );
  }
}
