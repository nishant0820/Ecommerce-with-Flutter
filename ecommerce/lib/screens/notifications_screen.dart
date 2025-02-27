import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'type': 'order',
      'title': 'Order Delivered',
      'message': 'Your order has been delivered successfully.',
      'time': '2 mins ago',
      'read': false,
      'icon': Icons.local_shipping_outlined,
      'iconColor': AppTheme.success,
    },
    {
      'type': 'promo',
      'title': 'Special Offer',
      'message': 'Get 50% of on all electronics this weekend!',
      'time': '1 hour ago',
      'read': false,
      'icon': Icons.local_offer_outlined,
      'iconColor': AppTheme.primaryColor,
    },
    {
      'type': 'payment',
      'title': 'Payment Successful',
      'message': 'Payment of \Rs. 299.299 was successful.',
      'time': '3 hours ago',
      'read': true,
      'icon': Icons.payment_outlined,
      'iconColor': AppTheme.success,
    },
    {
      'type': 'alert',
      'title': 'Price Drop Alert',
      'message': 'Price dropped for item in your wishlist',
      'time': '5 hours ago',
      'read': true,
      'icon': Icons.notifications_outlined,
      'iconColor': AppTheme.warning,
    },
    {
      'type': 'system',
      'title': 'System Update',
      'message': 'Your account settings have been updated',
      'time': '1 day ago',
      'read': true,
      'icon': Icons.system_update_outlined,
      'iconColor': AppTheme.secondaryColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
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
                titlePadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                title: Text(
                  "Notifications",
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
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.done_all,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: notification['read'] ? Colors.white54 : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (notification['iconColor'] as Color)
                                .withOpacity(0.1),
                          ),
                          child: Icon(
                            notification['icon'] as IconData,
                            color: notification['iconColor'] as Color,
                            size: 24,
                          ),
                        ),
                        if (!notification['read'])
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Text(
                      notification['title'] as String,
                      style: TextStyle(
                        fontWeight: notification['read']
                            ? FontWeight.normal
                            : FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          notification['message'] as String,
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          notification['time'] as String,
                          style: TextStyle(
                            color: AppTheme.primaryDark,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.mark_email_read_outlined),
                                  title: Text("Mark as read"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.delete_outlined),
                                  title: Text("Delete Notification"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.block_outlined),
                                  title: Text("Turn off notifications"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.more_horiz,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
