import 'package:ecommerce/screens/change_password_screen.dart';
import 'package:ecommerce/screens/recovery_email_screen.dart';
import 'package:ecommerce/screens/recovery_phone_screen.dart';
import 'package:ecommerce/screens/security_checkup_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
	const SecurityScreen({super.key});

	@override
	State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
	bool _twoStepVerification = true;
	bool _biometricUnlock = false;
	bool _loginAlerts = true;
	bool _trustedDevicesOnly = false;
	bool _autoLogoutOnInactivity = true;
	bool _newLocationVerification = true;

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
					padding: const EdgeInsets.only(left: 4, bottom: 12),
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
								offset: const Offset(0, 5),
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
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
			child: Row(
				children: [
					Container(
						padding: const EdgeInsets.all(10),
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(25),
							color: color.withOpacity(0.1),
						),
						child: Icon(icon, color: color, size: 22),
					),
					const SizedBox(width: 16),
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
				padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
				child: Row(
					children: [
						Container(
							padding: const EdgeInsets.all(10),
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(25),
								color: color.withOpacity(0.1),
							),
							child: Icon(icon, color: color, size: 24),
						),
						const SizedBox(width: 16),
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

	void _showInfo(String message) {
		ScaffoldMessenger.of(context).showSnackBar(
			SnackBar(content: Text(message)),
		);
	}

	@override
	Widget build(BuildContext context) {
		final isDark = Theme.of(context).brightness == Brightness.dark;
		final sectionBackgroundColor = isDark ? const Color(0xFF1E293B) : Colors.white;
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
										const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
								title: const Text(
									'Security',
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
							padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
							child: Column(
								children: [
									_buildSection(
										title: 'Sign In Protection',
										titleColor: titleColor,
										sectionBackgroundColor: sectionBackgroundColor,
										shadowColor: shadowColor,
										items: [
											_buildSwitchItem(
												icon: Icons.verified_user_outlined,
												title: 'Two-Step Verification',
												subtitle: 'Require OTP when logging in',
												value: _twoStepVerification,
												onChanged: (value) {
													setState(() {
														_twoStepVerification = value;
													});
												},
												color: AppTheme.primaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.fingerprint,
												title: 'Biometric Unlock',
												subtitle: 'Use fingerprint or face unlock',
												value: _biometricUnlock,
												onChanged: (value) {
													setState(() {
														_biometricUnlock = value;
													});
												},
												color: AppTheme.secondaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.notifications_active_outlined,
												title: 'Login Alerts',
												subtitle: 'Get alert for unrecognized sign-ins',
												value: _loginAlerts,
												onChanged: (value) {
													setState(() {
														_loginAlerts = value;
													});
												},
												color: AppTheme.tertiaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.verified_outlined,
												title: 'Verify New Locations',
												subtitle: 'Require verification for new city or country login',
												value: _newLocationVerification,
												onChanged: (value) {
													setState(() {
														_newLocationVerification = value;
													});
												},
												color: AppTheme.warning,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.devices_other_outlined,
												title: 'Trusted Devices Only',
												subtitle: 'Allow sign in only from approved devices',
												value: _trustedDevicesOnly,
												onChanged: (value) {
													setState(() {
														_trustedDevicesOnly = value;
													});
												},
												color: AppTheme.primaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.timer_off_outlined,
												title: 'Auto Logout on Inactivity',
												subtitle: 'Sign out automatically after inactivity period',
												value: _autoLogoutOnInactivity,
												onChanged: (value) {
													setState(() {
														_autoLogoutOnInactivity = value;
													});
												},
												color: AppTheme.secondaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
										],
									),
									const SizedBox(height: 24),
									_buildSection(
										title: 'Account Security',
										titleColor: titleColor,
										sectionBackgroundColor: sectionBackgroundColor,
										shadowColor: shadowColor,
										items: [
											_buildMenuItem(
												icon: Icons.lock_reset,
												title: 'Change Password',
												subtitle: 'Update your account password',
												color: AppTheme.warning,
												onTap: () {
													Navigator.push(
														context,
														MaterialPageRoute(
															builder: (context) => const ChangePasswordScreen(),
														),
													);
												},
												titleColor: titleColor,
												subtitleColor: subtitleColor,
												trailingColor: subtitleColor,
											),
											_buildMenuItem(
												icon: Icons.history_toggle_off,
												title: 'Login Activity',
												subtitle: 'Review recent account sign-in history',
												color: AppTheme.primaryColor,
												onTap: () => _showInfo('Login Activity coming soon'),
												titleColor: titleColor,
												subtitleColor: subtitleColor,
												trailingColor: subtitleColor,
											),
											_buildMenuItem(
												icon: Icons.mark_email_read_outlined,
												title: 'Recovery Email',
												subtitle: 'Set or update your account recovery email',
												color: AppTheme.secondaryColor,
												onTap: () {
													Navigator.push(
														context,
														MaterialPageRoute(
															builder: (context) => const RecoveryEmailScreen(),
														),
													);
												},
												titleColor: titleColor,
												subtitleColor: subtitleColor,
												trailingColor: subtitleColor,
											),
											_buildMenuItem(
												icon: Icons.phone_iphone_outlined,
												title: 'Recovery Phone',
												subtitle: 'Add phone number for account recovery',
												color: AppTheme.tertiaryColor,
												onTap: () {
													Navigator.push(
														context,
														MaterialPageRoute(
															builder: (context) => const RecoveryPhoneScreen(),
														),
													);
												},
												titleColor: titleColor,
												subtitleColor: subtitleColor,
												trailingColor: subtitleColor,
											),
											_buildMenuItem(
												icon: Icons.logout,
												title: 'Sign Out from All Devices',
												subtitle: 'End all active sessions except this one',
												color: AppTheme.warning,
												onTap: () => _showInfo('Sign Out from All Devices coming soon'),
												titleColor: titleColor,
												subtitleColor: subtitleColor,
												trailingColor: subtitleColor,
											),
											_buildMenuItem(
												icon: Icons.shield_outlined,
												title: 'Security Checkup',
												subtitle: 'Review your account security status',
												color: AppTheme.primaryColor,
												onTap: () {
													Navigator.push(
														context,
														MaterialPageRoute(
															builder: (context) => const SecurityCheckupScreen(),
														),
													);
												},
												titleColor: titleColor,
												subtitleColor: subtitleColor,
												trailingColor: subtitleColor,
											),
										],
									),
									const SizedBox(height: 100),
								],
							),
						),
					),
				],
			),
		);
	}
}
