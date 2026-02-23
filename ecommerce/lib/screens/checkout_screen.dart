import 'package:ecommerce/screens/payment_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:ecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedAddressIndex = 0;
  int _selectedDeliveryMethod = 0;
  final deliveryMethods = [
    {
      'title': 'Standard Delivery',
      'duration': '3-5 business days',
      'price': 'Rs.5.99',
      'icon': Icons.local_shipping_outlined,
    },
    {
      'title': 'Express Delivery',
      'duration': '1-2 business days',
      'price': 'Rs.12.99',
      'icon': Icons.delivery_dining_outlined,
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

  Widget _buildAddressCard(
    int index, {
    required Color cardBackgroundColor,
    required Color titleColor,
    required Color subtitleColor,
    required Color shadowColor,
  }) {
    final isSelected = _selectedAddressIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedAddressIndex = index),
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
              groupValue: _selectedAddressIndex,
              onChanged: (value) {
                setState(() {
                  _selectedAddressIndex = value as int;
                });
              },
              activeColor: AppTheme.primaryColor,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Dear Pro",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      if (index == 0)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Default",
                            style: TextStyle(
                              fontSize: 10,
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    '+1234567890',
                    style: TextStyle(
                      color: subtitleColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'F-61/2A Street 1, Yamuna Vihar\nNew Delhi, Delhi-110053\nIndia',
                    style: TextStyle(
                      color: titleColor,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_outlined),
                  color: AppTheme.primaryColor,
                ),
                if (index != 0)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outlined),
                    color: AppTheme.error,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryMethodCard(
    int index,
    Map<String, dynamic> method, {
    required Color cardBackgroundColor,
    required Color titleColor,
    required Color subtitleColor,
    required Color shadowColor,
  }) {
    final isSelected = _selectedDeliveryMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDeliveryMethod = index;
        });
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
              groupValue: _selectedDeliveryMethod,
              onChanged: (value) {
                setState(() {
                  _selectedDeliveryMethod = value as int;
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method['title'] as String,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                  Text(
                    method['duration'] as String,
                    style: TextStyle(
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              method['price'] as String,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
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
                  "Checkout",
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
                      _buildStep(2, 'Payment', false),
                      _buildStepConnector(false),
                      _buildStep(3, 'Confirm', false),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping Address",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: titleColor,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            label: Text("Add New"),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      ...List.generate(
                        2,
                        (index) => _buildAddressCard(
                          index,
                          cardBackgroundColor: cardBackgroundColor,
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                          shadowColor: shadowColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Method",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      ...List.generate(
                          2,
                          (index) => _buildDeliveryMethodCard(
                                index,
                                deliveryMethods[index],
                                cardBackgroundColor: cardBackgroundColor,
                                titleColor: titleColor,
                                subtitleColor: subtitleColor,
                                shadowColor: shadowColor,
                              )),
                    ],
                  ),
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
            text: "Continue to Payment",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
