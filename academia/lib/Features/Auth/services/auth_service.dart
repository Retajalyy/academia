import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  /// 🔐 Login باستخدام University ID
  Future<bool> login(String uniId, String password) async {
    try {
      // 1. Get email using uni_id
      final userData = await supabase
          .from('users')
          .select('email')
          .eq('uni_id', uniId)
          .maybeSingle();

      if (userData == null) {
        print("❌ LOGIN FAILED: University ID not found");
        return false;
      }

      final email = userData['email'];

      // 2. Login with Supabase Auth
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        print("✅ LOGIN SUCCESS for uni_id: $uniId");
        return true;
      } else {
        print("❌ LOGIN FAILED: Wrong password");
        return false;
      }
    } catch (e) {
      print("❌ LOGIN ERROR: $e");
      return false;
    }
  }

  /// 🚪 Logout
  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  /// 👤 Current user
  User? getCurrentUser() {
    return supabase.auth.currentUser;
  }
}