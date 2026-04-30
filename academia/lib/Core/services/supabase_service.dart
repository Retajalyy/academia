import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static late SupabaseClient client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://fwyixcaqfhveqzjmgnuq.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3eWl4Y2FxZmh2ZXF6am1nbnVxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY1NjcxNTcsImV4cCI6MjA5MjE0MzE1N30._B5SPenba3r3DO21GsNU_QqtIDZYCyRok0Lxo_ICzo4',
    );

    client = Supabase.instance.client;
  }
}