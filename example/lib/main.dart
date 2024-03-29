import 'package:flutter/material.dart';
import 'package:flutter_matrix_html/flutter_html.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: Container(
          width: 200,
          color: Colors.yellow,
          child: Html(
            data: """
<p>Alo:</p><br/><ul><br/><li>Alo</li><br/></ul>


            """,
            defaultTextStyle:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 100),
            onLinkTap: (url) => print('clicked on url $url'),
            linkStyle: TextStyle(decoration: TextDecoration.underline),
            shrinkToFit: true,
            inlineSpanEnd: WidgetSpan(
                child: Visibility(
                    child: Container(
              height: 50,
            ))),
          ),
        ),
      ),
    );
  }
}
