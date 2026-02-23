import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatefulWidget {
	const PrivacySettingsScreen({super.key});

	@override
	State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
	bool _locationAccess = true;
	bool _personalizedAds = false;
	bool _analyticsSharing = true;
	bool _searchHistory = true;
	bool _cameraAccess = false;
	bool _voiceDataSharing = false;

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
									'Privacy Settings',
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
										title: 'Privacy Controls',
										titleColor: titleColor,
										sectionBackgroundColor: sectionBackgroundColor,
										shadowColor: shadowColor,
										items: [
											_buildSwitchItem(
												icon: Icons.location_on_outlined,
												title: 'Location',
												subtitle: 'Allow location access for nearby services',
												value: _locationAccess,
												onChanged: (value) {
													setState(() {
														_locationAccess = value;
													});
												},
												color: AppTheme.secondaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.ads_click_outlined,
												title: 'Personalized Ads',
												subtitle: 'Use activity data for relevant ads',
												value: _personalizedAds,
												onChanged: (value) {
													setState(() {
														_personalizedAds = value;
													});
												},
												color: AppTheme.warning,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.analytics_outlined,
												title: 'Analytics Sharing',
												subtitle: 'Share anonymous usage analytics',
												value: _analyticsSharing,
												onChanged: (value) {
													setState(() {
														_analyticsSharing = value;
													});
												},
												color: AppTheme.tertiaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.history_outlined,
												title: 'Search History',
												subtitle: 'Save search history for quick suggestions',
												value: _searchHistory,
												onChanged: (value) {
													setState(() {
														_searchHistory = value;
													});
												},
												color: AppTheme.primaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.camera_alt_outlined,
												title: 'Camera Access',
												subtitle: 'Allow camera usage for uploads and scans',
												value: _cameraAccess,
												onChanged: (value) {
													setState(() {
														_cameraAccess = value;
													});
												},
												color: AppTheme.secondaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
											_buildSwitchItem(
												icon: Icons.keyboard_voice_outlined,
												title: 'Voice Data Sharing',
												subtitle: 'Allow voice input data to improve results',
												value: _voiceDataSharing,
												onChanged: (value) {
													setState(() {
														_voiceDataSharing = value;
													});
												},
												color: AppTheme.tertiaryColor,
												titleColor: titleColor,
												subtitleColor: subtitleColor,
											),
										],
									),
									const SizedBox(height: 24),
									_buildSection(
										title: 'Data Management',
										titleColor: titleColor,
										sectionBackgroundColor: sectionBackgroundColor,
										shadowColor: shadowColor,
										items: [
											_buildMenuItem(
												icon: Icons.download_outlined,
												title: 'Download My Data',
												subtitle: 'Request a copy of your account data',
												color: AppTheme.primaryColor,
												onTap: () => _showInfo('Download My Data coming soon'),
												titleColor: titleColor,
												subtitleColor: subtitleColor,
												trailingColor: subtitleColor,
											),
											_buildMenuItem(
												icon: Icons.delete_outline,
												title: 'Delete Account Data',
												subtitle: 'Remove your data from this app',
												color: AppTheme.error,
												onTap: () => _showInfo('Delete Account Data coming soon'),
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
