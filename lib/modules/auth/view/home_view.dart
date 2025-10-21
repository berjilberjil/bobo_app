import 'package:BookIn/widgets/dinning.dart';
import 'package:BookIn/widgets/events.dart';
import 'package:BookIn/widgets/for_you.dart';
import 'package:BookIn/widgets/movies.dart';
import 'package:BookIn/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _NewPageState();
}

class _NewPageState extends State<HomeView> {
  int selectedIndex = 0;

  final List<String> tabs = ['FOR YOU', 'DINING', 'EVENTS', 'MOVIES'];
  final List<Widget> content = [ForYou(), Dinning(), Events(), Movies()];
  final List<IconData> icons = [
    Icons.trending_up_rounded,
    Icons.restaurant,
    Icons.event,
    Icons.movie,
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E).withOpacity(0.9),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            SizedBox(height: screenWidth * 0.03),

            SizedBox(
              height: 48,
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final isSelected = index == selectedIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                icons[index],
                                color:
                                    isSelected
                                        ? Color(0xFF675BA6)
                                        : Colors.grey,
                              ),
                              Text(
                                tabs[index],

                                style: TextStyle(
                                  color:
                                      isSelected
                                          ? Color(0xFF675BA6)
                                          : Colors.grey,
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          if (isSelected)
                            Container(
                              height: 3,
                              width: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xFF371ba6),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),

            // 👇 Dynamic Content (based on tab)
            Expanded(child: content[selectedIndex]),
          ],
        ),
      ),
    );
  }
}
