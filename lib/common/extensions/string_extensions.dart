extension StringExtensions on String {
  bool get hasOnlyWhitespaces => trim().isEmpty && isNotEmpty;

  bool get isNullOrEmpty => (this ?? '').isEmpty;

  bool get isNotNullAndEmpty => this != null && trim().isNotEmpty;

  String toSpaceSeparated() =>
      replaceAllMapped(RegExp(r'.{4}'), (match) => '${match.group(0)} ');

  String capitalizeFirstLetter() => '${this[0].toUpperCase()}${substring(1)}';

  String splitLongStringForLogging() => splitMapJoin(
        RegExp('.{250}'),
        onMatch: (match) => '${match.group(0)}',
        onNonMatch: (last) => '\n$last',
      );

  String capitalizeAllWords() {
    return split(' ').map((word) {
      final String leftText =
          (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText.toLowerCase();
    }).join(' ');
  }

  bool get isNumeric => this != null && double.tryParse(this) != null;
}
