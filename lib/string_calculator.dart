class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiterPattern = '[,\n]';

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final delimiter = parts[0].substring(2);
      delimiterPattern = RegExp.escape(delimiter);
      numbers = parts[1];
    }

    final tokens = numbers
        .split(RegExp(delimiterPattern))
        .where((e) => e.isNotEmpty);

    final negatives = tokens.where((e) => int.parse(e) < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed: ${negatives.join(",")}');
    }

    return tokens.map(int.parse).reduce((a, b) => a + b);
  }
}
