import 'package:test/test.dart';
import 'package:tests/database/database.dart';

import 'suite.dart';

void customObjectTests(TestExecutor executor) {
  test('custom objects', () async {
    final db = Database(executor.createExecutor());

    var preferences = await db.settingsForQuery(1).getSingle();
    expect(preferences, isNull);

    await db.updateSettings(1, Preferences(true));
    preferences = await db.settingsForQuery(1).getSingle();

    expect(preferences.receiveEmails, true);

    await db.close();
  });
}
