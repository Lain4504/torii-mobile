class Input$CreateCourseInput {
  factory Input$CreateCourseInput({
    String? description,
    required double price,
    bool? published,
    required String title,
  }) => Input$CreateCourseInput._({
    if (description != null) r'description': description,
    r'price': price,
    if (published != null) r'published': published,
    r'title': title,
  });

  Input$CreateCourseInput._(this._$data);

  factory Input$CreateCourseInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$price = data['price'];
    result$data['price'] = (l$price as num).toDouble();
    if (data.containsKey('published')) {
      final l$published = data['published'];
      result$data['published'] = (l$published as bool?);
    }
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    return Input$CreateCourseInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get description => (_$data['description'] as String?);

  double get price => (_$data['price'] as double);

  bool? get published => (_$data['published'] as bool?);

  String get title => (_$data['title'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$price = price;
    result$data['price'] = l$price;
    if (_$data.containsKey('published')) {
      final l$published = published;
      result$data['published'] = l$published;
    }
    final l$title = title;
    result$data['title'] = l$title;
    return result$data;
  }

  CopyWith$Input$CreateCourseInput<Input$CreateCourseInput> get copyWith =>
      CopyWith$Input$CreateCourseInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateCourseInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
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
    if (_$data.containsKey('published') !=
        other._$data.containsKey('published')) {
      return false;
    }
    if (l$published != lOther$published) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$price = price;
    final l$published = published;
    final l$title = title;
    return Object.hashAll([
      _$data.containsKey('description') ? l$description : const {},
      l$price,
      _$data.containsKey('published') ? l$published : const {},
      l$title,
    ]);
  }
}

abstract class CopyWith$Input$CreateCourseInput<TRes> {
  factory CopyWith$Input$CreateCourseInput(
    Input$CreateCourseInput instance,
    TRes Function(Input$CreateCourseInput) then,
  ) = _CopyWithImpl$Input$CreateCourseInput;

  factory CopyWith$Input$CreateCourseInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateCourseInput;

  TRes call({
    String? description,
    double? price,
    bool? published,
    String? title,
  });
}

class _CopyWithImpl$Input$CreateCourseInput<TRes>
    implements CopyWith$Input$CreateCourseInput<TRes> {
  _CopyWithImpl$Input$CreateCourseInput(this._instance, this._then);

  final Input$CreateCourseInput _instance;

  final TRes Function(Input$CreateCourseInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? description = _undefined,
    Object? price = _undefined,
    Object? published = _undefined,
    Object? title = _undefined,
  }) => _then(
    Input$CreateCourseInput._({
      ..._instance._$data,
      if (description != _undefined) 'description': (description as String?),
      if (price != _undefined && price != null) 'price': (price as double),
      if (published != _undefined) 'published': (published as bool?),
      if (title != _undefined && title != null) 'title': (title as String),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateCourseInput<TRes>
    implements CopyWith$Input$CreateCourseInput<TRes> {
  _CopyWithStubImpl$Input$CreateCourseInput(this._res);

  TRes _res;

  call({String? description, double? price, bool? published, String? title}) =>
      _res;
}

class Input$UpdateCourseInput {
  factory Input$UpdateCourseInput({
    String? description,
    double? price,
    bool? published,
    String? title,
  }) => Input$UpdateCourseInput._({
    if (description != null) r'description': description,
    if (price != null) r'price': price,
    if (published != null) r'published': published,
    if (title != null) r'title': title,
  });

  Input$UpdateCourseInput._(this._$data);

  factory Input$UpdateCourseInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as num?)?.toDouble();
    }
    if (data.containsKey('published')) {
      final l$published = data['published'];
      result$data['published'] = (l$published as bool?);
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    return Input$UpdateCourseInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get description => (_$data['description'] as String?);

  double? get price => (_$data['price'] as double?);

  bool? get published => (_$data['published'] as bool?);

  String? get title => (_$data['title'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price;
    }
    if (_$data.containsKey('published')) {
      final l$published = published;
      result$data['published'] = l$published;
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    return result$data;
  }

  CopyWith$Input$UpdateCourseInput<Input$UpdateCourseInput> get copyWith =>
      CopyWith$Input$UpdateCourseInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateCourseInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != lOther$price) {
      return false;
    }
    final l$published = published;
    final lOther$published = other.published;
    if (_$data.containsKey('published') !=
        other._$data.containsKey('published')) {
      return false;
    }
    if (l$published != lOther$published) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$price = price;
    final l$published = published;
    final l$title = title;
    return Object.hashAll([
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('price') ? l$price : const {},
      _$data.containsKey('published') ? l$published : const {},
      _$data.containsKey('title') ? l$title : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateCourseInput<TRes> {
  factory CopyWith$Input$UpdateCourseInput(
    Input$UpdateCourseInput instance,
    TRes Function(Input$UpdateCourseInput) then,
  ) = _CopyWithImpl$Input$UpdateCourseInput;

  factory CopyWith$Input$UpdateCourseInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateCourseInput;

  TRes call({
    String? description,
    double? price,
    bool? published,
    String? title,
  });
}

class _CopyWithImpl$Input$UpdateCourseInput<TRes>
    implements CopyWith$Input$UpdateCourseInput<TRes> {
  _CopyWithImpl$Input$UpdateCourseInput(this._instance, this._then);

  final Input$UpdateCourseInput _instance;

  final TRes Function(Input$UpdateCourseInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? description = _undefined,
    Object? price = _undefined,
    Object? published = _undefined,
    Object? title = _undefined,
  }) => _then(
    Input$UpdateCourseInput._({
      ..._instance._$data,
      if (description != _undefined) 'description': (description as String?),
      if (price != _undefined) 'price': (price as double?),
      if (published != _undefined) 'published': (published as bool?),
      if (title != _undefined) 'title': (title as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateCourseInput<TRes>
    implements CopyWith$Input$UpdateCourseInput<TRes> {
  _CopyWithStubImpl$Input$UpdateCourseInput(this._res);

  TRes _res;

  call({String? description, double? price, bool? published, String? title}) =>
      _res;
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
