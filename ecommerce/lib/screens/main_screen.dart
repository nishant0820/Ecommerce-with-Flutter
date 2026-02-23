import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:ecommerce/screens/wishlist_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const int _homeIndex = 0;
  static const int _wishlistIndex = 1;
  static const int _cartIndex = 2;
  static const int _profileIndex = 3;

  int _currentIndex = 0;

  Widget _screenForIndex(int index) {
    switch (index) {
      case _homeIndex:
        return HomeScreen();
      case _wishlistIndex:
        return WishlistScreen();
      case _cartIndex:
        return CartScreen();
      case _profileIndex:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final navBackgroundColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final shadowColor =
        isDark ? Colors.black.withOpacity(0.35) : Colors.black.withOpacity(0.1);

    return Scaffold(
      body: _screenForIndex(_currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: navBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: navBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                      _homeIndex, Icons.home_outlined, Icons.home, "Home"),
                  _buildNavItem(
                    _wishlistIndex,
                    Icons.bookmarks_outlined,
                    Icons.bookmarks,
                    "Wishlist",
                  ),
                  _buildCartNavItem(),
                  _buildNavItem(
                      _profileIndex, Icons.person_outline, Icons.person, "Profile"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      int index, IconData outlinedIcon, IconData filledIcon, String label) {
    bool isSelected = _currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final unselectedColor = isDark ? Colors.white70 : AppTheme.textSecondary;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: AppTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected ? Colors.white : unselectedColor,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : unselectedColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartNavItem() {
    bool isSelected = _currentIndex == _cartIndex;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final unselectedColor = isDark ? Colors.white70 : AppTheme.textSecondary;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = _cartIndex),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: AppTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  color: isSelected ? Colors.white : unselectedColor,
                ),
                SizedBox(height: 4),
                Text(
                  "Cart",
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : unselectedColor,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
            Positioned(
              top: -8,
              right: -8,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: AppTheme.error, shape: BoxShape.circle),
                child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
