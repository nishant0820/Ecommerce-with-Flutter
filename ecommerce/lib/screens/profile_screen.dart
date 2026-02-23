import 'package:ecommerce/screens/help_support_screen.dart';
import 'package:ecommerce/screens/my_orders_screen.dart';
import 'package:ecommerce/screens/notifications_screen.dart';
import 'package:ecommerce/screens/settings_screen.dart';
import 'package:ecommerce/screens/user_details_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required Color backgroundColor,
    required Color subtitleColor,
    required Color shadowColor,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: subtitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> items,
    required Color titleColor,
    required Color backgroundColor,
    required Color shadowColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
    required Color titleColor,
    required Color subtitleColor,
    required Color trailingColor,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: isDestructive
                    ? AppTheme.error.withOpacity(0.1)
                    : color.withOpacity(0.1),
              ),
              child: Icon(
                icon,
                color: isDestructive ? AppTheme.error : color,
                size: 24,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDestructive ? AppTheme.error : titleColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: trailingColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final cardBackgroundColor = isDark ? Color(0xFF1E293B) : Colors.white;
    final titleColor = isDark ? Colors.white : AppTheme.textPrimary;
    final subtitleColor = isDark ? Colors.white70 : AppTheme.textSecondary;
    final shadowColor =
        isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.08);

    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppTheme.primaryGradient,
                  end: Alignment.bottomRight,
                  begin: Alignment.topLeft,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset('assets/images/user.png'),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: titleColor,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "johndoe@gmail.com",
                            style: TextStyle(
                              fontSize: 14,
                              color: subtitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildActionCard(
                            icon: Icons.shopping_bag_outlined,
                            title: 'Orders',
                            value: '12',
                            color: AppTheme.primaryColor,
                            backgroundColor: cardBackgroundColor,
                            subtitleColor: subtitleColor,
                            shadowColor: shadowColor,
                          ),
                          SizedBox(width: 12),
                          _buildActionCard(
                            icon: Icons.favorite_border_outlined,
                            title: 'Wishlist',
                            value: '4',
                            color: AppTheme.secondaryColor,
                            backgroundColor: cardBackgroundColor,
                            subtitleColor: subtitleColor,
                            shadowColor: shadowColor,
                          ),
                          SizedBox(width: 12),
                          _buildActionCard(
                            icon: Icons.local_shipping_outlined,
                            title: 'Shipping',
                            value: '2',
                            color: AppTheme.tertiaryColor,
                            backgroundColor: cardBackgroundColor,
                            subtitleColor: subtitleColor,
                            shadowColor: shadowColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          _buildSection(
                            title: 'Account Settings',
                            titleColor: titleColor,
                            backgroundColor: cardBackgroundColor,
                            shadowColor: shadowColor,
                            items: [
                              _buildMenuItem(
                                icon: Icons.person_outline,
                                title: 'Personal Details',
                                subtitle: 'Update your personal information',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserDetailsScreen(),
                                    ),
                                  );
                                },
                                color: AppTheme.primaryColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                              ),
                              _buildMenuItem(
                                icon: Icons.lock_outline,
                                title: 'Change Password',
                                subtitle: 'Update your password',
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ChagePasswordScreen(),
                                  //   ),
                                  // );
                                },
                                color: AppTheme.primaryColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                              ),
                              _buildMenuItem(
                                icon: Icons.notifications,
                                title: 'Notifications',
                                subtitle: 'Manage your notifications',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NotificationsScreen(),
                                    ),
                                  );
                                },
                                color: AppTheme.primaryColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          _buildSection(
                            title: 'Shopping Preferences',
                            titleColor: titleColor,
                            backgroundColor: cardBackgroundColor,
                            shadowColor: shadowColor,
                            items: [
                              _buildMenuItem(
                                icon: Icons.shopping_bag_outlined,
                                title: 'My Orders',
                                subtitle: 'View your order history',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyOrdersScreen(),
                                    ),
                                  );
                                },
                                color: AppTheme.secondaryColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                              ),
                              _buildMenuItem(
                                icon: Icons.location_on_outlined,
                                title: 'Shipping Address',
                                subtitle: 'Manage your delivery addresses',
                                onTap: () {},
                                color: AppTheme.secondaryColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                              ),
                              _buildMenuItem(
                                icon: Icons.payment_outlined,
                                title: 'Payment Methods',
                                subtitle: 'Manage your payment options',
                                onTap: () {},
                                color: AppTheme.secondaryColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          _buildSection(
                            title: 'More',
                            titleColor: titleColor,
                            backgroundColor: cardBackgroundColor,
                            shadowColor: shadowColor,
                            items: [
                              _buildMenuItem(
                                icon: Icons.settings_outlined,
                                title: 'Settings',
                                subtitle: 'App preferences and settings',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SettingsScreen(),
                                    ),
                                  );
                                },
                                color: AppTheme.tertiaryColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                              ),
                              _buildMenuItem(
                                icon: Icons.help_outline,
                                title: 'Help & Support',
                                subtitle: 'Get Help and contact us',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HelpSupportScreen(),
                                    ),
                                  );
                                },
                                color: AppTheme.tertiaryColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                              ),
                              _buildMenuItem(
                                icon: Icons.logout,
                                title: 'Logout',
                                subtitle: 'Sign out from your account',
                                onTap: () {},
                                color: AppTheme.error,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                trailingColor: subtitleColor,
                                isDestructive: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
