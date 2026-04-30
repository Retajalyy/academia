import 'package:supabase_flutter/supabase_flutter.dart';

class HomeService {
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> fetchHomeData(String userId) async {
    final user = await supabase
        .from('users')
        .select()
        .eq('uuid', userId)
        .single();

    final classes = await supabase
        .from('classes')
        .select()
        .eq('user_id', userId);

    final assignments = await supabase
        .from('assignments')
        .select()
        .eq('user_id', userId);

    return {
      "user": user,
      "classes": classes,
      "assignments": assignments,
    };
  }
}