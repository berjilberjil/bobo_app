import 'package:bobo/modules/auth/view/login_view.dart';
import 'package:bobo/widgets/dinning.dart';
import 'package:bobo/widgets/events.dart';
import 'package:bobo/widgets/for_you.dart';
import 'package:bobo/widgets/movies.dart';
import 'package:bobo/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: const Color(0xFF131315).withOpacity(0.9),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomSearchBar(),

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
                                color: isSelected ? Colors.white : Colors.grey,
                              ),
                              Text(
                                tabs[index],

                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.grey,
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
                                color: Colors.white,
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

            // 👇 Dynamic Content (based on tab)
            Expanded(child: content[selectedIndex]),
          ],
        ),
      ),
    );
  }
}
