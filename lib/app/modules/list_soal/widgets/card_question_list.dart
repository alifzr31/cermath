import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/data/models/quiz_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class CardQuestionList extends StatelessWidget {
  final QuizList quizList;
  const CardQuestionList({
    Key? key,
    required this.quizList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE5E5E5),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quizList.quizName,
            style: const TextStyle(
              color: baseColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                LineIcons.coins,
              ),
              const SizedBox(width: 10),
              Text(
                quizList.maxScore.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () => Get.toNamed(
                  '/soal',
                  arguments: quizList.quizId,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Text(
                    'Mulai',
                  ),
                ),
              ),
              if (quizList.difficulity == 1)
                Row(
                  children: const [
                    Icon(
                      LineIcons.starAlt,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      LineIcons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      LineIcons.star,
                      color: Colors.yellow,
                    ),
                  ],
                )
              else if (quizList.difficulity == 2)
                Row(
                  children: const [
                    Icon(
                      LineIcons.starAlt,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      LineIcons.starAlt,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      LineIcons.star,
                      color: Colors.yellow,
                    ),
                  ],
                )
              else
                Row(
                  children: const [
                    Icon(
                      LineIcons.starAlt,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      LineIcons.starAlt,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      LineIcons.starAlt,
                      color: Colors.yellow,
                    ),
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}
