import 'package:flutter/material.dart';
import 'package:tradutor_palavras/word.dart';

void main() {
  runApp(const WordTranslatorApp());
}

class WordTranslatorApp extends StatelessWidget {
  const WordTranslatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tradutor de Palavras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C5CE7),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const TranslatorScreen(),
    );
  }
}

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  int _currentIndex = 0;
  bool _showTranslation = false;

  void _nextWord() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % wordsList.length;
      _showTranslation = false;
    });
  }

  void _previousWord() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + wordsList.length) % wordsList.length;
      _showTranslation = false;
    });
  }

  void _toggleTranslation() {
    setState(() {
      _showTranslation = !_showTranslation;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWord = wordsList[_currentIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E1E2E),
              Color(0xFF2D2B55),
              Color(0xFF13111C),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cabeçalho e Contador
                Column(
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.translate_rounded,
                          color: Color(0xFFA29BFE),
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Tradutor de Palavras',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF1F2F6),
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Palavra ${_currentIndex + 1} de ${wordsList.length}',
                        style: const TextStyle(
                          color: Color(0xFFA29BFE),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                // Card Principal da Palavra
                Card(
                  elevation: 10,
                  shadowColor: const Color(0x4D6C5CE7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: const Color(0xFF26243A),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tag Língua Principal
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0x406C5CE7),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF8C7AE6),
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('🇧🇷', style: TextStyle(fontSize: 16)),
                              SizedBox(width: 8),
                              Text(
                                'PORTUGUÊS',
                                style: TextStyle(
                                  color: Color(0xFFDCDDE1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Palavra Principal
                        Text(
                          currentWord.portuguese,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 24),

                        const Divider(color: Colors.white12, height: 1),
                        const SizedBox(height: 24),

                        // Seção de Traduções
                        if (_showTranslation) ...[
                          _buildTranslationTile(
                            flag: '🇬🇧',
                            language: 'INGLÊS',
                            translation: currentWord.english,
                            color: const Color(0xFF00CEC9),
                          ),
                          const SizedBox(height: 12),
                          _buildTranslationTile(
                            flag: '🇫🇷',
                            language: 'FRANCÊS',
                            translation: currentWord.french,
                            color: const Color(0xFFFF7675),
                          ),
                        ] else ...[
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0x33000000),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: const Color(0x0DFFFFFF)),
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0x66FFFFFF),
                                  size: 28,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Pressione "Mostrar tradução" para revelar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0x73FFFFFF),
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                // Painel de Botões de Controle
                Column(
                  children: [
                    // Botão Mostrar/Esconder Tradução
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: _toggleTranslation,
                        icon: Icon(
                          _showTranslation
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          size: 22,
                        ),
                        label: Text(
                          _showTranslation ? 'Esconder tradução' : 'Mostrar tradução',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _showTranslation
                              ? const Color(0xFFE84118)
                              : const Color(0xFF6C5CE7),
                          foregroundColor: Colors.white,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Botões Anterior e Próxima
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: OutlinedButton.icon(
                              onPressed: _previousWord,
                              icon: const Icon(Icons.arrow_back_rounded, size: 20),
                              label: const Text(
                                'Anterior',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Color(0x40FFFFFF),
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: OutlinedButton.icon(
                              onPressed: _nextWord,
                              icon: const Text(
                                'Próxima',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              label: const Icon(Icons.arrow_forward_rounded, size: 20),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Color(0x40FFFFFF),
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTranslationTile({
    required String flag,
    required String language,
    required String translation,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withAlpha(100),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Text(flag, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 12),
          Text(
            '$language:',
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              translation,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
