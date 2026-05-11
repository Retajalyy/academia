import 'package:academia/Core/utilities/colors.dart';
import 'package:flutter/material.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({super.key});

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  final TextEditingController _phoneController =
      TextEditingController(text: '+20 100 123 4567');

  final TextEditingController _emailController =
      TextEditingController(text: 'Ahmed.muhamed@gmail.com');

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// SECTION TITLE
        const Text(
          'PERSONAL INFO',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.smalltext,
            letterSpacing: 1.2,
          ),
        ),

        const SizedBox(height: 12),

        /// CARD
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              _buildEditableField(
                icon: Icons.phone,
                fieldLabel: 'Phone number',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                iconBgColor: const Color(0xFFDDEDFA),
                iconColor: AppColors.accentProgramming1,
              ),

              /// 🔥 DIVIDER ADDED HERE
            Padding(
             padding: const EdgeInsets.symmetric(vertical: 12),
             child: Divider(
             thickness: 1,
             height: 1,
              color: Colors.black.withOpacity(0.04),
             ),
            ),

              _buildEditableField(
                icon: Icons.email,
                fieldLabel: 'Personal email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                iconBgColor: const Color(0xFFFFF3DF),
                iconColor: AppColors.assignmentColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// FIELD DESIGN
  Widget _buildEditableField({
    required IconData icon,
    required String fieldLabel,
    required TextEditingController controller,
    required Color iconBgColor,
    required Color iconColor,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
  offset: const Offset(0, 7), // 👈 move down (change value as needed)
  child: Container(
    width: 47,
    height: 47,
    decoration: BoxDecoration(
      color: iconBgColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Icon(
        icon,
        size: 25,
        color: iconColor,
      ),
    ),
  ),
),
        

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fieldLabel,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.smalltext.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 6),

              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}