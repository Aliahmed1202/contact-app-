import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../models/contact_model.dart';
import 'add_contact_screen.dart';
import '../core/widgets/contact_card.dart';

import '../core/utils/app_colors.dart';

const Color accentColor = AppColors.primary; 
const Color backgroundColor = AppColors.sheet;
const Color fieldColor = AppColors.field;
const Color textPrimary = AppColors.text;
const Color textSecondary = AppColors.primary;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Contact> _contacts = [];

  void _addContact(Contact contact) {
    setState(() {
      _contacts.add(contact);
    });
  }

  void _deleteContact(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: Text(
            'Delete Contact',
            style: GoogleFonts.poppins(
              color: textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Are you sure you want to delete ${_contacts[index].name}?',
            style: GoogleFonts.poppins(
              color: textSecondary,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _contacts.removeAt(index);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Contact deleted successfully',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFF4CAF50),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE74C3C),
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Delete',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            'assets/images/head logo.png',
            height: 30,
          ),
        ),
      ),
      body: _contacts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/empty_list.json',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'There is No Contacts Added Here',
                    style: GoogleFonts.poppins(
                      color: textSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65, // Increased height to prevent overflow
              ),
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                return ContactCard(
                  contact: contact,
                  fieldColor: fieldColor,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  accentColor: accentColor,
                  onDelete: () => _deleteContact(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final contact = await showModalBottomSheet<Contact>(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddContactScreen(),
          );
          
          if (contact != null) {
            _addContact(contact);
          }
        },
        backgroundColor: textSecondary,
        child: const Icon(Icons.add, color: AppColors.sheet),
      ),
    );
  }

  
}