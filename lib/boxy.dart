import 'package:flutter/material.dart';
import 'package:boxy/boxy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomBoxy example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var state = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomBoxy example')),
      body: Center(
        child: CustomBoxy(
          delegate: MyDelegate(),
          children: [
            LayoutId(
              id: #first,
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(8.0),
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      state = !state;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 1000),
                    color: state ? Colors.lightBlue : Colors.lightGreen,
                    width: state ? 200 : 400,
                    height: state ? 100 : 400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDelegate extends BoxyDelegate {
  @override
  Size layout() {
    var firstChild = getChild(#first);

    var firstSize = firstChild.layout(constraints);
    firstChild.position(Offset.zero);

    var text = Padding(
      child: Text(
        "^ This guy is ${firstSize.width.round()} x ${firstSize.height.round()}",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.all(8),
    );

    // Inflate the text widget
    var secondChild = inflate(text, id: #second);

    var secondSize = secondChild.layout(
      constraints
          .deflate(EdgeInsets.only(top: firstSize.height))
          .tighten(width: firstSize.width),
    );

    secondChild.position(Offset(0, firstSize.height));

    return Size(firstSize.width, firstSize.height + secondSize.height);
  }
}
