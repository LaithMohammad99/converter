import 'package:flutter_test/flutter_test.dart';
import 'package:taske_bloc_converte/utils/date.dart';


void main() {
  group('DateUtils', () {
    test('formatDate returns date in yyyy-MM-dd format', () {
      // Arrange
      final DateTime date = DateTime(2024, 8, 18);
      const String expectedDateString = '2024-08-18';

      // Act
      final String formattedDate = DateFunctions.formatDate(date);

      // Assert
      expect(formattedDate, expectedDateString);
    });
  });
}
