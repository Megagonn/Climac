import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/provider/prov.dart';
import 'package:weather/service/api.dart';
import 'package:weather/ui/home.dart';
import 'package:weather/ui/searchresult.dart';
import 'package:weather/ui/ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [ChangeNotifierProvider(create: ((context) => Search()))],
        child: const Home(),
      ),
    );
  }
}

class SearchCity extends StatefulWidget {
  const SearchCity({Key? key}) : super(key: key);

  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  // var locus = ModalRoute.of(context)!.settings.arguments;
  // var locus;
  // getInfo() async {
  //   var res = await Api().getData('locus');
  // print(ModalRoute.of(context)!.settings.arguments.toString());
  // print(res);
  // }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // locus = ModalRoute.of(context)!.settings.arguments.toString();
    // getInfo();
  }

  @override
  Widget build(BuildContext context) {
    // var tofind = context.select((Search search) => search.geolocus.toString());
    var tofind = Provider.of<Search>(context, listen: true);
    var a = Provider.of<Search>(context, listen: true);
    // print('tofind ${tofind.geolocus.toString()}');
    // print("a ${a.geolocus.toString()}");
    getSearch() async {
      var res = await Api().getData(tofind.geolocus.toString());
      print('res $res');
      return res;
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: FutureBuilder(
                future: getSearch(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // ignore: prefer_const_constructors
                    return LinearProgressIndicator();
                  } else {
                    // print(snapshot.data);
                    var allData = snapshot.data;
                    var data = Weather.fromJson(snapshot.data);
                    // print(data);

                    return allData != null
                        ? Text(data.locationName)
                        : Text(' no data');
                  }
                })));
  }
}
