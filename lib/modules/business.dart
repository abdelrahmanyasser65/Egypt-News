import 'package:flutter/material.dart';
import 'package:hh/modules/searchscreen.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../provider.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<NewsProvider>(context);
    var list=provider.business;
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              }, icon: const Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () =>
                  Provider.of<AppProvider>(context, listen: false)
                      .changeAppMode(),
              icon: const Icon(Icons.brightness_4_outlined))
        ],
      ),
      body:  list.isNotEmpty?ListView.separated(
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index)=>Items(
            article: list[index],
          ),
          separatorBuilder:(context,index)=> Container(
            width: double.infinity,
            margin:const EdgeInsets.all(20),
            color: Colors.grey[300],
            height: 1,
          ),
          itemCount: provider.business.length):
      const  Center(child: CircularProgressIndicator(),),
    );
  }
}

