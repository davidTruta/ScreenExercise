import 'package:flutter/material.dart';
import 'package:screen_exercise/screens/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String info = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Main Screen',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Text(
                'Selected info:\n\n' + info,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return CategoriesScreen();
                  })).then((value) {
                    setState(() {
                      if (value != null) {
                        info = value['category'] + ' - ' + value['subcategories'];
                      }
                      else{
                        info = 'You gotta hit the button!';
                      }
                    });
                  });
                },
                child: const Text('Open Categories')),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
