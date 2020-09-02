class HomeMenus {
  // Home Screen menus
  // Ids are used to determine which menus to display (onclick):
  // Example: 1X (Eleve) | 2X (Parent) | 3X (Enseignant)
  final List<Map<String, Object>> student = [
    {
      'title': 'Emploi',
      'itemId': 10,
      'iconPath': 'assets/icons/calendar.png',
    },
    {
      'title': 'Lessons',
      'itemId': 11,
      'iconPath': 'assets/icons/books.png',
    },
    {
      'title': 'Notes',
      'itemId': 12,
      'iconPath': 'assets/icons/grade.png',
    },
    {
      'title': 'Evénements',
      'itemId': 13,
      'iconPath': 'assets/icons/events.png',
    },
    {
      'title': 'Résultats',
      'itemId': 14,
      'iconPath': 'assets/icons/graduation.png',
    },
    //
    // {
    //   'title': 'Lessons',
    //   'itemId': 11,
    //   'iconPath': 'assets/icons/books.png',
    // },
  ];
  final List<Map<String, Object>> parent = [
    {
      'title': 'Emploi',
      'itemId': 20,
      'iconPath': 'assets/icons/calendar.png',
    },
    {
      'title': 'Lessons',
      'itemId': 21,
      'iconPath': 'assets/icons/books.png',
    },
    {
      'title': 'Notes',
      'itemId': 22,
      'iconPath': 'assets/icons/grade.png',
    },
    {
      'title': 'Evénements',
      'itemId': 23,
      'iconPath': 'assets/icons/events.png',
    },
    {
      'title': 'Résultats',
      'itemId': 24,
      'iconPath': 'assets/icons/graduation.png',
    },
    {
      'title': 'Discipline',
      'itemId': 25,
      'iconPath': 'assets/icons/time.png',
    },
    {
      'title': 'Paiments',
      'itemId': 26,
      'iconPath': 'assets/icons/payment.png',
    },
  ];
  final List<Map<String, Object>> teacher = [
    {
      'title': 'Emploi',
      'itemId': 31,
      'iconPath': 'assets/icons/calendar.png',
    },
    {
      'title': 'Cours',
      'itemId': 32,
      'iconPath': 'assets/icons/books.png',
    },
    {
      'title': 'Exercices',
      'itemId': 33,
      'iconPath': 'assets/icons/write.png',
    },
    {
      'title': 'Liste d\'élèves',
      'itemId': 34,
      'iconPath': 'assets/icons/students.png',
    },
  ];
}
