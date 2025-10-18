// ...existing code...
import 'package:flutter/material.dart';

/// Widget que representa una burbuja de mensaje "de ella".
/// Se compone de un contenedor con texto y una burbuja de imagen debajo.
class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el esquema de colores actual del Theme para usar colores coherentes
    final colors = Theme.of(context).colorScheme;
    
    return Column(
      // Alinea los hijos al inicio (izquierda) en el eje horizontal
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Burbuja que contiene el texto del mensaje
        Container(
          decoration:  BoxDecoration(
            // Usa el color secundario del tema para la burbuja
            color: colors.secondary,
            // Bordes redondeados para dar aspecto de "bubble"
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            // Espaciado interior horizontal y vertical del texto
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical:10),
            // Texto del mensaje. Aquí está duro ("Hola mundo"), normalmente vendría de datos.
            child: Text(
              'Hola mundo',
              // Color de texto blanco para contraste con el fondo oscuro de la burbuja
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        // Pequeño espacio entre la burbuja de texto y la imagen
        SizedBox(height: 5),

        _ImageBubble(),

        SizedBox(height: 10),
        //Todo: imagen

      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/no/8-5e08abbe5aacd2cf531948145b787e9a.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;

          return Container(
            width: size.width* 0.7,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), 
            child: Text('Mi amor esta enviando una imagen...'),
          );
        },
      ));
  }
}