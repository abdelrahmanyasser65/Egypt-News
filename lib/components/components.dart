import 'package:flutter/material.dart';
import 'package:hh/modules/webscreen.dart';

class Items extends StatelessWidget {
  const Items({Key? key, required this.article}) : super(key: key);
  final Map article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> WebViewScreen(article['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${article['title']}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List icon=const [
  Icons.business,
  Icons.sports,
  Icons.science,
  Icons.computer,
  Icons.health_and_safety,
  Icons.celebration,
];
List title=[
  'Business',
  'Sports',
  'Science',
  'Technology',
  'Health',
  'Entertainment'
];


