import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:smart_driver/core/utils/isar/user_isar_model.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<User?> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (User? _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}