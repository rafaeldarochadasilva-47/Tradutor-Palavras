class Word {
  final String portuguese;
  final String english;
  final String french;

  const Word({
    required this.portuguese,
    required this.english,
    required this.french,
  });
}

final List<Word> wordsList = const [
  Word(portuguese: 'Casa', english: 'House', french: 'Maison'),
  Word(portuguese: 'Cachorro', english: 'Dog', french: 'Chien'),
  Word(portuguese: 'Livro', english: 'Book', french: 'Livre'),
  Word(portuguese: 'Água', english: 'Water', french: 'Eau'),
  Word(portuguese: 'Sol', english: 'Sun', french: 'Soleil'),
  Word(portuguese: 'Amigo', english: 'Friend', french: 'Ami'),
  Word(portuguese: 'Gato', english: 'Cat', french: 'Chat'),
  Word(portuguese: 'Música', english: 'Music', french: 'Musique'),
  Word(portuguese: 'Carro', english: 'Car', french: 'Voiture'),
  Word(portuguese: 'Comida', english: 'Food', french: 'Nourriture'),
  Word(portuguese: 'Estrela', english: 'Star', french: 'Étoile'),
  Word(portuguese: 'Maçã', english: 'Apple', french: 'Pomme'),
];
