// test/network_test.dart

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:taske_bloc_converte/model/historcal_model.dart';

// Create a Mock HTTP Client
class MockClient extends Mock implements http.Client {}

void main() {
  group('fetchExchangeRates', () {
    test('returns a map of exchange rates if the http call completes successfully', () async {
      // Arrange
      final client = MockClient();
      final repository = ExchangeRateRepository(client);

      // Set up mock response
      when(client.get(any)).thenAnswer(
            (_) async => http.Response(
          json.encode({
            'USD_JOD': {
              '2024-08-10': 0.708804,
              '2024-08-11': 0.708795,
            },
            'JOD_USD': {
              '2024-08-10': 1.410827,
              '2024-08-11': 1.410846,
            },
          }),
          200,
        ),
      );

      // Act
      final startDate = '2024-08-10';
      final endDate = '2024-08-11';
      final exchangeRates = await repository.fetchExchangeRates(
        startDate: startDate,
        endDate: endDate,
      );

      // Assert
      expect(exchangeRates, isA<Map<String, List<ExchangeRateModel>>>());
      expect(exchangeRates['USD_JOD'], hasLength(2));
      expect(exchangeRates['JOD_USD'], hasLength(2));
      expect(exchangeRates['USD_JOD']![0].date, '2024-08-10');
      expect(exchangeRates['JOD_USD']![0].rate, 1.410827);
    });

    test('throws an exception if the http call fails', () async {
      // Arrange
      final client = MockClient();
      final repository = ExchangeRateRepository(client);

      // Set up mock response to throw an exception
      when(client.get(any)).thenAnswer(
            (_) async => http.Response('Not Found', 404),
      );

      // Act & Assert
      expect(
            () async => await repository.fetchExchangeRates(
          startDate: '2024-08-10',
          endDate: '2024-08-11',
        ),
        throwsException,
      );
    });
  });
}
