
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Feed(),
));

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final fotos = [
    'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=600',
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=600',
    'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?w=600',
  ];

  final curtidas = [0, 0, 0];
  final gostei = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Feed')),
      body: ListView.builder(
        itemCount: fotos.length,
        itemBuilder: (context, i) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('Aluno do curso'),
            ),
            Image.network(
              fotos[i],
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    gostei[i] ? Icons.favorite : Icons.favorite_border,
                    color: gostei[i] ? Colors.red : null,
                  ),
                  onPressed: () => setState(() {
                    gostei[i] = !gostei[i];
                    curtidas[i] += gostei[i] ? 1 : -1;
                  }),
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Botão comentar')),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Botão compartilhar')),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('${curtidas[i]} curtidas'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
