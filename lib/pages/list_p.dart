import 'package:flutter/material.dart';

class ListW extends StatefulWidget {
  Set sale;
  ListW({
    Key? key,
    required this.sale,
  }) : super(key: key);

  @override
  State<ListW> createState() => _ListWState();
}

class _ListWState extends State<ListW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Список покупок'),
      ),
      body: ListView(
        children: widget.sale
            .map((e) => Card(
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e,
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          widget.sale.remove(e);
                        });
                      },
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
