import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/profile/profile_event.dart';
import '../bloc/profile/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.fetchRequested());
  }

  void _showAvatarBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.lightSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.lightTextSecondary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Thay Đổi Ảnh Đại Diện',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.lightTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildBottomSheetOption(
              icon: Icons.camera_alt_outlined,
              label: 'Chụp ảnh mới',
              onTap: () {
                Navigator.pop(bottomSheetContext);
                context.read<ProfileBloc>().add(
                      const ProfileEvent.avatarUploadRequested(
                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=300&q=80'),
                    );
              },
            ),
            _buildBottomSheetOption(
              icon: Icons.photo_library_outlined,
              label: 'Chọn từ thư viện',
              onTap: () {
                Navigator.pop(bottomSheetContext);
                context.read<ProfileBloc>().add(
                      const ProfileEvent.avatarUploadRequested(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=300&q=80'),
                    );
              },
            ),
            _buildBottomSheetOption(
              icon: Icons.face_outlined,
              label: 'Chọn ảnh hoạt hình',
              onTap: () {
                Navigator.pop(bottomSheetContext);
                context.read<ProfileBloc>().add(
                      const ProfileEvent.avatarUploadRequested(
                          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?auto=format&fit=crop&w=300&q=80'),
                    );
              },
            ),
            _buildBottomSheetOption(
              icon: Icons.delete_outline_rounded,
              label: 'Xóa ảnh hiện tại',
              isDestructive: true,
              onTap: () {
                Navigator.pop(bottomSheetContext);
                final currentProfile = context.read<ProfileBloc>().state.maybeWhen<Profile?>(
                      loaded: (p) => p,
                      updateSuccess: (p) => p,
                      orElse: () => null,
                    );
                if (currentProfile != null) {
                  context.read<ProfileBloc>().add(
                        ProfileEvent.updateRequested(
                          currentProfile.copyWith(avatarUrl: null),
                        ),
                      );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    final color = isDestructive ? AppColors.lightDestructive : AppColors.lightTextPrimary;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.lightTextPrimary),
          onPressed: () => context.go(AppRoutes.home),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.lightTextPrimary),
            onPressed: () => context.push('/profile/account'),
          ),
        ],
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: AppColors.lightDestructive),
              );
            },
            updateSuccess: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cập nhật thành công!'), backgroundColor: Colors.green),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator(color: AppColors.lightAccent)),
            failure: (msg) => Center(
              child: Text(
                'Lỗi: $msg\nBấm để tải lại.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.lightTextSecondary),
              ),
            ),
            orElse: () {
              final profile = state.maybeWhen<Profile?>(
                loaded: (p) => p,
                updating: (p) => p,
                updateSuccess: (p) => p,
                orElse: () => null,
              );

              if (profile == null) {
                return const Center(child: Text('Không tìm thấy profile', style: TextStyle(color: AppColors.lightTextSecondary)));
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Avatar Image with Camera Badge
                    GestureDetector(
                      onTap: () => _showAvatarBottomSheet(context),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.lightAccent,
                                  Color(0xFF60A5FA),
                                ],
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 56,
                              backgroundColor: AppColors.lightBg,
                              backgroundImage: profile.avatarUrl != null
                                  ? NetworkImage(profile.avatarUrl!)
                                  : null,
                              child: profile.avatarUrl == null
                                  ? const Icon(Icons.person, size: 56, color: AppColors.lightTextSecondary)
                                  : null,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              size: 16,
                              color: AppColors.lightTextPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Name + Verified Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          profile.name,
                          style: const TextStyle(
                            color: AppColors.lightTextPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.verified_rounded,
                          color: AppColors.lightAccent,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Username
                    Text(
                      '@${profile.username}',
                      style: const TextStyle(
                        color: AppColors.lightTextSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Bio
                    Text(
                      profile.bio,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.lightTextPrimary.withValues(alpha: 0.85),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Stats row
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.lightSurface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.lightBorder,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatItem('Memories', profile.memoriesCount),
                          Container(width: 1, height: 24, color: AppColors.lightBorder),
                          _buildStatItem('Friends', profile.friendsCount),
                          Container(width: 1, height: 24, color: AppColors.lightBorder),
                          _buildStatItem('Capsules', profile.capsulesCount),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Actions list menu
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightSurface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.lightBorder,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildMenuItem(
                            icon: Icons.edit_outlined,
                            label: 'Edit Profile',
                            onTap: () => context.push('/profile/edit'),
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            icon: Icons.privacy_tip_outlined,
                            label: 'Privacy Settings',
                            onTap: () => context.push('/profile/privacy'),
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            icon: Icons.notifications_none_rounded,
                            label: 'Notifications',
                            onTap: () {},
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            icon: Icons.person_outline_rounded,
                            label: 'Account',
                            onTap: () => context.push('/profile/account'),
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            icon: Icons.help_outline_rounded,
                            label: 'Help & Support',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildStatItem(String label, int count) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.lightTextSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.lightTextSecondary, size: 20),
      title: Text(
        label,
        style: const TextStyle(
          color: AppColors.lightTextPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.lightTextSecondary,
        size: 20,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.lightBorder,
      indent: 20,
      endIndent: 20,
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightSurface,
        border: Border(
          top: BorderSide(
            color: AppColors.lightBorder,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, 'Home', false, () => context.go(AppRoutes.home)),
          _buildNavItem(Icons.calendar_month_outlined, 'Timeline', false, () {}),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.lightAccent,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 24),
          ),
          _buildNavItem(Icons.bubble_chart_outlined, 'AI Recap', false, () {}),
          _buildNavItem(Icons.person_rounded, 'Profile', true, () {}),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
    final color = isActive ? AppColors.lightAccent : AppColors.lightTextSecondary;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
