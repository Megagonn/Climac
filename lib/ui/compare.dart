
import 'package:flutter/material.dart';

class Compared extends StatefulWidget {
  const Compared({Key? key}) : super(key: key);

  @override
  _ComparedState createState() => _ComparedState();
}

class _ComparedState extends State<Compared> {
  @override
  Widget build(BuildContext context) {
    dynamic loci = ModalRoute.of(context)!.settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF6151C3),
          title: const Text("City Comparison", style: TextStyle(color: Colors.white),),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              // ignore: prefer_const_literals_to_create_immutables
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.symmetric(
                    outside: const BorderSide(
                      color: Color(0xFF6151C3),
                      width: 3,
                    ),
                    inside: const BorderSide(
                      color: Color(0xFF6151C3),
                    ),
                  ),
                  children:  [
                    // ignore: prefer_const_constructors
                    TableRow(
                      // ignore: prefer_const_constructors
                      decoration: Decoration.lerp(
                        BoxDecoration(
                        color: Color.fromARGB(255, 212, 206, 250)
                      ), BoxDecoration(
                        color: Color.fromARGB(255, 197, 190, 248)
                      ),1
                      ),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(''),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loci[0].locationName),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loci[1].locationName),
                            ),
                          ),
                        ]),
                    // ignore: prefer_const_constructors
                    TableRow(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Weather (Main)'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loci[0].main),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loci[1].main),
                            ),
                          ),
                        ]),
                    // ignore: prefer_const_constructors
                    TableRow(
                      decoration: Decoration.lerp(
                        BoxDecoration(
                        color: Color.fromARGB(255, 212, 206, 250)
                      ), BoxDecoration(
                        color: Color.fromARGB(255, 197, 190, 248)
                      ),1
                      ),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Weather (Description)'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loci[0].description),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loci[1].description),
                            ),
                          ),
                        ]),
                    // ignore: prefer_const_constructors
                    TableRow(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Temperature'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${loci[0].temp.toString()}°C'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${loci[1].temp.toString()}°C'),
                            ),
                          ),
                        ]),
                    // ignore: prefer_const_constructors
                    TableRow(
                      decoration: Decoration.lerp(
                        BoxDecoration(
                        color: Color.fromARGB(255, 212, 206, 250)
                      ), BoxDecoration(
                        color: Color.fromARGB(255, 197, 190, 248)
                      ),1
                      ),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Humidity'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loci[0].humidity.toString()),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loci[1].humidity.toString()),
                            ),
                          ),
                        ]),
                    // ignore: prefer_const_constructors
                    TableRow(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Wind'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${loci[0].wind.toString()} mph'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${loci[1].wind.toString()} mph'),
                            ),
                          ),
                        ]),
                    // ignore: prefer_const_constructors
                    TableRow(
                      decoration: Decoration.lerp(
                        BoxDecoration(
                        color: Color.fromARGB(255, 212, 206, 250)
                      ), BoxDecoration(
                        color: Color.fromARGB(255, 197, 190, 248)
                      ),1
                      ),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Pressure'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${loci[0].pressure.toString()} mmHg'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${loci[1].pressure.toString()} mmHg'),
                            ),
                          ),
                        ]),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  getData() {}
}
