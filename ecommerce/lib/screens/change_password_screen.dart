import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
	const ChangePasswordScreen({super.key});

	@override
	State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
	final _formKey = GlobalKey<FormState>();
	final _currentPasswordController = TextEditingController();
	final _newPasswordController = TextEditingController();
	final _confirmPasswordController = TextEditingController();

	bool _hideCurrentPassword = true;
	bool _hideNewPassword = true;
	bool _hideConfirmPassword = true;

	@override
	void dispose() {
		_currentPasswordController.dispose();
		_newPasswordController.dispose();
		_confirmPasswordController.dispose();
		super.dispose();
	}

	Widget _buildPasswordField({
		required TextEditingController controller,
		required String label,
		required bool obscureText,
		required VoidCallback onToggle,
		required String? Function(String?) validator,
	}) {
		return TextFormField(
			controller: controller,
			obscureText: obscureText,
			validator: validator,
			decoration: InputDecoration(
				labelText: label,
				border: OutlineInputBorder(
					borderRadius: BorderRadius.circular(12),
				),
				suffixIcon: IconButton(
					onPressed: onToggle,
					icon: Icon(
						obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
					),
				),
			),
		);
	}

	void _submit() {
		if (!_formKey.currentState!.validate()) {
			return;
		}

		ScaffoldMessenger.of(context).showSnackBar(
			const SnackBar(content: Text('Password updated successfully')),
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
									'Change Password',
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
												'Update your account password',
												style: TextStyle(
													color: titleColor,
													fontSize: 16,
													fontWeight: FontWeight.w600,
												),
											),
											const SizedBox(height: 6),
											Text(
												'Use at least 8 characters with letters and numbers.',
												style: TextStyle(color: subtitleColor, fontSize: 12),
											),
											const SizedBox(height: 16),
											_buildPasswordField(
												controller: _currentPasswordController,
												label: 'Current Password',
												obscureText: _hideCurrentPassword,
												onToggle: () {
													setState(() {
														_hideCurrentPassword = !_hideCurrentPassword;
													});
												},
												validator: (value) {
													if (value == null || value.isEmpty) {
														return 'Enter current password';
													}
													return null;
												},
											),
											const SizedBox(height: 14),
											_buildPasswordField(
												controller: _newPasswordController,
												label: 'New Password',
												obscureText: _hideNewPassword,
												onToggle: () {
													setState(() {
														_hideNewPassword = !_hideNewPassword;
													});
												},
												validator: (value) {
													if (value == null || value.isEmpty) {
														return 'Enter new password';
													}
													if (value.length < 8) {
														return 'Password must be at least 8 characters';
													}
													return null;
												},
											),
											const SizedBox(height: 14),
											_buildPasswordField(
												controller: _confirmPasswordController,
												label: 'Confirm New Password',
												obscureText: _hideConfirmPassword,
												onToggle: () {
													setState(() {
														_hideConfirmPassword = !_hideConfirmPassword;
													});
												},
												validator: (value) {
													if (value == null || value.isEmpty) {
														return 'Confirm your new password';
													}
													if (value != _newPasswordController.text) {
														return 'Passwords do not match';
													}
													return null;
												},
											),
											const SizedBox(height: 20),
											SizedBox(
												width: double.infinity,
												child: ElevatedButton(
													onPressed: _submit,
													style: ElevatedButton.styleFrom(
														backgroundColor: AppTheme.primaryColor,
														foregroundColor: Colors.white,
														padding: const EdgeInsets.symmetric(vertical: 14),
														shape: RoundedRectangleBorder(
															borderRadius: BorderRadius.circular(12),
														),
													),
													child: const Text(
														'Update Password',
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
