import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final  searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NewsProvider>(context);
    var list = provider.search;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:const  EdgeInsets.all(20),
              child: TextFormField(
                controller: searchController,
                onChanged: (val){
                  provider.getSearch(val);
                },
                keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     label: const Text("Search"),
                     prefixIcon:const Icon(Icons.search),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15),
                       borderSide:const BorderSide(
                         width: 2,color: Colors.grey
                       )
                     )
                   ),
              ),
            ),
            SizedBox(
              height:700,
              child: ListView.separated(
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
                  itemCount: provider.search.length),
            ),
          ],
        ),
      ),
    );
  }
}
