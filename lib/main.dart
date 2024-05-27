import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'core/utils/isar/user_isar_model.dart';
import 'internal/app.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  await Isar.open(
    [
      UserSchema,
    ],
    inspector: true,
    directory: dir.path,
  );
  runApp(ProviderScope(child: const App()));
}
