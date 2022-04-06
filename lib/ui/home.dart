import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/service/api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name = 'Yusuff';

  var result2;
  var result3;
  var result4;
  // var result11;
  // var result21;
  // var result31;
  // var result41;
  // List myList = [];
  getWeather() async {
    // var result1;
    var result1 = await Api().getData('london');
    result2 = await Api().getData('ede');
    result3 = await Api().getData('ogbomoso');
    result4 = await Api().getData('ohio');
    print(result1);

    List myList = [result1, result2, result3, result4];
    // setState(() {
    //   result11 = result1;
    //   result21 = result2;
    //   result31 = result3;
    //   result41 = result4;
    // });
    // print('---$result1');
    // return result1;
    return myList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    // List list = [result11, result21, result31, result41];
    // print(myList);

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello $name,\nDiscover the weather",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffe5e5e5),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // height: 300,
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: getWeather(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      // print('this is snapshot ${snapshot.data}');
                      // print("+++++${data.locationName}");
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LinearProgressIndicator();
                      } else {
                        var allData = snapshot.data;
                        // var data = Weather.fromJson(snapshot.data);
                        return SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height-100,
                            child: ListView.builder(
                              itemCount: allData.length,
                              itemBuilder: (context, val) {
                                var data = Weather.fromJson(allData[val]);
                                return Container(
                                  margin:const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xFF6151C3),
                                  // borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.country,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 30,
                                              ),
                                              child: Text(
                                                data.locationName,
                                                style: const TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Text(
                                              data.main,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image(
                                              image: NetworkImage(
                                                  "http://openweathermap.org/img/wn/${data.image}@2x.png"),
                                            ),
                                            Text(
                                              "${data.temp.toString()}°C",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
