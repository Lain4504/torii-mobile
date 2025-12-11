import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'data/course_service.dart';
import 'viewmodels/course_view_model.dart';
import 'views/course/course_view.dart';
import 'graphql/client.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final client = createClientNotifier();

    return GraphQLProvider(
      client: client,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CourseViewModel(
              service: CourseService(client.value),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Torii Nihongo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const CourseView(),
        ),
      ),
    );
  }
}

