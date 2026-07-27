import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../widgets/friends_avatar_bar.dart';
import '../widgets/home_header.dart';
import '../widgets/memory_feed_card.dart';
import '../widgets/zen_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 0;

  final List<FriendStory> _mockFriends = const [
    FriendStory(
      id: '1',
      name: 'Minh',
      avatarUrl: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
    ),
    FriendStory(
      id: '2',
      name: 'An',
      avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
    ),
    FriendStory(
      id: '3',
      name: 'Linh',
      avatarUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150',
    ),
    FriendStory(
      id: '4',
      name: 'Quân',
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    ),
    FriendStory(
      id: '5',
      name: 'Huyền',
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
    ),
  ];

  final List<MemoryItem> _mockMemories = const [
    MemoryItem(
      id: 'mem_1',
      authorName: 'Minh',
      authorAvatarUrl: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
      timeAgo: 'Today · 8:42 AM',
      mediaType: MemoryMediaType.image,
      mediaUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
      moodEmoji: '😊',
      moodLabel: 'Happy',
      location: 'Da Nang',
      likeCount: 128,
      isLiked: true,
    ),
    MemoryItem(
      id: 'mem_2',
      authorName: 'An',
      authorAvatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
      timeAgo: 'Yesterday · 9:15 PM',
      mediaType: MemoryMediaType.video,
      mediaUrl: 'https://images.unsplash.com/photo-1519501025264-65ba15a82390?w=800',
      videoDuration: '0:12',
      moodEmoji: '😌',
      moodLabel: 'Calm',
      location: 'Hoi An',
      likeCount: 96,
      isLiked: false,
    ),
  ];

  void _onTabSelected(int index) {
    if (index == 4) {
      context.go(AppRoutes.profile);
    } else {
      setState(() {
        _currentTabIndex = index;
      });
    }
  }

  void _onCreateMemoryTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Capturing today\'s memory...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final user = authState.maybeWhen(
      authenticated: (u) => u,
      orElse: () => null,
    );

    final displayName = user?.name ?? 'Hoàng';

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: HomeHeader(
                  userName: displayName,
                  onNotificationTap: () {},
                  onMessagesTap: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 12),
                child: FriendsAvatarBar(
                  friends: _mockFriends,
                  onAddMomentTap: _onCreateMemoryTap,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final memory = _mockMemories[index];
                    return MemoryFeedCard(
                      memory: memory,
                      onLikeTap: () {},
                      onSendMsgTap: () {},
                      onMoreTap: () {},
                    );
                  },
                  childCount: _mockMemories.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ZenBottomNavBar(
        selectedIndex: _currentTabIndex,
        onTabSelected: _onTabSelected,
        onCreateTap: _onCreateMemoryTap,
      ),
    );
  }
}
