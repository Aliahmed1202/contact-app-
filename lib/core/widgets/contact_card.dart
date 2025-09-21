import 'dart:io';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
    this.fieldColor = const Color(0xffFFF1D4),
    this.textPrimary = Colors.white,
    this.textSecondary = const Color(0xFFFFF1D4),
    this.accentColor = const Color(0xFFFFF1D4),
    this.onTap,
    this.onDelete,
  });

  final Contact contact;
  final Color fieldColor;
  final Color textPrimary;
  final Color textSecondary;
  final Color accentColor;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFFF1D4) ,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with name overlay
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    image: contact.imagePath != null
                        ? DecorationImage(
                            image: FileImage(File(contact.imagePath!)),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: contact.imagePath == null ? accentColor.withValues(alpha: 0.1) : null,
                  ),
                  child: contact.imagePath == null
                      ? const Center(child: Icon(Icons.person, size: 40, color: Color(0xFFFFF1D4)))
                      : null,
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      contact.name,
                      style: GoogleFonts.poppins(
                        color: AppColors.sheet,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset(
                          AppIcon.email,
                          width: 20,
                          height: 16,
                          color: AppColors.sheet,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.email, size: 12, color: AppColors.sheet);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          contact.email,
                          style: GoogleFonts.poppins(color: AppColors.sheet, fontSize: 10,fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset(
                          AppIcon.phone,
                          width: 20,
                          height: 16,
                          color: AppColors.sheet,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.phone, size: 12, color: AppColors.sheet);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          contact.phone,
                          style: GoogleFonts.poppins(color: AppColors.sheet, fontSize: 10,fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  
                  
                  SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: ElevatedButton.icon(
                      onPressed: onDelete,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE74C3C),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      icon: Image.asset(
                        AppIcon.delete,
                        width: 14,
                        height: 14,
                        color: const Color(0xffFFF1D4),
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            AppIcon.delete,
                            width: 14,
                            height: 14,
                            color: const Color(0xffFFF1D4),
                          );
                        },
                      ),
                      label: Text(
                        'Delete',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffFFF1D4), 
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}