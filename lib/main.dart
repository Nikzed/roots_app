// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double xPosition = 50;
  double yPosition = 250;
  double xPosition2 = 250;
  double yPosition2 = 250;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DragTarget<double>(
            builder:
                (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Stack(
                    children: [
                      Positioned(
                        top: yPosition,
                        left: xPosition,
                        child: Draggable(
                          feedback: Card(
                            color: Colors.green,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 40,
                                minWidth: 100,
                              ),
                              child: Center(child: Text('Card 1')),
                            ),
                          ),
                          childWhenDragging: SizedBox.shrink(),
                          child: Card(
                            color: Colors.blue,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 40,
                                minWidth: 100,
                              ),
                              child: Center(child: Text('Card 1')),
                            ),
                          ),
                          onDragEnd: (details) {
                            setState(() {
                              xPosition = details.offset.dx;
                              yPosition = details.offset.dy;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Text('Card 1'),
                      ),
                      Positioned(
                        top: yPosition2,
                        left: xPosition2,
                        child: Draggable(
                          feedback: Card(
                            color: Colors.green,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 40,
                                minWidth: 100,
                              ),
                              child: Center(child: Text('Card 2')),
                            ),
                          ),
                          childWhenDragging: SizedBox.shrink(),
                          child: Card(
                            color: Colors.blue,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 40,
                                minWidth: 100,
                              ),
                              child: Center(child: Text('Card 2')),
                            ),
                          ),
                          onDragEnd: (details) {
                            setState(() {
                              xPosition2 = details.offset.dx;
                              yPosition2 = details.offset.dy;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
            onAcceptWithDetails: (DragTargetDetails<double> details) {
              // print(details.data);
            },
          ),
        ),
      ),
    );
  }
}
