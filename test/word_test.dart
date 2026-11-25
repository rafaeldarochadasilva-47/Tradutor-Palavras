import 'package:flutter_test/flutter_test.dart';
import 'package:tradutor_palavras/word.dart';

void main() {
  test('recusa palavra com tradução vazia', () {
    const incompleteWord = Word(
      portuguese: 'Teste',
      english: '',
      french: 'Test',
    );

    expect(hasCompleteTranslations(incompleteWord), isFalse);
  });

  test('aceita palavra com português e duas traduções', () {
    const completeWord = Word(
      portuguese: 'Teste',
      english: 'Test',
      french: 'Test',
    );

    expect(hasCompleteTranslations(completeWord), isTrue);
  });
}
