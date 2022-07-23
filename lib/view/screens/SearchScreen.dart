import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/controller/apiServices.dart';
import 'package:weather_app/model/currentWeather.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    final futurePost = apiServices.getJsons();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bk.jpg'), fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'بەیانیت باش',
                  style: TextStyle(fontSize: 30, fontFamily: 'nrt'),
                ),
                Text(
                  '21th July, 2022',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 16),
                    width: size.width * 0.9,
                    height: 60,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 15, right: 10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none),
                          hintText: 'گەڕان بۆ شارەکان',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontFamily: 'nrt'),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20, top: 6),
                  child: Text(
                    '...گەڕانەکانی پێشوو',
                    style: TextStyle(fontFamily: 'nrt'),
                  ),
                ),
                Expanded(
                    child: FutureBuilder(
                  future: futurePost,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Post? datas = snapshot.data as Post?;
                      return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(14)),
                                height: 110,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 25),
                                            child: Text(
                                              '${datas!.current.tempC} °',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          VerticalDivider(
                                            indent: 10,
                                            endIndent: 10,
                                            thickness: 0.3,
                                            color: Colors.white,
                                          ),
                                          Text(datas.location.name),
                                          Image.network(
                                            'https://cdn.weatherapi.com/weather/64x64/day/113.png',
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget image,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return image;
                                              }
                                              return SizedBox(
                                                height: 300,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 100, bottom: 10, right: 100),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        child: Center(
                                          child: Text(
                                            datas.location.localtime,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ));
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
