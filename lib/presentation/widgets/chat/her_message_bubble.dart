import 'package:flutter/material.dart';
import 'package:si_no_app/config/responsive/responsive_size.dart';
import 'package:si_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  
  final Message message;

  const HerMessageBubble({super.key, required this.message});


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          margin: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          )
        ),
        _ImageBubble(image: message.url!,),
        const SizedBox(height: 10,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;

  const _ImageBubble({required this.image});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image,
        width: sw(0.7, context),
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: sw(0.7, context),
            height: 150,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20
            ),
            alignment: Alignment.center,
            child: const Text('Amor está escribiendo…'),
          );
        },
      ),
    );
  }
}