import 'package:tamkeen2/Data_Json/Cooking_json.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cooking extends StatefulWidget {
  const Cooking({Key? key}) : super(key: key);

  @override
  _Cooking createState() => _Cooking();
}

class _Cooking extends State<Cooking> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    const avatarImage = 'lib/images/avatar.png';

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.pink[900],
        title: Text(
          "DISCOVER",
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
          ),
        ),
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
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: getBody(context), // Pass the BuildContext to the getBody method
    );
  }
}

Widget getBody(BuildContext context) {
  // Add the BuildContext parameter
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Cooking Profiles",
            style: GoogleFonts.bebasNeue(
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
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
          const SizedBox(
            height: 25,
          ),
          Column(
            children: List.generate(
              Cooking_usersList.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 13.75,
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      Cooking_usersList[index]['img'] ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Cooking_usersList[index]['name'] ?? '',
                                style: GoogleFonts.pacifico(fontSize: 19),
                              ),
                              Text(
                                Cooking_usersList[index]['bio'] ?? '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 250),
                                /*child: MaterialButton(
                                  onPressed: () {
                                    //Navigator.push(
                                    // context,
                                    // MaterialPageRoute(
                                    //   builder: (context) =>
                                    //       ProfileScreen()),
                                    //);
                                  },
                                  color: Colors.pinkAccent,
                                  child: Text(
                                    "Hire Me!",
                                    style: GoogleFonts.lobster(
                                      fontSize: 15,
                                      color: const Color.fromARGB(
                                        255,
                                        253,
                                        217,
                                        217,
                                      ),
                                    ),
                                  ),
                                ),*/
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Ayesha",
    "Zubaida Tariq",
    "Shireen Anwar",
    "Chef Zakir",
    "Chef Mehboob",
    "Sumaira Asif",
    "Sara Riaz",
    "Poppy Agha",
    "Chef Tahira Mateen",
    "Zarnak Sidhwa",
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

void filterSearchResults(String query) {
  // Implement your logic to filter the search results here
  // You can update the filteredSearchTerms list with the filtered results
  // For example:
  // filteredSearchTerms = searchTerms.where((term) => term.toLowerCase().contains(query.toLowerCase())).toList();
  // Then call setState to update the UI
}