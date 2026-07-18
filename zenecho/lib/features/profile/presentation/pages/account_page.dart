import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth/auth_event.dart';
import '../bloc/delete_account/delete_account_cubit.dart';
import '../bloc/delete_account/delete_account_state.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void _showDeleteAccountBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.lightSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return BlocProvider<DeleteAccountCubit>(
          create: (context) => sl<DeleteAccountCubit>()..showWarning(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
            ),
            child: const _DeleteAccountBottomSheetContent(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final userEmail = authState.maybeWhen(
      authenticated: (u) => u.email,
      orElse: () => 'dev@zenecho.com',
    );

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
          'Account',
          style: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),

            Container(
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
                children: [
                  _buildMenuItem(
                    icon: Icons.lock_outline_rounded,
                    label: 'Change Password',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildEmailItem(
                    icon: Icons.mail_outline_rounded,
                    label: 'Email',
                    value: userEmail,
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.download_outlined,
                    label: 'Download My Data',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.delete_outline_rounded,
                    label: 'Delete Account',
                    isDestructive: true,
                    onTap: () => _showDeleteAccountBottomSheet(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    final color = isDestructive
        ? AppColors.lightDestructive
        : AppColors.lightTextPrimary;
    final iconColor = isDestructive
        ? AppColors.lightDestructive
        : AppColors.lightTextSecondary;
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 20),
      title: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right_rounded, color: iconColor, size: 20),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildEmailItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: AppColors.lightTextSecondary, size: 20),
          const SizedBox(width: 16),
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
          Text(
            value,
            style: const TextStyle(
              color: AppColors.lightTextSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
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
}

class _DeleteAccountBottomSheetContent extends StatefulWidget {
  const _DeleteAccountBottomSheetContent();

  @override
  State<_DeleteAccountBottomSheetContent> createState() =>
      _DeleteAccountBottomSheetContentState();
}

class _DeleteAccountBottomSheetContentState
    extends State<_DeleteAccountBottomSheetContent> {
  final TextEditingController _confirmController = TextEditingController();
  bool _isDeleteButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _confirmController.addListener(_onConfirmTextChanged);
  }

  void _onConfirmTextChanged() {
    setState(() {
      _isDeleteButtonEnabled = _confirmController.text.trim() == 'DELETE';
    });
  }

  @override
  void dispose() {
    _confirmController.removeListener(_onConfirmTextChanged);
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        state.maybeWhen(
          failure: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(msg),
                backgroundColor: AppColors.lightDestructive,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Handle Bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.lightTextSecondary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              state.maybeWhen(
                warning: () => _buildWarningView(context),
                confirming: () => _buildConfirmView(context),
                deleting: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.lightDestructive,
                    ),
                  ),
                ),
                success: () => _buildSuccessView(context),
                orElse: () => const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWarningView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.lightDestructiveBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: AppColors.lightDestructive,
              size: 56,
            ),
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          'Xóa Tài Khoản?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        const Text(
          'Hành động này không thể hoàn tác. Toàn bộ kỷ niệm, hộp lưu trữ và dữ liệu của bạn sẽ bị xóa vĩnh viễn.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.lightTextSecondary,
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),

        // Actions
        ElevatedButton(
          onPressed: () => context.read<DeleteAccountCubit>().showConfirm(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightDestructive,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Tiếp tục xóa',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.lightBorder),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Hủy bỏ',
            style: TextStyle(
              color: AppColors.lightTextPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.lightDestructiveBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.delete_forever_rounded,
              color: AppColors.lightDestructive,
              size: 56,
            ),
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          'Xác Nhận Xóa',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        const Text(
          'Vui lòng nhập từ "DELETE" vào ô bên dưới để xác nhận việc xóa tài khoản.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.lightTextSecondary,
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),

        TextFormField(
          controller: _confirmController,
          textAlign: TextAlign.center,
          autofocus: true,
          style: const TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: 'DELETE',
            hintStyle: TextStyle(
              color: AppColors.lightTextSecondary.withValues(alpha: 0.5),
              fontSize: 16,
            ),
            fillColor: AppColors.lightBg,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.lightBorder,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.lightAccent,
                width: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Actions
        ElevatedButton(
          onPressed: _isDeleteButtonEnabled
              ? () => context.read<DeleteAccountCubit>().confirmDeletion()
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightDestructive,
            disabledBackgroundColor: AppColors.lightDestructive.withValues(
              alpha: 0.4,
            ),
            foregroundColor: Colors.white,
            disabledForegroundColor: Colors.white.withValues(alpha: 0.6),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Xóa vĩnh viễn',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            _confirmController.clear();
            context.read<DeleteAccountCubit>().showWarning();
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.lightBorder),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Quay lại',
            style: TextStyle(
              color: AppColors.lightTextPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.green,
              size: 56,
            ),
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          'Đã Xóa Tài Khoản',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        const Text(
          'Tài khoản của bạn đã được xóa hoàn tất thành công.\nRất tiếc khi phải chia tay bạn.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.lightTextSecondary,
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightTextPrimary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Hoàn tất',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
