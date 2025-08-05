import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; 
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.01,
                    horizontal: 16.0,
                  ), // 👈 Increase height
                  focusColor: Colors.white.withOpacity(0.6),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  prefixIcon: Opacity(
                    opacity: 0.2,
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                  hintText: 'Search for something',
                  hintStyle: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ), // 👈 Fixed white text color
              ),
            );
  }
}