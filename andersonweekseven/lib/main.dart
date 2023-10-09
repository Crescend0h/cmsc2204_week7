import 'package:andersonweekseven/views/EditItemPage.dart';
import 'package:flutter/material.dart';
import 'models/item.dart';
import 'models/globalitems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anderson Week 7',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Anderson Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Item item = new Item(1, "me", "myself");

  void _handleButtonPress()
  {
    setState(() {
      if(!GlobalItems().items.contains((index) => index.id == item.id)) {
        GlobalItems().items.add(item);
      }
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => EditItemPage(item: item)))
        .then(((value) => {setState(() => item = GlobalItems()
        .items
        .firstWhere((index) => index.id == item.id))}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: GlobalItems().items.map((item){
                return Column(
                  children: [
                    Text('Item Information', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text('Item ID: ${item.id}', style: TextStyle(fontSize: 20),),
                    Text('Item Name: ${item.name}', style: TextStyle(fontSize: 20),),
                    Text('Item Description: ${item.Description}', style: TextStyle(fontSize: 20),),
                    ElevatedButton(onPressed: _handleButtonPress, child: Text("Edit Item")),
                    Divider()
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
