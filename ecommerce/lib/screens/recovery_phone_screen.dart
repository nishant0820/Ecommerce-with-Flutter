import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class RecoveryPhoneScreen extends StatefulWidget {
	const RecoveryPhoneScreen({super.key});

	@override
	State<RecoveryPhoneScreen> createState() => _RecoveryPhoneScreenState();
}

class _RecoveryPhoneScreenState extends State<RecoveryPhoneScreen> {
	final _formKey = GlobalKey<FormState>();
	final _phoneController = TextEditingController();

	String _selectedCountryCode = '+91';

	@override
	void dispose() {
		_phoneController.dispose();
		super.dispose();
	}

	void _saveRecoveryPhone() {
		if (!_formKey.currentState!.validate()) {
			return;
		}

		ScaffoldMessenger.of(context).showSnackBar(
			const SnackBar(content: Text('Recovery phone updated successfully')),
		);
		Navigator.pop(context);
	}

	@override
	Widget build(BuildContext context) {
		final isDark = Theme.of(context).brightness == Brightness.dark;
		final cardColor = isDark ? const Color(0xFF1E293B) : Colors.white;
		final titleColor = isDark ? Colors.white : AppTheme.textPrimary;
		final subtitleColor = isDark ? Colors.white70 : AppTheme.textSecondary;

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
									'Recovery Phone',
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
							child: Container(
								padding: const EdgeInsets.all(16),
								decoration: BoxDecoration(
									color: cardColor,
									borderRadius: BorderRadius.circular(16),
								),
								child: Form(
									key: _formKey,
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											Text(
												'Add a phone number for account recovery',
												style: TextStyle(
													color: titleColor,
													fontSize: 16,
													fontWeight: FontWeight.w600,
												),
											),
											const SizedBox(height: 6),
											Text(
												'We will use this number if you lose account access.',
												style: TextStyle(color: subtitleColor, fontSize: 12),
											),
											const SizedBox(height: 16),
											Row(
												children: [
													Container(
														padding: const EdgeInsets.symmetric(horizontal: 10),
														decoration: BoxDecoration(
															border: Border.all(
																color: isDark ? Colors.white24 : Colors.black26,
															),
															borderRadius: BorderRadius.circular(12),
														),
														child: DropdownButtonHideUnderline(
															child: DropdownButton<String>(
																value: _selectedCountryCode,
																items: const [
																	DropdownMenuItem(value: '+91', child: Text('+91')),
																	DropdownMenuItem(value: '+1', child: Text('+1')),
																	DropdownMenuItem(value: '+44', child: Text('+44')),
																	DropdownMenuItem(value: '+61', child: Text('+61')),
																],
																onChanged: (value) {
																	if (value == null) {
																		return;
																	}
																	setState(() {
																		_selectedCountryCode = value;
																	});
																},
															),
														),
													),
													const SizedBox(width: 12),
													Expanded(
														child: TextFormField(
															controller: _phoneController,
															keyboardType: TextInputType.phone,
															decoration: InputDecoration(
																labelText: 'Phone Number',
																border: OutlineInputBorder(
																	borderRadius: BorderRadius.circular(12),
																),
															),
															validator: (value) {
																final raw = value?.trim() ?? '';
																if (raw.isEmpty) {
																	return 'Enter phone number';
																}
																if (!RegExp(r'^\d{8,15}$').hasMatch(raw)) {
																	return 'Enter a valid phone number';
																}
																return null;
															},
														),
													),
												],
											),
											const SizedBox(height: 20),
											SizedBox(
												width: double.infinity,
												child: ElevatedButton(
													onPressed: _saveRecoveryPhone,
													style: ElevatedButton.styleFrom(
														backgroundColor: AppTheme.primaryColor,
														foregroundColor: Colors.white,
														padding: const EdgeInsets.symmetric(vertical: 14),
														shape: RoundedRectangleBorder(
															borderRadius: BorderRadius.circular(12),
														),
													),
													child: const Text(
														'Save Recovery Phone',
														style: TextStyle(fontWeight: FontWeight.w600),
													),
												),
											),
										],
									),
								),
							),
						),
					),
				],
			),
		);
	}
}
