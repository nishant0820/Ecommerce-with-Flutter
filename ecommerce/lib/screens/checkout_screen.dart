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
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 36,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? AppTheme.primaryColor : Colors.white,
              border: Border.all(
                color:
                    isActive ? AppTheme.primaryColor : AppTheme.textSecondary,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: isActive ? Colors.white : AppTheme.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isActive ? AppTheme.primaryColor : AppTheme.textSecondary,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepConnector(bool isActive) {
    return Container(
      width: 40,
      height: 2,
      color: isActive
          ? AppTheme.primaryColor
          : AppTheme.textSecondary.withOpacity(0.2),
    );
  }

  Widget _buildAddressCard(int index) {
    final isSelected = _selectedAddressIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedAddressIndex = index),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                          color: AppTheme.textPrimary,
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
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '123 Main Street, Apt 4B\n New Delhi, DL 110053\nIndia',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
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

  Widget _buildDeliveryMethodCard(int index, Map<String, dynamic> method) {
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  Text(
                    method['duration'] as String,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
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

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
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
              color: isTotal ? AppTheme.textPrimary : AppTheme.textSecondary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppTheme.textPrimary : AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
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
                              color: AppTheme.textPrimary,
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
                      ...List.generate(2, (index) => _buildAddressCard(index)),
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
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      SizedBox(height: 16),
                      ...List.generate(
                          2,
                          (index) => _buildDeliveryMethodCard(
                                index,
                                deliveryMethods[index],
                              )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
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
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildSummaryRow("Subtotal", "Rs. 1797.00"),
                      _buildSummaryRow("Shipping", "Rs. 100.00"),
                      _buildSummaryRow("Tax", "Rs. 89.00"),
                      Divider(height: 24),
                      _buildSummaryRow(
                        "Total",
                        "Rs. 1986.00",
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                  builder: (context) => CheckoutScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
