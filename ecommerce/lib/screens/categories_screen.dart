import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final cardBackgroundColor = isDark ? Color(0xFF1E293B) : Colors.white;
    final titleColor = isDark ? Colors.white : AppTheme.textPrimary;
    final subtitleColor = isDark ? Colors.white70 : AppTheme.textSecondary;
    final shadowColor =
        isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.05);
    final borderColor = isDark ? Colors.white12 : Colors.transparent;

    final subcategories = [
      {'icon': Icons.checkroom_outlined, 'name': 'Clothing'},
      {'icon': Icons.watch_outlined, 'name': 'Accessories'},
      {'icon': Icons.shopping_bag_outlined, 'name': 'Bags'},
      {'icon': Icons.diamond_outlined, 'name': 'Jewelry'},
      {'icon': Icons.shopify_outlined, 'name': 'Shoes'},
      {'icon': Icons.sports_baseball_outlined, 'name': 'Sports'},
    ];
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
                centerTitle: true,
                title: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: subcategories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: borderColor),
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              subcategories[index]['icon'] as IconData,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            subcategories[index]['name'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: titleColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Feeatured Brands",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 16, bottom: 10),
                            decoration: BoxDecoration(
                              color: cardBackgroundColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: borderColor),
                              boxShadow: [
                                BoxShadow(
                                  color: shadowColor,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Brand ${index + 1}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: subcategories.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 16, bottom: 10),
                          decoration: BoxDecoration(
                            color: cardBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: borderColor),
                            boxShadow: [
                              BoxShadow(
                                color: shadowColor,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.category_outlined,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                            title: Text(
                              subcategories[index]['name'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: titleColor,
                              ),
                            ),
                            subtitle: Text(
                              '${(index + 1 * 100)} Products',
                              style: TextStyle(
                                color: subtitleColor,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: subtitleColor,
                            ),
                          ),
                        );
                      },
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
}
