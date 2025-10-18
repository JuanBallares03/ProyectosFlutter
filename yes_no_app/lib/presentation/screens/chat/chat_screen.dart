// ...existing code...
import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

/// Pantalla principal del chat.
/// Stateless porque el ejemplo no mantiene estado local (mensajes fijos).
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con avatar y nombre
      appBar: AppBar(
        // Leading: avatar con padding para separarlo del borde
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            // Imagen remota para el avatar
            backgroundImage: NetworkImage(
              'https://pics.filmaffinity.com/059687904572053-nm_200.jpg',
            ),
          ),
        ),
        // Título del AppBar
        ///Caja de texto
        title: Text('Mi amor 💖'),

        // centerTitle: true, // opción comentada para centrar el título si se desea
      ),
      // Cuerpo de la pantalla: vista del chat
      body: _ChatView(),
    );
  }
}

/// Vista que contiene la lista de mensajes y el área inferior (aquí solo texto)
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // SafeArea evita superponerse con notches / barras del sistema
      child: Padding(
        // Padding horizontal para separar el contenido de los bordes
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Expanded para que la lista ocupe todo el espacio disponible
            Expanded(
              child: ListView.builder(
                // Número de elementos (aquí fijo en 10 para ejemplo)
                itemCount: 10,
                itemBuilder: (context, index) {
                  // Alterna entre burbuja "de ella" y "mía" según índice par/impar
                  return (index % 2 == 0)
                    ? const HerMessageBubble() // mensaje entrante
                    : const MyMessageBubble(); // mensaje saliente
                },
              ),
            ),

            // Área inferior: actualmente un Text estático. Normalmente aquí iría
            // un TextField y botones para enviar mensajes.
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
// ...existing code...