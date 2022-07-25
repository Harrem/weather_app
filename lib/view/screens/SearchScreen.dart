import 'package:flutter/material.dart';
import 'package:weather_app/controller/apiServices.dart';
import 'package:weather_app/model/currentWeather.dart';
import 'package:weather_app/view/Widgets/InfWidget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiServices apiServices = ApiServices();
  TextEditingController cityController = TextEditingController();
  List _history = <Widget>[];

  Post? post;
  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(color: Colors.black),
                      controller: cityController,
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
                          prefixIcon: InkWell(
                            child: Icon(Icons.search),
                            onTap: () async {
                              final response = await apiServices.getJsons();
                              setState(() {
                                post = response;
                                _history.insert(
                                    0,
                                    InfWidget(
                                      temperature: '${post?.current.tempC}°',
                                      locationName: '${post?.location.name}',
                                      localTime: '${post?.location.localtime}',
                                      image: '${post?.current.condition.icon}',
                                    ));
                              });
                            },
                          )),
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
                if (post != null)
                  Expanded(
                      child: ListView.builder(
                          itemCount: _history.length,
                          itemBuilder: (context, index) {
                            return _history[index];
                          })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
