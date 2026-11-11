class Dhikr {
  const Dhikr({
    required this.id,
    required this.name,
    required this.arabic,
    required this.meaning,
  });

  final String id;
  final String name;
  final String arabic;
  final String meaning;
}

abstract final class DhikrCatalog {
  static const items = <Dhikr>[
    Dhikr(
      id: 'subhanallah',
      name: 'SubhanAllah',
      arabic: 'سُبْحَانَ اللَّهِ',
      meaning: 'Glory be to Allah',
    ),
    Dhikr(
      id: 'alhamdulillah',
      name: 'Alhamdulillah',
      arabic: 'الْحَمْدُ لِلَّهِ',
      meaning: 'All praise is due to Allah',
    ),
    Dhikr(
      id: 'allahuakbar',
      name: 'Allahu Akbar',
      arabic: 'اللَّهُ أَكْبَرُ',
      meaning: 'Allah is the Greatest',
    ),
    Dhikr(
      id: 'astaghfirullah',
      name: 'Astaghfirullah',
      arabic: 'أَسْتَغْفِرُ اللَّهَ',
      meaning: 'I seek Allah’s forgiveness',
    ),
  ];

  static Dhikr byId(String id) => items.firstWhere(
    (item) => item.id == id,
    orElse: () => items.first,
  );

  static bool contains(String id) => items.any((item) => item.id == id);
}
