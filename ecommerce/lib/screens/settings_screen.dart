import 'package:ecommerce/screens/choose_language_screen.dart';
import 'package:ecommerce/screens/privacy_settings_screen.dart';
import 'package:ecommerce/screens/security_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _orderUpdates = true;
  String _selectedLanguage = 'English';

  Widget _buildSection({
    required String title,
    required List<Widget> items,
    required Color titleColor,
    required Color sectionBackgroundColor,
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
            color: sectionBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required Color color,
    required Color titleColor,
    required Color subtitleColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color.withOpacity(0.1),
            ),
            child: Icon(icon, color: color, size: 22),
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
                    color: titleColor,
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
          Switch(
            value: value,
            activeColor: AppTheme.primaryColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required Color titleColor,
    required Color subtitleColor,
    required Color trailingColor,
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
                color: color.withOpacity(0.1),
              ),
              child: Icon(icon, color: color, size: 24),
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
                      color: titleColor,
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
    final sectionBackgroundColor = isDark ? Color(0xFF1E293B) : Colors.white;
    final titleColor = isDark ? Colors.white : AppTheme.textPrimary;
    final subtitleColor = isDark ? Colors.white70 : AppTheme.textSecondary;
    final shadowColor =
        isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.05);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                background: Stack(
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
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                children: [
                  _buildSection(
                    title: '',
                    titleColor: titleColor,
                    sectionBackgroundColor: sectionBackgroundColor,
                    shadowColor: shadowColor,
                    items: [
                      _buildSwitchItem(
                        icon: Icons.notifications_active_outlined,
                        title: 'Push Notifications',
                        subtitle: 'Receive notifications on your device',
                        value: _pushNotifications,
                        onChanged: (value) {
                          setState(() {
                            _pushNotifications = value;
                          });
                        },
                        color: AppTheme.primaryColor,
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                      ),
                      _buildSwitchItem(
                        icon: Icons.email_outlined,
                        title: 'Email Notifications',
                        subtitle: 'Receive updates by email',
                        value: _emailNotifications,
                        onChanged: (value) {
                          setState(() {
                            _emailNotifications = value;
                          });
                        },
                        color: AppTheme.secondaryColor,
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                      ),
                      _buildSwitchItem(
                        icon: Icons.local_shipping_outlined,
                        title: 'Order Updates',
                        subtitle: 'Track every order status change',
                        value: _orderUpdates,
                        onChanged: (value) {
                          setState(() {
                            _orderUpdates = value;
                          });
                        },
                        color: AppTheme.tertiaryColor,
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                      ),
                      _buildSwitchItem(
                        icon: Icons.dark_mode_outlined,
                        title: 'Theme',
                        subtitle: 'Enable dark mode',
                        value: AppTheme.isDarkMode.value,
                        onChanged: (value) {
                          AppTheme.isDarkMode.value = value;
                          setState(() {});
                        },
                        color: AppTheme.warning,
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _buildSection(
                    title: 'App Preferences',
                    titleColor: titleColor,
                    sectionBackgroundColor: sectionBackgroundColor,
                    shadowColor: shadowColor,
                    items: [
                      _buildMenuItem(
                        icon: Icons.language,
                        title: 'Language',
                        subtitle: _selectedLanguage,
                        color: AppTheme.primaryColor,
                        onTap: () async {
                          final selectedLanguage = await Navigator.push<String>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseLanguageScreen(
                                initialLanguage: _selectedLanguage,
                              ),
                            ),
                          );

                          if (!mounted || selectedLanguage == null) {
                            return;
                          }

                          setState(() {
                            _selectedLanguage = selectedLanguage;
                          });
                        },
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                        trailingColor: subtitleColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _buildSection(
                    title: 'Privacy & Security',
                    titleColor: titleColor,
                    sectionBackgroundColor: sectionBackgroundColor,
                    shadowColor: shadowColor,
                    items: [
                      _buildMenuItem(
                        icon: Icons.lock_outline,
                        title: 'Privacy Settings',
                        subtitle: 'Manage your data and permissions',
                        color: AppTheme.tertiaryColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrivacySettingsScreen(),
                            ),
                          );
                        },
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                        trailingColor: subtitleColor,
                      ),
                      _buildMenuItem(
                        icon: Icons.security,
                        title: 'Security',
                        subtitle: 'Password and account protection',
                        color: AppTheme.warning,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SecurityScreen(),
                            ),
                          );
                        },
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                        trailingColor: subtitleColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
