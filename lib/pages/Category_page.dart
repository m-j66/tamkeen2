import 'package:tamkeen2/components/product_item_tile.dart';
import 'package:tamkeen2/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    const avatarImage = 'lib/images/avatar.png';
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.pink[900],
        title: Text(
          "",
          style: GoogleFonts.bebasNeue(
            fontSize: 35.5,
          ),
        ),
        leading: const Icon(Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 244, 244)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                avatarImage,
              ),
            ),
          ),
        ],
      ),
     /* bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(254, 248, 235, 245),
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ' ',
          ),
        ],
        currentIndex: selectedItemIndex,
        onTap: (int index) {
          setState(() {
            selectedItemIndex = index;
          });
        },
      ),*/
      body: Column(
        children: [
          //Search bar
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: TextField(
                      onChanged: (value) {
                        // Call filterSearchResults here passing the updated value
                        filterSearchResults(value);
                      },
                      cursorColor: Colors.pinkAccent,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Profile",
                        /* icon: Icon(
                          Icons.person,
                          color: Colors.pinkAccent,
                        ),*/
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 9),
          //Categories display title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.8),
            child: Text(
              "Categories",
              style: GoogleFonts.bebasNeue(
                fontSize: 50,
              ),
            ),
          ),

          //List of Product tiles(grid)
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount:
                      value.categories.isNotEmpty ? value.categories.length : 0,
                  padding: const EdgeInsets.all(11),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItemTile(
                      itemName: value.categories[index][0],
                      imagePath: value.categories[index][1],
                      color: value.categories[index][2],
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterSearchResults(String query) {
    // Implement your logic to filter the search results here
    // You can update the filteredSearchTerms list with the filtered results
    // For example:
    // filteredSearchTerms = searchTerms.where((term) => term.toLowerCase().contains(query.toLowerCase())).toList();
    // Then call setState to update the UI
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Arts and Craft",
    "Photography",
    "Sewing",
    "Cooking",
  ];

  List<String> filteredSearchTerms = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          "Search Results for '$query'",
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: filteredSearchTerms.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filteredSearchTerms[index]),
              onTap: () {
                // Do something when a search result is selected
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter the search terms based on the query
    filteredSearchTerms = query.isEmpty
        ? searchTerms
        : searchTerms
            .where((term) => term.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: filteredSearchTerms.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSearchTerms[index]),
          onTap: () {
            // Do something when a search suggestion is selected
          },
        );
      },
    );
  }
}