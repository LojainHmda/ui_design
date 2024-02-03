import 'package:flutter/material.dart';
import 'package:ui_design/widgets/cards.dart';
import 'package:ui_design/widgets/category_widget.dart';
import 'package:ui_design/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categories = ["All", "Sport", "Politics", "Education", "Games"];
  String selectedCategory = '';
  Map<String, List<Map<String, String>>> categoryNews = {
    "All": [
      {
        "category": "Sport",
        "title": "Sport News 1",
        "publisher": "Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Sport",
        "title": "Sport News 2",
        "publisher": " Publisher 2",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Politics",
        "title": "Politics News 1",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Politics",
        "title": "Politics News 2",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Politics",
        "title": "Politics News 1",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Politics",
        "title": "Politics News 2",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
    ],
    "Sport": [
      {
        "category": "Sport",
        "title": "Sport News 1",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Sport",
        "title": "Sport News 2",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
    ],
    "Politics": [
      {
        "category": "Politics",
        "title": "Politics News 1",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Politics",
        "title": "Politics News 2",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
    ],
    "Education": [
      {
        "category": "Education",
        "title": "Education News 1",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Education",
        "title": "Education News 2",
        "publisher": "Publisher 2",
        "publishDate": "Feb 27, 2023"
      },
    ],
    "Games": [
      {
        "category": "Games",
        "title": "Games News 1",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
      {
        "category": "Games",
        "title": "Games News 2",
        "publisher": " Publisher 1",
        "publishDate": "Feb 27, 2023"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Discover",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Text(
                "News from all around the world ",
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const SizedBox(height: 30.0),
              const SearchWidget(),
              const SizedBox(height: 30.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CategoryWidget(
                        category: category,
                        isSelected: selectedCategory == category,
                        onSelect: () {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: categoryNews[selectedCategory]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final news = categoryNews[selectedCategory]![index];
                    return NewsCard(news: news); // Use the NewsCard widget
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
