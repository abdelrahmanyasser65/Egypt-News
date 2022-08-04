import 'package:flutter/material.dart';
import 'package:hh/modules/searchscreen.dart';
import 'package:hh/provider.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NewsProvider>(context);
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
          body: GridView.builder(
              padding:const EdgeInsets.all(13),
              gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 1.5/2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
              ),
              itemCount: 6,
              itemBuilder: (ctx,index)=>
                  InkWell(
                    onTap: (){
                      Navigator.push(ctx, MaterialPageRoute(builder:
                          (ctx)=>provider.screens[index]));
                    },
                    child: Container(
                      padding:const EdgeInsets.only(
                        top: 40,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:Provider.of<AppProvider>(context).isDark?
                          Colors.white.withOpacity(0.08): Colors.black.withOpacity(0.08)
                      ),
                      child: Column(

                        children: [
                          Icon(icon[index],color: Colors.deepOrange,size: 80,),
                          const SizedBox(height: 10,),
                          Text(title[index],style:Theme.of(context).textTheme.bodyText2,)
                        ],
                      ),
                    ),
                  )),
          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.only(right: 3, left: 3),
          //   child: BottomNavigationBar(
          //     items: provider.bottomItems,
          //     onTap: (index) {
          //       provider.changeBottomNavBar(index);
          //     },
          //     currentIndex: provider.currentIndex,
          //   ),
          // ),
        );

  }
}
