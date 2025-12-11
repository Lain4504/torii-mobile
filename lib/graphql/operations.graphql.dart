import 'package:gql/ast.dart';
import 'schema.graphql.dart';

class Query$GetCourses {
  Query$GetCourses({required this.courses, this.$__typename = 'Query'});

  factory Query$GetCourses.fromJson(Map<String, dynamic> json) {
    final l$courses = json['courses'];
    final l$$__typename = json['__typename'];
    return Query$GetCourses(
      courses: (l$courses as List<dynamic>)
          .map(
            (e) =>
                Query$GetCourses$courses.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetCourses$courses> courses;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$courses = courses;
    _resultData['courses'] = l$courses.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$courses = courses;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$courses.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCourses || runtimeType != other.runtimeType) {
      return false;
    }
    final l$courses = courses;
    final lOther$courses = other.courses;
    if (l$courses.length != lOther$courses.length) {
      return false;
    }
    for (int i = 0; i < l$courses.length; i++) {
      final l$courses$entry = l$courses[i];
      final lOther$courses$entry = lOther$courses[i];
      if (l$courses$entry != lOther$courses$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetCourses on Query$GetCourses {
  CopyWith$Query$GetCourses<Query$GetCourses> get copyWith =>
      CopyWith$Query$GetCourses(this, (i) => i);
}

abstract class CopyWith$Query$GetCourses<TRes> {
  factory CopyWith$Query$GetCourses(
    Query$GetCourses instance,
    TRes Function(Query$GetCourses) then,
  ) = _CopyWithImpl$Query$GetCourses;

  factory CopyWith$Query$GetCourses.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCourses;

  TRes call({List<Query$GetCourses$courses>? courses, String? $__typename});
  TRes courses(
    Iterable<Query$GetCourses$courses> Function(
      Iterable<CopyWith$Query$GetCourses$courses<Query$GetCourses$courses>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetCourses<TRes>
    implements CopyWith$Query$GetCourses<TRes> {
  _CopyWithImpl$Query$GetCourses(this._instance, this._then);

  final Query$GetCourses _instance;

  final TRes Function(Query$GetCourses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? courses = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetCourses(
          courses: courses == _undefined || courses == null
              ? _instance.courses
              : (courses as List<Query$GetCourses$courses>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes courses(
    Iterable<Query$GetCourses$courses> Function(
      Iterable<CopyWith$Query$GetCourses$courses<Query$GetCourses$courses>>,
    )
    _fn,
  ) => call(
    courses: _fn(
      _instance.courses.map(
        (e) => CopyWith$Query$GetCourses$courses(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GetCourses<TRes>
    implements CopyWith$Query$GetCourses<TRes> {
  _CopyWithStubImpl$Query$GetCourses(this._res);

  TRes _res;

  call({List<Query$GetCourses$courses>? courses, String? $__typename}) => _res;

  courses(_fn) => _res;
}

const documentNodeQueryGetCourses = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCourses'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'courses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'price'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'published'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'createdAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'updatedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);

class Query$GetCourses$courses {
  Query$GetCourses$courses({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Course',
  });

  factory Query$GetCourses$courses.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$published = json['published'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetCourses$courses(
      id: (l$id as int),
      title: (l$title as String),
      description: (l$description as String?),
      price: (l$price as num).toDouble(),
      published: (l$published as bool),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String title;

  final String? description;

  final double price;

  final bool published;

  final String createdAt;

  final String updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$published = published;
    _resultData['published'] = l$published;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$price = price;
    final l$published = published;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$price,
      l$published,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCourses$courses ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$published = published;
    final lOther$published = other.published;
    if (l$published != lOther$published) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetCourses$courses
    on Query$GetCourses$courses {
  CopyWith$Query$GetCourses$courses<Query$GetCourses$courses> get copyWith =>
      CopyWith$Query$GetCourses$courses(this, (i) => i);
}

abstract class CopyWith$Query$GetCourses$courses<TRes> {
  factory CopyWith$Query$GetCourses$courses(
    Query$GetCourses$courses instance,
    TRes Function(Query$GetCourses$courses) then,
  ) = _CopyWithImpl$Query$GetCourses$courses;

  factory CopyWith$Query$GetCourses$courses.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCourses$courses;

  TRes call({
    int? id,
    String? title,
    String? description,
    double? price,
    bool? published,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCourses$courses<TRes>
    implements CopyWith$Query$GetCourses$courses<TRes> {
  _CopyWithImpl$Query$GetCourses$courses(this._instance, this._then);

  final Query$GetCourses$courses _instance;

  final TRes Function(Query$GetCourses$courses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? published = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCourses$courses(
      id: id == _undefined || id == null ? _instance.id : (id as int),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as double),
      published: published == _undefined || published == null
          ? _instance.published
          : (published as bool),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as String),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetCourses$courses<TRes>
    implements CopyWith$Query$GetCourses$courses<TRes> {
  _CopyWithStubImpl$Query$GetCourses$courses(this._res);

  TRes _res;

  call({
    int? id,
    String? title,
    String? description,
    double? price,
    bool? published,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$CreateCourse {
  factory Variables$Mutation$CreateCourse({
    required Input$CreateCourseInput input,
  }) => Variables$Mutation$CreateCourse._({r'input': input});

  Variables$Mutation$CreateCourse._(this._$data);

  factory Variables$Mutation$CreateCourse.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateCourseInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateCourse._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateCourseInput get input =>
      (_$data['input'] as Input$CreateCourseInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateCourse<Variables$Mutation$CreateCourse>
  get copyWith => CopyWith$Variables$Mutation$CreateCourse(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateCourse ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateCourse<TRes> {
  factory CopyWith$Variables$Mutation$CreateCourse(
    Variables$Mutation$CreateCourse instance,
    TRes Function(Variables$Mutation$CreateCourse) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateCourse;

  factory CopyWith$Variables$Mutation$CreateCourse.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateCourse;

  TRes call({Input$CreateCourseInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateCourse<TRes>
    implements CopyWith$Variables$Mutation$CreateCourse<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateCourse(this._instance, this._then);

  final Variables$Mutation$CreateCourse _instance;

  final TRes Function(Variables$Mutation$CreateCourse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateCourse._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreateCourseInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateCourse<TRes>
    implements CopyWith$Variables$Mutation$CreateCourse<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateCourse(this._res);

  TRes _res;

  call({Input$CreateCourseInput? input}) => _res;
}

class Mutation$CreateCourse {
  Mutation$CreateCourse({
    required this.createCourse,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateCourse.fromJson(Map<String, dynamic> json) {
    final l$createCourse = json['createCourse'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCourse(
      createCourse: Mutation$CreateCourse$createCourse.fromJson(
        (l$createCourse as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateCourse$createCourse createCourse;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createCourse = createCourse;
    _resultData['createCourse'] = l$createCourse.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createCourse = createCourse;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createCourse, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCourse || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createCourse = createCourse;
    final lOther$createCourse = other.createCourse;
    if (l$createCourse != lOther$createCourse) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateCourse on Mutation$CreateCourse {
  CopyWith$Mutation$CreateCourse<Mutation$CreateCourse> get copyWith =>
      CopyWith$Mutation$CreateCourse(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateCourse<TRes> {
  factory CopyWith$Mutation$CreateCourse(
    Mutation$CreateCourse instance,
    TRes Function(Mutation$CreateCourse) then,
  ) = _CopyWithImpl$Mutation$CreateCourse;

  factory CopyWith$Mutation$CreateCourse.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCourse;

  TRes call({
    Mutation$CreateCourse$createCourse? createCourse,
    String? $__typename,
  });
  CopyWith$Mutation$CreateCourse$createCourse<TRes> get createCourse;
}

class _CopyWithImpl$Mutation$CreateCourse<TRes>
    implements CopyWith$Mutation$CreateCourse<TRes> {
  _CopyWithImpl$Mutation$CreateCourse(this._instance, this._then);

  final Mutation$CreateCourse _instance;

  final TRes Function(Mutation$CreateCourse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createCourse = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateCourse(
      createCourse: createCourse == _undefined || createCourse == null
          ? _instance.createCourse
          : (createCourse as Mutation$CreateCourse$createCourse),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateCourse$createCourse<TRes> get createCourse {
    final local$createCourse = _instance.createCourse;
    return CopyWith$Mutation$CreateCourse$createCourse(
      local$createCourse,
      (e) => call(createCourse: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateCourse<TRes>
    implements CopyWith$Mutation$CreateCourse<TRes> {
  _CopyWithStubImpl$Mutation$CreateCourse(this._res);

  TRes _res;

  call({
    Mutation$CreateCourse$createCourse? createCourse,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateCourse$createCourse<TRes> get createCourse =>
      CopyWith$Mutation$CreateCourse$createCourse.stub(_res);
}

const documentNodeMutationCreateCourse = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateCourse'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateCourseInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'createCourse'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'price'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'published'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'createdAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'updatedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);

class Mutation$CreateCourse$createCourse {
  Mutation$CreateCourse$createCourse({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Course',
  });

  factory Mutation$CreateCourse$createCourse.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$published = json['published'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCourse$createCourse(
      id: (l$id as int),
      title: (l$title as String),
      description: (l$description as String?),
      price: (l$price as num).toDouble(),
      published: (l$published as bool),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String title;

  final String? description;

  final double price;

  final bool published;

  final String createdAt;

  final String updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$published = published;
    _resultData['published'] = l$published;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$price = price;
    final l$published = published;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$price,
      l$published,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCourse$createCourse ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$published = published;
    final lOther$published = other.published;
    if (l$published != lOther$published) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateCourse$createCourse
    on Mutation$CreateCourse$createCourse {
  CopyWith$Mutation$CreateCourse$createCourse<
    Mutation$CreateCourse$createCourse
  >
  get copyWith => CopyWith$Mutation$CreateCourse$createCourse(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateCourse$createCourse<TRes> {
  factory CopyWith$Mutation$CreateCourse$createCourse(
    Mutation$CreateCourse$createCourse instance,
    TRes Function(Mutation$CreateCourse$createCourse) then,
  ) = _CopyWithImpl$Mutation$CreateCourse$createCourse;

  factory CopyWith$Mutation$CreateCourse$createCourse.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCourse$createCourse;

  TRes call({
    int? id,
    String? title,
    String? description,
    double? price,
    bool? published,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateCourse$createCourse<TRes>
    implements CopyWith$Mutation$CreateCourse$createCourse<TRes> {
  _CopyWithImpl$Mutation$CreateCourse$createCourse(this._instance, this._then);

  final Mutation$CreateCourse$createCourse _instance;

  final TRes Function(Mutation$CreateCourse$createCourse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? published = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateCourse$createCourse(
      id: id == _undefined || id == null ? _instance.id : (id as int),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as double),
      published: published == _undefined || published == null
          ? _instance.published
          : (published as bool),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as String),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateCourse$createCourse<TRes>
    implements CopyWith$Mutation$CreateCourse$createCourse<TRes> {
  _CopyWithStubImpl$Mutation$CreateCourse$createCourse(this._res);

  TRes _res;

  call({
    int? id,
    String? title,
    String? description,
    double? price,
    bool? published,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$UpdateCourse {
  factory Variables$Mutation$UpdateCourse({
    required int id,
    required Input$UpdateCourseInput input,
  }) => Variables$Mutation$UpdateCourse._({r'id': id, r'input': input});

  Variables$Mutation$UpdateCourse._(this._$data);

  factory Variables$Mutation$UpdateCourse.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$input = data['input'];
    result$data['input'] = Input$UpdateCourseInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateCourse._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);

  Input$UpdateCourseInput get input =>
      (_$data['input'] as Input$UpdateCourseInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateCourse<Variables$Mutation$UpdateCourse>
  get copyWith => CopyWith$Variables$Mutation$UpdateCourse(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateCourse ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$input = input;
    return Object.hashAll([l$id, l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateCourse<TRes> {
  factory CopyWith$Variables$Mutation$UpdateCourse(
    Variables$Mutation$UpdateCourse instance,
    TRes Function(Variables$Mutation$UpdateCourse) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateCourse;

  factory CopyWith$Variables$Mutation$UpdateCourse.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateCourse;

  TRes call({int? id, Input$UpdateCourseInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateCourse<TRes>
    implements CopyWith$Variables$Mutation$UpdateCourse<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateCourse(this._instance, this._then);

  final Variables$Mutation$UpdateCourse _instance;

  final TRes Function(Variables$Mutation$UpdateCourse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateCourse._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as int),
      if (input != _undefined && input != null)
        'input': (input as Input$UpdateCourseInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateCourse<TRes>
    implements CopyWith$Variables$Mutation$UpdateCourse<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateCourse(this._res);

  TRes _res;

  call({int? id, Input$UpdateCourseInput? input}) => _res;
}

class Mutation$UpdateCourse {
  Mutation$UpdateCourse({
    required this.updateCourse,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateCourse.fromJson(Map<String, dynamic> json) {
    final l$updateCourse = json['updateCourse'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateCourse(
      updateCourse: Mutation$UpdateCourse$updateCourse.fromJson(
        (l$updateCourse as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateCourse$updateCourse updateCourse;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateCourse = updateCourse;
    _resultData['updateCourse'] = l$updateCourse.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateCourse = updateCourse;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateCourse, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateCourse || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateCourse = updateCourse;
    final lOther$updateCourse = other.updateCourse;
    if (l$updateCourse != lOther$updateCourse) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateCourse on Mutation$UpdateCourse {
  CopyWith$Mutation$UpdateCourse<Mutation$UpdateCourse> get copyWith =>
      CopyWith$Mutation$UpdateCourse(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateCourse<TRes> {
  factory CopyWith$Mutation$UpdateCourse(
    Mutation$UpdateCourse instance,
    TRes Function(Mutation$UpdateCourse) then,
  ) = _CopyWithImpl$Mutation$UpdateCourse;

  factory CopyWith$Mutation$UpdateCourse.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateCourse;

  TRes call({
    Mutation$UpdateCourse$updateCourse? updateCourse,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateCourse$updateCourse<TRes> get updateCourse;
}

class _CopyWithImpl$Mutation$UpdateCourse<TRes>
    implements CopyWith$Mutation$UpdateCourse<TRes> {
  _CopyWithImpl$Mutation$UpdateCourse(this._instance, this._then);

  final Mutation$UpdateCourse _instance;

  final TRes Function(Mutation$UpdateCourse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateCourse = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateCourse(
      updateCourse: updateCourse == _undefined || updateCourse == null
          ? _instance.updateCourse
          : (updateCourse as Mutation$UpdateCourse$updateCourse),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateCourse$updateCourse<TRes> get updateCourse {
    final local$updateCourse = _instance.updateCourse;
    return CopyWith$Mutation$UpdateCourse$updateCourse(
      local$updateCourse,
      (e) => call(updateCourse: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateCourse<TRes>
    implements CopyWith$Mutation$UpdateCourse<TRes> {
  _CopyWithStubImpl$Mutation$UpdateCourse(this._res);

  TRes _res;

  call({
    Mutation$UpdateCourse$updateCourse? updateCourse,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateCourse$updateCourse<TRes> get updateCourse =>
      CopyWith$Mutation$UpdateCourse$updateCourse.stub(_res);
}

const documentNodeMutationUpdateCourse = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateCourse'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'UpdateCourseInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateCourse'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'price'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'published'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'createdAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'updatedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);

class Mutation$UpdateCourse$updateCourse {
  Mutation$UpdateCourse$updateCourse({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Course',
  });

  factory Mutation$UpdateCourse$updateCourse.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$published = json['published'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateCourse$updateCourse(
      id: (l$id as int),
      title: (l$title as String),
      description: (l$description as String?),
      price: (l$price as num).toDouble(),
      published: (l$published as bool),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String title;

  final String? description;

  final double price;

  final bool published;

  final String createdAt;

  final String updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$published = published;
    _resultData['published'] = l$published;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$price = price;
    final l$published = published;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$price,
      l$published,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateCourse$updateCourse ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$published = published;
    final lOther$published = other.published;
    if (l$published != lOther$published) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateCourse$updateCourse
    on Mutation$UpdateCourse$updateCourse {
  CopyWith$Mutation$UpdateCourse$updateCourse<
    Mutation$UpdateCourse$updateCourse
  >
  get copyWith => CopyWith$Mutation$UpdateCourse$updateCourse(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateCourse$updateCourse<TRes> {
  factory CopyWith$Mutation$UpdateCourse$updateCourse(
    Mutation$UpdateCourse$updateCourse instance,
    TRes Function(Mutation$UpdateCourse$updateCourse) then,
  ) = _CopyWithImpl$Mutation$UpdateCourse$updateCourse;

  factory CopyWith$Mutation$UpdateCourse$updateCourse.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateCourse$updateCourse;

  TRes call({
    int? id,
    String? title,
    String? description,
    double? price,
    bool? published,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateCourse$updateCourse<TRes>
    implements CopyWith$Mutation$UpdateCourse$updateCourse<TRes> {
  _CopyWithImpl$Mutation$UpdateCourse$updateCourse(this._instance, this._then);

  final Mutation$UpdateCourse$updateCourse _instance;

  final TRes Function(Mutation$UpdateCourse$updateCourse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? published = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateCourse$updateCourse(
      id: id == _undefined || id == null ? _instance.id : (id as int),
      title: title == _undefined || title == null
          ? _instance.title
          : (title as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as double),
      published: published == _undefined || published == null
          ? _instance.published
          : (published as bool),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as String),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateCourse$updateCourse<TRes>
    implements CopyWith$Mutation$UpdateCourse$updateCourse<TRes> {
  _CopyWithStubImpl$Mutation$UpdateCourse$updateCourse(this._res);

  TRes _res;

  call({
    int? id,
    String? title,
    String? description,
    double? price,
    bool? published,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$DeleteCourse {
  factory Variables$Mutation$DeleteCourse({required int id}) =>
      Variables$Mutation$DeleteCourse._({r'id': id});

  Variables$Mutation$DeleteCourse._(this._$data);

  factory Variables$Mutation$DeleteCourse.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$DeleteCourse._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteCourse<Variables$Mutation$DeleteCourse>
  get copyWith => CopyWith$Variables$Mutation$DeleteCourse(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteCourse ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteCourse<TRes> {
  factory CopyWith$Variables$Mutation$DeleteCourse(
    Variables$Mutation$DeleteCourse instance,
    TRes Function(Variables$Mutation$DeleteCourse) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteCourse;

  factory CopyWith$Variables$Mutation$DeleteCourse.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteCourse;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$DeleteCourse<TRes>
    implements CopyWith$Variables$Mutation$DeleteCourse<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteCourse(this._instance, this._then);

  final Variables$Mutation$DeleteCourse _instance;

  final TRes Function(Variables$Mutation$DeleteCourse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$DeleteCourse._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as int),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteCourse<TRes>
    implements CopyWith$Variables$Mutation$DeleteCourse<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteCourse(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$DeleteCourse {
  Mutation$DeleteCourse({
    required this.deleteCourse,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteCourse.fromJson(Map<String, dynamic> json) {
    final l$deleteCourse = json['deleteCourse'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteCourse(
      deleteCourse: (l$deleteCourse as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool deleteCourse;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteCourse = deleteCourse;
    _resultData['deleteCourse'] = l$deleteCourse;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteCourse = deleteCourse;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteCourse, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteCourse || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteCourse = deleteCourse;
    final lOther$deleteCourse = other.deleteCourse;
    if (l$deleteCourse != lOther$deleteCourse) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeleteCourse on Mutation$DeleteCourse {
  CopyWith$Mutation$DeleteCourse<Mutation$DeleteCourse> get copyWith =>
      CopyWith$Mutation$DeleteCourse(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteCourse<TRes> {
  factory CopyWith$Mutation$DeleteCourse(
    Mutation$DeleteCourse instance,
    TRes Function(Mutation$DeleteCourse) then,
  ) = _CopyWithImpl$Mutation$DeleteCourse;

  factory CopyWith$Mutation$DeleteCourse.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteCourse;

  TRes call({bool? deleteCourse, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteCourse<TRes>
    implements CopyWith$Mutation$DeleteCourse<TRes> {
  _CopyWithImpl$Mutation$DeleteCourse(this._instance, this._then);

  final Mutation$DeleteCourse _instance;

  final TRes Function(Mutation$DeleteCourse) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteCourse = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteCourse(
      deleteCourse: deleteCourse == _undefined || deleteCourse == null
          ? _instance.deleteCourse
          : (deleteCourse as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DeleteCourse<TRes>
    implements CopyWith$Mutation$DeleteCourse<TRes> {
  _CopyWithStubImpl$Mutation$DeleteCourse(this._res);

  TRes _res;

  call({bool? deleteCourse, String? $__typename}) => _res;
}

const documentNodeMutationDeleteCourse = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteCourse'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteCourse'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
