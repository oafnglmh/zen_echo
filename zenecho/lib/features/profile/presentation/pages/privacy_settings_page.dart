import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/profile/profile_event.dart';
import '../bloc/profile/profile_state.dart';

class PrivacySettingsPage extends StatelessWidget {
  const PrivacySettingsPage({super.key});

  void _updatePrivacySetting(
    BuildContext context,
    Profile profile,
    Profile updated,
  ) {
    context.read<ProfileBloc>().add(ProfileEvent.updateRequested(updated));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.lightTextPrimary,
          ),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Privacy Settings',
          style: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final profile = state.maybeWhen<Profile?>(
            loaded: (p) => p,
            updating: (p) => p,
            updateSuccess: (p) => p,
            orElse: () => null,
          );

          if (profile == null) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.lightAccent),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                _buildSectionHeader('Profile Visibility'),
                _buildSettingCard(
                  children: [
                    _buildSelectionItem(
                      label: 'Who can see your profile',
                      value: profile.profileVisibility,
                      onTap: () => _showSelectionDialog(
                        context,
                        title: 'Who can see your profile',
                        options: ['Everyone', 'Friends', 'Only Me'],
                        selectedOption: profile.profileVisibility,
                        onSelected: (val) {
                          _updatePrivacySetting(
                            context,
                            profile,
                            profile.copyWith(profileVisibility: val),
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Text(
                        'Choose who can view your profile information.',
                        style: TextStyle(
                          color: AppColors.lightTextSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Memory Privacy Section
                _buildSectionHeader('Memory Privacy'),
                _buildSettingCard(
                  children: [
                    _buildSelectionItem(
                      label: 'Who can see your memories',
                      value: profile.memoryVisibility,
                      onTap: () => _showSelectionDialog(
                        context,
                        title: 'Who can see your memories',
                        options: ['Everyone', 'Friends', 'Only Me'],
                        selectedOption: profile.memoryVisibility,
                        onSelected: (val) {
                          _updatePrivacySetting(
                            context,
                            profile,
                            profile.copyWith(memoryVisibility: val),
                          );
                        },
                      ),
                    ),
                    _buildDivider(),
                    _buildToggleItem(
                      label: 'Allow others to share your memories',
                      value: profile.allowShareMemories,
                      onChanged: (val) {
                        _updatePrivacySetting(
                          context,
                          profile,
                          profile.copyWith(allowShareMemories: val),
                        );
                      },
                    ),
                    _buildDivider(),
                    _buildToggleItem(
                      label: 'Show memories on Timeline',
                      value: profile.showMemoriesOnTimeline,
                      onChanged: (val) {
                        _updatePrivacySetting(
                          context,
                          profile,
                          profile.copyWith(showMemoriesOnTimeline: val),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Activity Status Section
                _buildSectionHeader('Activity Status'),
                _buildSettingCard(
                  children: [
                    _buildToggleItem(
                      label: "Show when I'm online",
                      value: profile.showOnlineStatus,
                      onChanged: (val) {
                        _updatePrivacySetting(
                          context,
                          profile,
                          profile.copyWith(showOnlineStatus: val),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Other Section
                _buildSectionHeader('Other'),
                _buildSettingCard(
                  children: [
                    _buildToggleItem(
                      label: 'Allow friend requests',
                      value: profile.allowFriendRequests,
                      onChanged: (val) {
                        _updatePrivacySetting(
                          context,
                          profile,
                          profile.copyWith(allowFriendRequests: val),
                        );
                      },
                    ),
                    _buildDivider(),
                    _buildSelectionItem(
                      label: 'Allow messages from',
                      value: profile.allowMessagesFrom,
                      onTap: () => _showSelectionDialog(
                        context,
                        title: 'Allow messages from',
                        options: ['Everyone', 'Friends'],
                        selectedOption: profile.allowMessagesFrom,
                        onSelected: (val) {
                          _updatePrivacySetting(
                            context,
                            profile,
                            profile.copyWith(allowMessagesFrom: val),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.lightTextPrimary,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lightBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildSelectionItem({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          color: AppColors.lightTextPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.lightAccent,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.lightTextSecondary,
            size: 20,
          ),
        ],
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
    );
  }

  Widget _buildToggleItem({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.lightTextPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CupertinoSwitch(
            value: value,
            activeColor: AppColors.lightAccent,
            trackColor: AppColors.lightBorder,
            onChanged: onChanged,
          ),
        ],
      ),
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

  void _showSelectionDialog(
    BuildContext context, {
    required String title,
    required List<String> options,
    required String selectedOption,
    required ValueChanged<String> onSelected,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.lightSurface,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options
              .map(
                (opt) => RadioListTile<String>(
                  title: Text(
                    opt,
                    style: const TextStyle(
                      color: AppColors.lightTextPrimary,
                      fontSize: 14,
                    ),
                  ),
                  value: opt,
                  groupValue: selectedOption,
                  activeColor: AppColors.lightAccent,
                  onChanged: (val) {
                    if (val != null) {
                      onSelected(val);
                      Navigator.pop(context);
                    }
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
