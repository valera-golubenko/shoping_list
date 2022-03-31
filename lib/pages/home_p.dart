import 'package:flutter/material.dart';
import 'package:shoping_list/pages/list_p.dart';

class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  String tempData = '';
  final Set shopingList = {};
  final Set dateList = {};
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
  }

  _addDataButton() {
    setState(() {
      dateList.add(selectedDate);
    });
  }

  _routePageList() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ListW(sale: shopingList);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Список покупок'),
        backgroundColor: const Color.fromARGB(255, 250, 150, 19),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: dateList.map((e) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: InkWell(
              onTap: _routePageList,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${e.day}/${e.month}/${e.year}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Добавить покупку'),
                  content: TextField(
                    onChanged: (value) {
                      tempData = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        shopingList.add(tempData);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Добавить'),
                    )
                  ],
                );
              });

          _addDataButton();
        },
        backgroundColor: const Color.fromARGB(255, 250, 150, 19),
        child: const Icon(Icons.add),
      ),
    );
  }
}
