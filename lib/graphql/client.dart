import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// Resolve endpoint for mobile/web with emulator support.
String defaultGraphQLEndpoint() {
  // Compile-time override
  const fromEnv = String.fromEnvironment('GRAPHQL_ENDPOINT');
  if (fromEnv.isNotEmpty) return fromEnv;

  // Android emulator => host machine
  if (!kIsWeb) {
    try {
      if (Platform.isAndroid) return 'http://10.0.2.2:8080/graphql';
    } catch (_) {
      // ignore platform check errors
    }
  }

  // iOS simulator / web / desktop
  return 'http://localhost:8080/graphql';
}

GraphQLClient createGraphQLClient([String? uri]) {
  final link = HttpLink(uri ?? defaultGraphQLEndpoint());
  return GraphQLClient(
    link: link,
    cache: GraphQLCache(store: InMemoryStore()),
  );
}

ValueNotifier<GraphQLClient> createClientNotifier([String? uri]) {
  return ValueNotifier(createGraphQLClient(uri));
}

