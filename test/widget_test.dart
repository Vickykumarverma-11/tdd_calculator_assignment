import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_calculator/string_calculator.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  test('returns 0 for empty string', () {
    expect(calculator.add(""), equals(0));
  });
  test('returns number for single number', () {
    expect(calculator.add("1"), equals(1));
  });
  test('returns sum for two numbers', () {
    expect(calculator.add("1,5"), equals(6));
  });
  test('handle multiple numbers', () {
    expect(calculator.add("1,2,3,4"), equals(10));
  });
  test('handle new lines between numbers', () {
    expect(calculator.add("1\n2,3"), equals(6));
  });
  test('handle delimiter', () {
    expect(calculator.add("//;\n1;2"), equals(3));
  });
}
