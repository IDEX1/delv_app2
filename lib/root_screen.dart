// root_screen.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'favoritespage.dart';
import 'utils/app_colors.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 2; 

 
 

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     final pages = <Widget>[
      FavouritesPage(onBack: () => _onNavItemTapped(2)),
      HomePage(),
     
    ];
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex == 2 ? 1 : 0,
        children: pages,
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: kBorderColor, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.favorite_border, 0),
            _buildNavItem(Icons.calendar_today_outlined, 1),
            _buildNavItem(Icons.home_outlined, 2),
            _buildNavItem(Icons.grid_view_outlined, 3),
            _buildNavItem(Icons.person_outline, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return IconButton(
      icon: Icon(
        // fill home icon when selected
        isSelected && icon == Icons.home_outlined ? Icons.home : icon,
        color: isSelected ? kPrimaryGreen : kPrimaryYellow,
        size: 28,
      ),
      onPressed: () => _onNavItemTapped(index),
      tooltip: 'Nav item $index',
    );
  }
}
