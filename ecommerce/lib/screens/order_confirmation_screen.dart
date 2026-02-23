import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/order_tracking_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:ecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
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

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
    required Color labelColor,
    required Color defaultValueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: labelColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: valueColor ?? defaultValueColor,
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
                  "Order Confirmation",
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
                      _buildStep(3, 'Confirm', true),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppTheme.success.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle,
                          size: 80,
                          color: AppTheme.success,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Order Placed Successfully",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Your order has been confirmed and will be delivered soon.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: subtitleColor,
                        ),
                      ),
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
                        "Order Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildDetailRow(
                        'Order No',
                        "#ORDER123456",
                        labelColor: subtitleColor,
                        defaultValueColor: titleColor,
                      ),
                      _buildDetailRow(
                        'Order Date',
                        "Feb 9, 2025",
                        labelColor: subtitleColor,
                        defaultValueColor: titleColor,
                      ),
                      _buildDetailRow(
                        'Total Amount',
                        "Rs. 1002.95",
                        labelColor: subtitleColor,
                        defaultValueColor: titleColor,
                      ),
                      _buildDetailRow('Status', "Processing",
                          valueColor: AppTheme.warning,
                          isBold: true,
                          labelColor: subtitleColor,
                          defaultValueColor: titleColor),
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
                        "Delivery Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery Address",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: subtitleColor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "F-61/2A Street 1, Yamuna Vihar\nNew Delhi, Delhi-110053\nIndia",
                                  style: TextStyle(
                                    color: titleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(color: dividerColor),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.local_shipping_outlined,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery Method",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: subtitleColor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Express Delivery (1-2) Business Days",
                                  style: TextStyle(
                                    color: titleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                        "Payment Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.credit_card,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Method",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: subtitleColor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Credit Card **** **** **** 1234",
                                  style: TextStyle(
                                    color: titleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(color: dividerColor),
                      SizedBox(height: 16),
                      _buildDetailRow(
                        'Subtotal',
                        "Rs. 899.97",
                        labelColor: subtitleColor,
                        defaultValueColor: titleColor,
                      ),
                      _buildDetailRow(
                        'Shipping',
                        "Rs. 12.99",
                        labelColor: subtitleColor,
                        defaultValueColor: titleColor,
                      ),
                      _buildDetailRow(
                        'Tax',
                        "Rs. 89.99",
                        labelColor: subtitleColor,
                        defaultValueColor: titleColor,
                      ),
                      Divider(
                        height: 24,
                        color: dividerColor,
                      ),
                      _buildDetailRow(
                        'Total',
                        "Rs. 1002.95",
                        isBold: true,
                        valueColor: AppTheme.primaryColor,
                        labelColor: subtitleColor,
                        defaultValueColor: titleColor,
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
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderTrackingScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: AppTheme.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Track Order")),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GradientButton(
                  text: "Continue Shopping",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
