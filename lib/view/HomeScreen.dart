import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 200,
                color: Colors.blueAccent,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 100,
                        child: CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                        ),
                      ),
                    );
                    //  return _buildRowView(_buildListRow(context, namesList[index]));
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Container(
              height: .5,
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 200,
                color: Colors.blueAccent,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("$index"),
                      title: Text("Hello"),
                      subtitle: const Text("Welcome to Hello App",
                          style: TextStyle(
                              fontFamily: "Play Fair",
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      trailing: const Icon(Icons.connecting_airports_sharp),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
            Container(
              height: .5,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
                color: Colors.black12,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.blue
                        ),
                      ),
                    );
                },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Container(
              height: 1,
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 200,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
