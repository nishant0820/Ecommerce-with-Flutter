import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class RecoveryEmailScreen extends StatefulWidget {
	const RecoveryEmailScreen({super.key});

	@override
	State<RecoveryEmailScreen> createState() => _RecoveryEmailScreenState();
}

class _RecoveryEmailScreenState extends State<RecoveryEmailScreen> {
	final _formKey = GlobalKey<FormState>();
	final _emailController = TextEditingController();

	@override
	void dispose() {
		_emailController.dispose();
		super.dispose();
	}

	void _saveRecoveryEmail() {
		if (!_formKey.currentState!.validate()) {
			return;
		}

		ScaffoldMessenger.of(context).showSnackBar(
			const SnackBar(
				backgroundColor: Colors.white,
				content: Text(
					'Recovery email updated successfully',
					style: TextStyle(color: Colors.black),
				),
			),
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
									'Recovery Email',
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
												'Add an email for account recovery',
												style: TextStyle(
													color: titleColor,
													fontSize: 16,
													fontWeight: FontWeight.w600,
												),
											),
											const SizedBox(height: 6),
											Text(
												'We will send recovery instructions to this email.',
												style: TextStyle(color: subtitleColor, fontSize: 12),
											),
											const SizedBox(height: 16),
											TextFormField(
												controller: _emailController,
												keyboardType: TextInputType.emailAddress,
												decoration: InputDecoration(
													labelText: 'Recovery Email',
													border: OutlineInputBorder(
														borderRadius: BorderRadius.circular(12),
													),
													prefixIcon: const Icon(Icons.email_outlined),
												),
												validator: (value) {
													final email = value?.trim() ?? '';
													if (email.isEmpty) {
														return 'Enter email address';
													}
													if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
														return 'Enter a valid email address';
													}
													return null;
												},
											),
											const SizedBox(height: 20),
											SizedBox(
												width: double.infinity,
												child: ElevatedButton(
													onPressed: _saveRecoveryEmail,
													style: ElevatedButton.styleFrom(
														backgroundColor: AppTheme.primaryColor,
														foregroundColor: Colors.white,
														padding: const EdgeInsets.symmetric(vertical: 14),
														shape: RoundedRectangleBorder(
															borderRadius: BorderRadius.circular(12),
														),
													),
													child: const Text(
														'Save Recovery Email',
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
