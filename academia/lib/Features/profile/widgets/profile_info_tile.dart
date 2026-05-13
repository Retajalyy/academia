import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isReadOnly;

  const ProfileInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isReadOnly = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.grey[600]),
      ),
      title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
      trailing: isReadOnly ? const Icon(Icons.lock_outline, size: 18, color: Colors.grey) : null,
    );
  }
}