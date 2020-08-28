class Event {
  final String imagePath,
      title,
      description,
      location,
      duration,
      punchLine1,
      punchLine2;
  final List categoryIds, galleryImages;

  Event(
      {this.imagePath,
      this.title,
      this.description,
      this.location,
      this.duration,
      this.punchLine1,
      this.punchLine2,
      this.categoryIds,
      this.galleryImages});
}

final fiveKmRunEvent = Event(
    imagePath: "assets/images/5_km_downtown_run.jpeg",
    title: "5 Kilometer Run",
    description: " Run as much as you can ..",
    location: "Park Nabeul",
    duration: "17 Septembre 2020",
    punchLine1: "Marathon!",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    categoryIds: [0, 1]);

final musicConcert = Event(
    imagePath: "assets/images/music_concert.jpeg",
    title: " Music Concert",
    description: "Listen to latest compositions.",
    location: "Ecole Ise",
    duration: "10 Octobre",
    punchLine1: "Music Lovers!",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    categoryIds: [0, 1]);

final golfCompetition = Event(
    imagePath: "assets/images/golf_competition.jpeg",
    title: "Season 2 Golf ",
    description: "Let's play Golf",
    location: "Golf Hammamet",
    duration: "29 Aout 2020",
    punchLine1: "Golf!",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    categoryIds: [0, 2]);

final events = [
  fiveKmRunEvent,
  musicConcert,
  golfCompetition,
];
