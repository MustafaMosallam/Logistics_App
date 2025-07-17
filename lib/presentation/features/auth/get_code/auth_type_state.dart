import 'package:flutter_riverpod/flutter_riverpod.dart';

final authTypeProvider = StateProvider<AuthTypeState?>((ref) => null);

enum AuthTypeState { login, register }
