import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/profile/profile_event.dart';
import '../bloc/profile/profile_state.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _locationController;
  late TextEditingController _websiteController;

  int _bioCharCount = 0;
  static const int _bioMaxLimit = 150;
  Profile? _originalProfile;

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfileBloc>().state;
    _originalProfile = state.maybeWhen<Profile?>(
      loaded: (p) => p,
      updating: (p) => p,
      updateSuccess: (p) => p,
      orElse: () => null,
    );

    _usernameController = TextEditingController(text: _originalProfile?.username ?? '');
    _nameController = TextEditingController(text: _originalProfile?.name ?? '');
    _bioController = TextEditingController(text: _originalProfile?.bio ?? '');
    _locationController = TextEditingController(text: _originalProfile?.location ?? '');
    _websiteController = TextEditingController(text: _originalProfile?.website ?? '');

    _bioCharCount = _bioController.text.length;
    _bioController.addListener(_onBioChanged);
  }

  void _onBioChanged() {
    setState(() {
      _bioCharCount = _bioController.text.length;
    });
  }

  @override
  void dispose() {
    _bioController.removeListener(_onBioChanged);
    _usernameController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void _onSavePressed() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_originalProfile != null) {
        final updated = _originalProfile!.copyWith(
          username: _usernameController.text.trim(),
          name: _nameController.text.trim(),
          bio: _bioController.text.trim(),
          location: _locationController.text.trim(),
          website: _websiteController.text.trim(),
        );

        context.read<ProfileBloc>().add(ProfileEvent.updateRequested(updated));
        context.pop();
      }
    }
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
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColors.lightTextPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _onSavePressed,
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppColors.lightAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),

                  // Avatar overview circle
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundColor: AppColors.lightBg,
                          backgroundImage: _originalProfile?.avatarUrl != null
                              ? NetworkImage(_originalProfile!.avatarUrl!)
                              : null,
                          child: _originalProfile?.avatarUrl == null
                              ? const Icon(Icons.person, size: 48, color: AppColors.lightTextSecondary)
                              : null,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            size: 14,
                            color: AppColors.lightTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Username field
                  _buildLabel('Username'),
                  _buildTextField(
                    controller: _usernameController,
                    hint: 'Username',
                    validator: (v) => (v == null || v.isEmpty) ? 'Vui lòng nhập Username' : null,
                  ),
                  const SizedBox(height: 20),

                  // Full Name field
                  _buildLabel('Full Name'),
                  _buildTextField(
                    controller: _nameController,
                    hint: 'Full Name',
                    validator: (v) => (v == null || v.isEmpty) ? 'Vui lòng nhập Tên đầy đủ' : null,
                  ),
                  const SizedBox(height: 20),

                  // Bio field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLabel('Bio'),
                      Text(
                        '$_bioCharCount/$_bioMaxLimit',
                        style: const TextStyle(
                          color: AppColors.lightTextSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  _buildTextField(
                    controller: _bioController,
                    hint: 'Bio description...',
                    maxLines: 3,
                    maxLength: _bioMaxLimit,
                    showCounter: false,
                  ),
                  const SizedBox(height: 20),

                  // Location field
                  _buildLabel('Location'),
                  _buildTextField(
                    controller: _locationController,
                    hint: 'Location',
                    prefixIcon: Icons.location_on_outlined,
                    suffixIcon: Icons.chevron_right_rounded,
                  ),
                  const SizedBox(height: 20),

                  // Website field
                  _buildLabel('Website'),
                  _buildTextField(
                    controller: _websiteController,
                    hint: 'Website',
                    prefixIcon: Icons.link_rounded,
                    suffixIcon: Icons.close_rounded,
                    onSuffixTap: () => _websiteController.clear(),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.lightTextSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    int? maxLength,
    bool showCounter = false,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onSuffixTap,
    bool readOnly = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      readOnly: readOnly,
      validator: validator,
      style: const TextStyle(color: AppColors.lightTextPrimary, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.lightTextSecondary, fontSize: 14),
        fillColor: AppColors.lightSurface,
        filled: true,
        counterText: showCounter ? null : '',
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.lightTextSecondary, size: 20)
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(suffixIcon, color: AppColors.lightTextSecondary, size: 20),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
