import 'package:ecommerce/screens/order_confirmation_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:ecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedPaymentMethod = 0;
  int _selectedCard = 0;

  final paymentMethods = [
    {
      'title': 'Credit/Debit Card',
      'icon': Icons.credit_card,
    },
    {
      'title': 'PayPal',
      'icon': Icons.paypal,
    },
    {
      'title': 'Paytm',
      'icon': Icons.account_balance_wallet,
    },
    {
      'title': 'Google Pay',
      'icon': Icons.g_mobiledata,
    },
  ];
  Widget _buildStep(int number, String title, bool isActive) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final inactiveColor = isDark ? Colors.white70 : AppTheme.textSecondary;
    final inactiveBg = isDark ? Color(0xFF1E293B) : Colors.white;

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 36,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? AppTheme.primaryColor : inactiveBg,
              border: Border.all(
                color: isActive ? AppTheme.primaryColor : inactiveColor,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: isActive ? Colors.white : inactiveColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isActive ? AppTheme.primaryColor : inactiveColor,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepConnector(bool isActive) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final inactiveColor =
        isDark ? Colors.white24 : AppTheme.textSecondary.withOpacity(0.2);
    return Container(
      width: 40,
      height: 2,
      color: isActive ? AppTheme.primaryColor : inactiveColor,
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    required Color titleColor,
    required Color subtitleColor,
    bool isTotal = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? titleColor : subtitleColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? titleColor : subtitleColor,
            ),
          ),
        ],
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
        isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.05);
    final dividerColor =
        isDark ? Colors.white24 : Colors.black.withOpacity(0.1);
    final bottomSheetColor = isDark ? Color(0xFF0F172A) : Colors.white;

    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.white,
            pinned: true,
            expandedHeight: 120,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: FlexibleSpaceBar(
                title: Text(
                  "Payment",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      _buildStep(1, 'Shipping', true),
                      _buildStepConnector(true),
                      _buildStep(2, 'Payment', true),
                      _buildStepConnector(true),
                      _buildStep(3, 'Confirm', false),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Method",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      ...List.generate(
                          paymentMethods.length,
                          (index) => _buildPaymentMethodCard(
                                index,
                                paymentMethods[index],
                                cardBackgroundColor: cardBackgroundColor,
                                titleColor: titleColor,
                                shadowColor: shadowColor,
                              )),
                    ],
                  ),
                ),
                _buildSavedCards(
                  titleColor: titleColor,
                  subtitleColor: subtitleColor,
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardBackgroundColor,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildSummaryRow(
                        "Subtotal",
                        "Rs. 1797.00",
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                      ),
                      _buildSummaryRow(
                        "Shipping",
                        "Rs. 100.00",
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                      ),
                      _buildSummaryRow(
                        "Tax",
                        "Rs. 89.00",
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                      ),
                      Divider(height: 24, color: dividerColor),
                      _buildSummaryRow(
                        "Total",
                        "Rs. 1986.00",
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bottomSheetColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: GradientButton(
            text: "Confirm Order",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderConfirmationScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard(
    int index,
    Map<String, dynamic> method, {
    required Color cardBackgroundColor,
    required Color titleColor,
    required Color shadowColor,
  }) {
    final isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _selectedPaymentMethod = index;
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Radio(
              value: index,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value as int;
                });
              },
              activeColor: AppTheme.primaryColor,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                method['icon'] as IconData,
                color: AppTheme.primaryColor,
              ),
            ),
            SizedBox(width: 16),
            Text(
              method['title'] as String,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedCards({
    required Color titleColor,
    required Color subtitleColor,
  }) {
    if (_selectedPaymentMethod != 0) return SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Saved Cards",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text("Add New"),
                icon: Icon(Icons.add),
              )
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => _buildCreditCard(index)),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCard(int index) {
    final isSelected = _selectedCard == index;
    final colors = [
      AppTheme.primaryGradient,
      [AppTheme.secondaryColor, AppTheme.tertiaryColor],
      [AppTheme.primaryColor, AppTheme.secondaryColor],
    ];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCard = index;
        });
      },
      child: Container(
        width: 300,
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors[index],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Credit Card",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.white.withOpacity(0.8),
                  size: 30,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "**** **** **** 1234",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CARD HOLDER",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "John Doe",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EXPIRY DATE",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "MM/YY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
