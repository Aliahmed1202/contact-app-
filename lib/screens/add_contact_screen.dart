import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../models/contact_model.dart';
import '../core/widgets/app_text_field.dart';
import '../core/utils/app_colors.dart';

const Color sheetColor = AppColors.sheet; // From palette
const Color accentColor = AppColors.primary; // Light beige
const Color fieldColor = AppColors.field; // From palette
const Color textPrimary = AppColors.text;
const Color textSecondary = AppColors.primary; // From palette

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
    _phoneController.addListener(() => setState(() {}));
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(
        context,
        Contact(
          id: DateTime.now().toString(),
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          imagePath: _imagePath,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 16,
      ),
      decoration: const BoxDecoration(
        color: sheetColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const SizedBox(height: 24),

              _buildPreviewCard(),
              const SizedBox(height: 24),

              AppTextField(
                hint: 'Enter User Name',
                controller: _nameController,
                keyboardType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  LengthLimitingTextInputFormatter(50),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'Name must contain only letters';
                  }
                  if (value.trim().length < 2) {
                    return 'Name must be at least 2 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: 'Enter User Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  

                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
                  );
                  
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  

                  if (value.startsWith('.') || value.endsWith('.')) {
                    return 'Email cannot start or end with a dot';
                  }
                  
                  if (value.contains('..')) {
                    return 'Email cannot contain consecutive dots';
                  }
                  
                  if (value.split('@').length != 2) {
                    return 'Email must contain exactly one @ symbol';
                  }
                  
                  final parts = value.split('@');
                  if (parts[0].isEmpty || parts[1].isEmpty) {
                    return 'Email must have content before and after @';
                  }
                  
                  if (parts[1].split('.').last.length < 2) {
                    return 'Domain extension must be at least 2 characters';
                  }
                  
                  return null;
                },
              ),
              const SizedBox(height: 16),

              AppTextField(
                hint: 'Enter User Phone',
                controller: _phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(15), // Limit to 15 digits
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Phone number must contain only numbers';
                  }
                  if (value.length < 8) {
                    return 'Phone number must be at least 8 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: AppColors.sheet,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Enter user',
                  style: GoogleFonts.poppins(
                    color: AppColors.sheet,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildPreviewCard() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: sheetColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.text.withValues(alpha:0.7)),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: sheetColor,
                      borderRadius: BorderRadius.circular(12),
                      image: _imagePath != null
                          ? DecorationImage(
                              image: FileImage(File(_imagePath!)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _imagePath == null
                        ? Lottie.asset(
                            'assets/images/image_picker.json',
                            fit: BoxFit.contain,
                          )
                        : null,
                  ),
                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.text, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _nameController.text.isEmpty ? 'User Name' : _nameController.text,
                  style: GoogleFonts.poppins(
                    color: textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.white.withValues(alpha:0.7),
                ),
                const SizedBox(height: 12),
                Text(
                  _emailController.text.isEmpty ? 'example@email.com' : _emailController.text,
                  style: GoogleFonts.poppins(
                    color: textSecondary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.white.withValues(alpha:0.7),
                ),
                const SizedBox(height: 12),
                Text(
                  _phoneController.text.isEmpty ? '+200000000000' : "+2" + _phoneController.text,
                  style: GoogleFonts.poppins(
                    color: textSecondary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}