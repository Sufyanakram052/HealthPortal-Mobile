extension StringExtensions on String? {
  String capitalizeFirstLetters() {
    if (this == null || this!.isEmpty) return '';
    return this!.split(' ').map((word) {
      if (word.isEmpty) return word; // Handle extra spaces
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
