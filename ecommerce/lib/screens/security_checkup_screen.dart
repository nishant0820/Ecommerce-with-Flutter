import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class SecurityCheckupScreen extends StatefulWidget {
	const SecurityCheckupScreen({super.key});

	@override
	State<SecurityCheckupScreen> createState() => _SecurityCheckupScreenState();
}

class _SecurityCheckupScreenState extends State<SecurityCheckupScreen> {
	bool _passwordUpdatedRecently = true;
	bool _twoStepEnabled = true;
	bool _recoveryEmailAdded = false;
	bool _recoveryPhoneAdded = false;
	bool _unknownDevicesReviewed = true;

	int get _completedChecks {
		final checks = [
			_passwordUpdatedRecently,
			_twoStepEnabled,
			_recoveryEmailAdded,
			_recoveryPhoneAdded,
			_unknownDevicesReviewed,
		];
		return checks.where((check) => check).length;
	}

	Widget _buildCheckTile({
		required String title,
		required String subtitle,
		required bool value,
		required ValueChanged<bool> onChanged,
		required Color titleColor,
		required Color subtitleColor,
	}) {
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
			child: Row(
				children: [
					Container(
						height: 24,
						width: 24,
						decoration: BoxDecoration(
							shape: BoxShape.circle,
							color: value ? AppTheme.success.withOpacity(0.15) : AppTheme.warning.withOpacity(0.15),
						),
						child: Icon(
							value ? Icons.check : Icons.priority_high,
							size: 16,
							color: value ? AppTheme.success : AppTheme.warning,
						),
					),
					const SizedBox(width: 12),
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text(
									title,
									style: TextStyle(
										color: titleColor,
										fontSize: 15,
										fontWeight: FontWeight.w600,
									),
								),
								Text(
									subtitle,
									style: TextStyle(
										color: subtitleColor,
										fontSize: 12,
									),
								),
							],
						),
					),
					Switch(
						value: value,
						onChanged: onChanged,
						activeColor: AppTheme.primaryColor,
					),
				],
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		final isDark = Theme.of(context).brightness == Brightness.dark;
		final cardColor = isDark ? const Color(0xFF1E293B) : Colors.white;
		final titleColor = isDark ? Colors.white : AppTheme.textPrimary;
		final subtitleColor = isDark ? Colors.white70 : AppTheme.textSecondary;
		final progress = _completedChecks / 5;

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
								titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
								title: const Text(
									'Security Checkup',
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
							padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
							child: Column(
								children: [
									Container(
										width: double.infinity,
										padding: const EdgeInsets.all(16),
										decoration: BoxDecoration(
											color: cardColor,
											borderRadius: BorderRadius.circular(16),
										),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												Text(
													'Security Score',
													style: TextStyle(
														color: titleColor,
														fontSize: 16,
														fontWeight: FontWeight.w600,
													),
												),
												const SizedBox(height: 8),
												Text(
													'$_completedChecks of 5 checks completed',
													style: TextStyle(
														color: subtitleColor,
														fontSize: 13,
													),
												),
												const SizedBox(height: 12),
												ClipRRect(
													borderRadius: BorderRadius.circular(10),
													child: LinearProgressIndicator(
														value: progress,
														minHeight: 10,
														backgroundColor: isDark ? Colors.white12 : Colors.black12,
														valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
													),
												),
											],
										),
									),
									const SizedBox(height: 16),
									Container(
										decoration: BoxDecoration(
											color: cardColor,
											borderRadius: BorderRadius.circular(16),
										),
										child: Column(
											children: [
												_buildCheckTile(
													title: 'Password Updated Recently',
													subtitle: 'Your password was changed in last 90 days',
													value: _passwordUpdatedRecently,
													onChanged: (value) => setState(() => _passwordUpdatedRecently = value),
													titleColor: titleColor,
													subtitleColor: subtitleColor,
												),
												_buildCheckTile(
													title: 'Two-Step Verification Enabled',
													subtitle: 'Additional verification is active',
													value: _twoStepEnabled,
													onChanged: (value) => setState(() => _twoStepEnabled = value),
													titleColor: titleColor,
													subtitleColor: subtitleColor,
												),
												_buildCheckTile(
													title: 'Recovery Email Added',
													subtitle: 'Backup email is available for recovery',
													value: _recoveryEmailAdded,
													onChanged: (value) => setState(() => _recoveryEmailAdded = value),
													titleColor: titleColor,
													subtitleColor: subtitleColor,
												),
												_buildCheckTile(
													title: 'Recovery Phone Added',
													subtitle: 'Phone number is available for recovery',
													value: _recoveryPhoneAdded,
													onChanged: (value) => setState(() => _recoveryPhoneAdded = value),
													titleColor: titleColor,
													subtitleColor: subtitleColor,
												),
												_buildCheckTile(
													title: 'Unknown Devices Reviewed',
													subtitle: 'No suspicious sessions remain active',
													value: _unknownDevicesReviewed,
													onChanged: (value) => setState(() => _unknownDevicesReviewed = value),
													titleColor: titleColor,
													subtitleColor: subtitleColor,
												),
											],
										),
									),
								],
							),
						),
					),
				],
			),
		);
	}
}
