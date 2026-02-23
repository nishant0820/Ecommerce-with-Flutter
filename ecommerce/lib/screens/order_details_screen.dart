import 'package:ecommerce/screens/order_tracking_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:ecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  Widget _buildOrderItem({
    required String image,
    required String name,
    required String variant,
    required double price,
    required int quanity,
    required Color cardBackgroundColor,
    required Color titleColor,
    required Color subtitleColor,
    required Color shadowColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
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
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  variant,
                  style: TextStyle(
                    fontSize: 14,
                    color: subtitleColor,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\Rs. ${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Qty: $quanity',
                      style: TextStyle(
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(
    String label,
    String value, {
    required Color titleColor,
    required Color subtitleColor,
    bool isPrimary = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: subtitleColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: isPrimary ? AppTheme.primaryColor : titleColor,
              fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
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
            pinned: true,
            expandedHeight: 120,
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
                title: Text(
                  "Order Details",
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
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order #12345",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: titleColor,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.warning.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "In Transit",
                                style: TextStyle(
                                  color: AppTheme.warning,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Ordered on Feb 12, 2025",
                          style: TextStyle(
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Items",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildOrderItem(
                    image: 'assets/images/black t-shirt.png',
                    name: 'Premium Cotton T-Shirt',
                    variant: "Color: Black | Size: M",
                    price: 59.99,
                    quanity: 2,
                    cardBackgroundColor: cardBackgroundColor,
                    titleColor: titleColor,
                    subtitleColor: subtitleColor,
                    shadowColor: shadowColor,
                  ),
                  _buildOrderItem(
                    image: 'assets/images/cotton pant 1.png',
                    name: 'Premium Cotton Pants',
                    variant: "Color: Grey | Size: L",
                    price: 99.99,
                    quanity: 1,
                    cardBackgroundColor: cardBackgroundColor,
                    titleColor: titleColor,
                    subtitleColor: subtitleColor,
                    shadowColor: shadowColor,
                  ),
                  SizedBox(height: 24),
                  Container(
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
                        _buildDetailItem(
                          "Subtotal",
                          '\Rs. 150.99',
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                        ),
                        _buildDetailItem(
                          "Shipping",
                          '\Rs. 15.99',
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                        ),
                        _buildDetailItem(
                          "Tax",
                          '\Rs. 18.00',
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                        ),
                        Divider(height: 24, color: dividerColor),
                        _buildDetailItem(
                          "Total",
                          '\Rs. 299.99',
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                          isPrimary: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
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
                          "Shipping Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildDetailItem(
                          'Name',
                          'John Doe',
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                        ),
                        _buildDetailItem(
                          'Phone',
                          '+91 9899459288',
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                        ),
                        _buildDetailItem('Address',
                            'F-61/2A Street 1, Yamuna Vihar\nNew Delhi, Delhi-110053\nIndia',
                            titleColor: titleColor,
                            subtitleColor: subtitleColor),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
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
                          "Shipping Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildDetailItem(
                          'Name',
                          'John Doe',
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                        ),
                        _buildDetailItem(
                          'Phone',
                          '+91 9899459288',
                          titleColor: titleColor,
                          subtitleColor: subtitleColor,
                        ),
                        _buildDetailItem('Address',
                            'F-61/2A Street 1, Yamuna Vihar\nNew Delhi, Delhi-110053\nIndia',
                            titleColor: titleColor,
                            subtitleColor: subtitleColor),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
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
                          "Payment Method",
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
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
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
                  text: "Need Help?",
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MainScreen(),
                    //   ),
                    // );
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
