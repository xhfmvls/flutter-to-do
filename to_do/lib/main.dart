// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'supabase_handler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  SupaBaseHandler supaBaseHandler = SupaBaseHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          // ignore: unnecessary_null_comparison
          if (snapshot.hasData == null &&
              snapshot.connectionState == ConnectionState.none) {}
          var data = (snapshot.data as List).toList();
          return ListView.builder(
            // ignore: unnecessary_null_comparison
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                color: data[index]['status'] ? Colors.white : Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      child: Text(data[index]['task']),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.done),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
        future: supaBaseHandler.readData(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            
          });
        },
      ),
    );
  }
}
