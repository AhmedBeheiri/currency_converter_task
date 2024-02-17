import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';


@module
abstract class Database {
  @lazySingleton
  HiveInterface get hive => Hive;
}





