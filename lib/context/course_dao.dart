class CourseDao {
  static const String tableSql =
      'CREATE TABLE $_tablename($_name TEXT, $_classTime TEXT, $_professor TEXT, $_period Integer, )';

  const String _tablename = "courseTable";
  const String _name = "name";
  const String _classTime = "classTime";
  const String _professor = "professor";
  const String _period = "period";
}
