import 'package:ecommerce/screens/checkout_screen.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:ecommerce/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  Widget _buildCartItem(
    int index, {
    required Color cardBackgroundColor,
    required Color titleColor,
    required Color subtitleColor,
    required Color shadowColor,
    required Color qtyBackgroundColor,
    required Color qtyBorderColor,
    required Color qtyTextColor,
  }) {
    final images = [
      'assets/images/black t-shirt.png',
      'assets/images/red t-shirt.png',
      'assets/images/cotton pant 1.png',
    ];
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
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
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Product Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: AppTheme.error,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "Size: M | Color: Blue",
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
                      "Rs. 599.00",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: qtyBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: qtyBorderColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          _buildQuantityButton(
                              icon: Icons.remove, onPressed: () {}),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: qtyTextColor,
                                ),
                              ),
                            ),
                          ),
                          _buildQuantityButton(
                              icon: Icons.add, onPressed: () {}),
                        ],
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

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          size: 16,
          color: AppTheme.primaryColor,
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
              color: isTotal ? AppTheme.primaryColor : titleColor,
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
    final qtyBackgroundColor = isDark ? Color(0xFF0F172A) : Colors.white;
    final qtyBorderColor =
        isDark ? Colors.white24 : AppTheme.textSecondary.withOpacity(0.2);
    final qtyTextColor = isDark ? Colors.white : AppTheme.textPrimary;
    final promoBackgroundColor = isDark ? Color(0xFF1E293B) : Colors.white;
    final bottomSheetColor = isDark ? Color(0xFF0F172A) : Colors.white;

    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                  "Shopping Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => _buildCartItem(
                        index,
                        cardBackgroundColor: cardBackgroundColor,
                        titleColor: titleColor,
                        subtitleColor: subtitleColor,
                        shadowColor: shadowColor,
                        qtyBackgroundColor: qtyBackgroundColor,
                        qtyBorderColor: qtyBorderColor,
                        qtyTextColor: qtyTextColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: promoBackgroundColor,
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
                      Icon(
                        Icons.local_offer_outlined,
                        color: AppTheme.primaryColor,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Promo Code",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: subtitleColor,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Apply"),
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
                      Divider(height: 24, color: qtyBorderColor),
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
            text: "Proceed to Checkout",
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
