import 'package:drift/drift.dart';



/// Table để lưu user profile
@DataClassName('UserProfileData')
class UserProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get email => text()();
  TextColumn get fullName => text()();
  TextColumn get avatar => text().nullable()();
  TextColumn get role => text().withDefault(const Constant('learner'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
