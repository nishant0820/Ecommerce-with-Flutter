import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chatList = [
    {
      'name': 'John Doe',
      'lastMessage': 'Hey, how are you?',
      'time': '2:30 PM',
      'unreadCount': 2,
      'avatar': 'assets/images/user.jpg',
      'isOnline': true,
    },
    {
      'name': 'Smith',
      'lastMessage': 'The package has been delivered',
      'time': '1:45 PM',
      'unreadCount': 0,
      'avatar': 'assets/images/user.jpg',
      'isOnline': false,
    },
    {
      'name': 'Alex',
      'lastMessage': 'Provide more details for the order',
      'time': '2:30 PM',
      'unreadCount': 1,
      'avatar': 'assets/images/user.jpg',
      'isOnline': true,
    },
    {
      'name': 'Nishant',
      'lastMessage': 'Your order has been shipped',
      'time': '9:00 PM',
      'unreadCount': 3,
      'avatar': 'assets/images/user.jpg',
      'isOnline': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            floating: false,
            pinned: true,
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
                centerTitle: true,
                titlePadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                title: Text(
                  "Messages",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                background: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      right: -50,
                      child: Container(
                        width: 150,
                        height: 150,
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
                  Icons.search,
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        hintText: 'Search Message',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: AppTheme.textSecondary,
                        ),
                        hintStyle: TextStyle(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    final chat = chatList[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      AppTheme.primaryColor.withOpacity(0.1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      chat['avatar'],
                                    ),
                                  ),
                                ),
                                if (chat['isOnline'])
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        color: AppTheme.success,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chat['name'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    chat['lastMessage'],
                                    style: TextStyle(
                                      fontSize:
                                          chat['unreadCount'] == 0 ? 13 : 14,
                                      color: AppTheme.textSecondary,
                                      fontWeight: chat['unreadCount'] == 0
                                          ? FontWeight.normal
                                          : FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  chat['time'],
                                  style: TextStyle(
                                    fontSize:
                                        chat['unreadCount'] == 0 ? 12 : 13,
                                    color: AppTheme.textSecondary,
                                    fontWeight: chat['unreadCount'] == 0
                                        ? FontWeight.normal
                                        : FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4),
                                if (chat['unreadCount'] > 0)
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        chat['unreadCount'].toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
