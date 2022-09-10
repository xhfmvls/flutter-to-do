import 'package:supabase/supabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupaBaseHandler {
  static String supaBaseURL = dotenv.env['SupaBaseURL']!;
  static String supaBaseKey = dotenv.env['SupaBaseKey']!;

  final client = SupabaseClient(supaBaseURL, supaBaseKey);

  addData(String taskValue, bool statusValue) async {
    var response = client
        .from('todotable')
        .insert({'task': taskValue, 'status': statusValue}).execute();
    // ignore: avoid_print
    print(response);
  }

  readData() async {
    var response = await client
        .from('todotable')
        .select('*')
        .order('task', ascending: true)
        .execute();
    // ignore: avoid_print
    print(response);
    final datalist = response.data as List;
    return datalist;
  }

  updateData(int id, bool statusValue) async {
    var response = client
        .from('todotable')
        .update({'status': statusValue})
        .eq('id', id)
        .execute();
    // ignore: avoid_print
    print(response);
  }

  deleteData(int id) async {
    var response = client.from('todotable').delete().eq('id', id).execute();
    // ignore: avoid_print
    print(response);
  }
}
