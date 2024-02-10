import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Models/CoinDTO.dart';
import '../Models/SwapTransactionDTO.dart';
import '../main.dart';

class Service {
  // get all swap transactions
  Future getswaptransactions() async {
    final response = await supabase.from('swaptransactions').select();
    return swapTransactionDtoFromJson(response as String);
  }

  // get specific swap transaction
  Future getswaptransaction(String id) async {
    final response = await supabase.from('swaptransactions').select().eq(id, 1);
    return response;
  }

  Future getCoinData(
    String coin,
  ) async {
    // final url = Uri.parse('https://api.coingecko.com/api/v3/coins/$coin');
    final url = Uri.parse(
      // 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=$coin',

      'https://api.mobula.io/api/1/market/data?asset=$coin',
    );

    final response = await http.get(url,
        headers: {'Authorization': 'b339f08e-a32d-4ddb-9163-d04f4aae5c00'});
    if (response.statusCode == 200) {
      // final data = json.decode(response.body);

      // print(data);
      return coinDtoFromJson(response.body);
    }
    print(response.body);
    // else {
    //   throw Exception('Failed to load price');
    // }
  }

  Future<String> signInEmailAndPassword(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final userId = response.user?.id;
    // if (userId == null) {
    //   throw UnimplementedError();
    // }

    return userId ?? '';
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    return;
  }
}
