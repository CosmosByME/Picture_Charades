import 'package:flutter/material.dart';

class Level {
  final Image firstImage;
  final Image secondImage;
  final int firstWord;
  final int secondWord;
  final String answer;
  final String hint;
  final List<String> options;
  final int hintForFirstWord;
  final int hintForSecondWord;

  const Level({
    required this.firstImage,
    required this.secondImage,
    required this.firstWord,
    required this.secondWord,
    required this.answer,
    required this.hint,
    required this.options,
    required this.hintForFirstWord,
    required this.hintForSecondWord,
  });
}

List<Level> levels = [
  Level(
    firstImage: Image.asset('assets/images/monday.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/keyhole.png', fit: BoxFit.cover),
    firstWord: 6,
    secondWord: 7,
    answer: 'MONKEY',
    hint: 'A playful animal',
    options: ['M', 'O', 'N', 'K', 'E', 'Y', 'A', 'L'],
    hintForFirstWord: 3, // MON
    hintForSecondWord: 3, // KEY
  ),
  Level(
    firstImage: Image.asset('assets/images/carpet.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/enter.png', fit: BoxFit.cover),
    firstWord: 6,
    secondWord: 5,
    answer: 'CARPENTER',
    hint: 'A person who works with wood',
    options: ['C', 'A', 'R', 'P', 'E', 'N', 'T', 'E', 'R', 'L'],
    hintForFirstWord: 4, // CARP
    hintForSecondWord: 5, // ENTER
  ),
  Level(
    firstImage: Image.asset('assets/images/sunset.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/flow.png', fit: BoxFit.cover),
    firstWord: 6,
    secondWord: 4,
    answer: 'SUNFLOW',
    hint: 'Poetic reference to a sunflower',
    options: ['S', 'U', 'N', 'F', 'L', 'O', 'W', 'E', 'R'],
    hintForFirstWord: 3, // SUN
    hintForSecondWord: 4, // FLOW
  ),

  Level(
    firstImage: Image.asset('assets/images/notebook.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/ice.png', fit: BoxFit.cover),
    firstWord: 8,
    secondWord: 3,
    answer: 'NOTICE',
    hint: 'Pay attention to something',
    options: ['N', 'O', 'T', 'I', 'C', 'E', 'A', 'R'],
    hintForFirstWord: 3, // NOT
    hintForSecondWord: 3, // ICE
  ),
  Level(
    firstImage: Image.asset('assets/images/classroom.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/mate.png', fit: BoxFit.cover),
    firstWord: 9,
    secondWord: 4,
    answer: 'CLASSMATE',
    hint: 'A person you study with',
    options: ['C', 'L', 'A', 'S', 'S', 'M', 'A', 'T', 'E', 'R'],
    hintForFirstWord: 5, // CLASS
    hintForSecondWord: 4, // MATE
  ),
  Level(
    firstImage: Image.asset('assets/images/forecast.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/arm.png', fit: BoxFit.cover),
    firstWord: 8,
    secondWord: 3,
    answer: 'FOREARM',
    hint: 'The part of the arm below the elbow',
    options: ['F', 'O', 'R', 'E', 'A', 'R', 'M', 'L'],
    hintForFirstWord: 4, // FORE
    hintForSecondWord: 3, // ARM
  ),
  Level(
    firstImage: Image.asset('assets/images/headphone.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/ache.png', fit: BoxFit.cover),
    firstWord: 9,
    secondWord: 4,
    answer: 'HEADACHE',
    hint: 'Pain in the head',
    options: ['H', 'E', 'A', 'D', 'A', 'C', 'H', 'E', 'L'],
    hintForFirstWord: 4, // HEAD
    hintForSecondWord: 4, // ACHE
  ),
  Level(
    firstImage: Image.asset('assets/images/keyboard.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/ring.png', fit: BoxFit.cover),
    firstWord: 8,
    secondWord: 4,
    answer: 'KEYRING',
    hint: 'A ring that holds keys',
    options: ['K', 'E', 'Y', 'R', 'I', 'N', 'G', 'L'],
    hintForFirstWord: 3, // KEY
    hintForSecondWord: 4, // RING
  ),
  Level(
    firstImage: Image.asset('assets/images/starship.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/fish.png', fit: BoxFit.cover),
    firstWord: 8,
    secondWord: 4,
    answer: 'STARFISH',
    hint: 'A sea creature with arms',
    options: ['S', 'T', 'A', 'R', 'F', 'I', 'S', 'H', 'L'],
    hintForFirstWord: 4, // STAR
    hintForSecondWord: 4, // FISH
  ),
  Level(
    firstImage: Image.asset('assets/images/cupboard.png', fit: BoxFit.cover),
    secondImage: Image.asset('assets/images/cake.png', fit: BoxFit.cover),
    firstWord: 8,
    secondWord: 4,
    answer: 'CUPCAKE',
    hint: 'A small sweet dessert',
    options: ['C', 'U', 'P', 'C', 'A', 'K', 'E', 'R'],
    hintForFirstWord: 3, // CUP
    hintForSecondWord: 4, // CAKE
  ),
];
