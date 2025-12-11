import 'package:graphql_flutter/graphql_flutter.dart';

import '../graphql/operations.graphql.dart';
import '../graphql/schema.graphql.dart';

/// Data layer for course-related GraphQL operations.
class CourseService {
  CourseService(this._client);

  final GraphQLClient _client;

  Future<List<Query$GetCourses$courses>> fetchCourses() async {
    final result = await _client.query(
      QueryOptions(
        document: documentNodeQueryGetCourses,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    if (result.hasException) throw result.exception!;
    final data = result.data;
    if (data == null) return [];
    return Query$GetCourses.fromJson(data).courses;
  }

  Future<void> createCourse(Input$CreateCourseInput input) async {
    final result = await _client.mutate(
      MutationOptions(
        document: documentNodeMutationCreateCourse,
        variables: {'input': input.toJson()},
      ),
    );
    if (result.hasException) throw result.exception!;
  }

  Future<void> updateCourse(int id, Input$UpdateCourseInput input) async {
    final result = await _client.mutate(
      MutationOptions(
        document: documentNodeMutationUpdateCourse,
        variables: {'id': id, 'input': input.toJson()},
      ),
    );
    if (result.hasException) throw result.exception!;
  }

  Future<void> deleteCourse(int id) async {
    final result = await _client.mutate(
      MutationOptions(
        document: documentNodeMutationDeleteCourse,
        variables: {'id': id},
      ),
    );
    if (result.hasException) throw result.exception!;
  }
}


