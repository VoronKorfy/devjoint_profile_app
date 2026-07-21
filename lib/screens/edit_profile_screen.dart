import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:devjoint_profile_app/widgets/custom_button.dart';
import 'package:devjoint_profile_app/widgets/profile_avatar_picker.dart';
import 'package:devjoint_profile_app/widgets/custom_input_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // controllers prefilled with dummy data
  final TextEditingController _nameController = TextEditingController(
    text: 'FuadEliyevFlutterDeveloper2026SuperLongUsername',
  );
  final TextEditingController _emailController = TextEditingController(
    text:
        'fuad.eliyev.flutter.mobile.super.long.idk.what.to.write.lol.developer@gmail.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+994 50 123 45 67',
  );
  final TextEditingController _bioController = TextEditingController(
    text:
        'Passionate Flutter developer who loves building beautiful and functional apps.',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color(0xFF6C5CE7),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            children: [
              // avatar view widget
              const ProfileAvatarPicker(),
              const SizedBox(height: 24),

              // form fields
              CustomInputField(
                label: 'Full Name',
                icon: Icons.person_outline,
                controller: _nameController,
              ),
              const SizedBox(height: 16),
              CustomInputField(
                label: 'Email',
                icon: Icons.email_outlined,
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              CustomInputField(
                label: 'Phone',
                icon: Icons.phone_outlined,
                controller: _phoneController,
              ),
              const SizedBox(height: 16),
              CustomInputField(
                label: 'Bio',
                controller: _bioController,
                maxLines: 3,
              ),
              const SizedBox(height: 32),

              // save action button
              CustomButton(
                text: 'Save Changes',
                onPressed: () => context.pop(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
