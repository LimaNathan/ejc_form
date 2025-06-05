import 'dart:convert';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PhotoPicker extends StatelessWidget {
  final Function(String) onPhotoSelected;
  final String? currentPhoto;

  const PhotoPicker({
    required this.onPhotoSelected,
    this.currentPhoto,
    super.key,
  });

  void pickFromGallery() {
    final input = html.FileUploadInputElement()..accept = 'image/*';
    input.click();

    input.onChange.listen((event) {
      final file = input.files?.first;
      if (file != null) {
        final reader = html.FileReader();
        reader.readAsDataUrl(file);
        reader.onLoad.listen((event) {
          onPhotoSelected(reader.result as String);
        });
      }
    });
  }

  void captureFromCamera() {
    html.VideoElement video = html.VideoElement()
      ..autoplay = true
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'cover'
      ..style.borderRadius = '20px';

    html.MediaStream? stream;

    html.window.navigator.getUserMedia(video: true).then((mediaStream) {
      stream = mediaStream;
      video.srcObject = mediaStream;

      final canvas = html.CanvasElement(width: 640, height: 480);
      final context = canvas.context2D;

      // Estilizando o botão de captura
      final takePhotoButton = html.ButtonElement()
        ..id = 'take-photo-button'
        ..style.width = '70px'
        ..style.height = '70px'
        ..style.borderRadius = '50%'
        ..style.border = '5px solid white'
        ..style.backgroundColor = 'rgba(255, 255, 255, 0.9)'
        ..style.position = 'absolute'
        ..style.bottom = '20px'
        ..style.left = '50%'
        ..style.transform = 'translateX(-50%)'
        ..style.cursor = 'pointer'
        ..style.boxShadow = '0px 0px 10px rgba(0,0,0,0.3)';

      takePhotoButton.onClick.listen((_) {
        context.drawImage(video, 0, 0);
        final dataUrl = canvas.toDataUrl('image/jpeg');
        onPhotoSelected(dataUrl);

        // Efeito rápido de flash ao capturar a foto
        final flashEffect = html.DivElement()
          ..style.position = 'fixed'
          ..style.top = '0'
          ..style.left = '0'
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.backgroundColor = 'white'
          ..style.opacity = '1'
          ..style.transition = 'opacity 0.3s ease-out';

        html.document.body?.append(flashEffect);
        Future.delayed(const Duration(milliseconds: 200), () {
          flashEffect.style.opacity = '0';
          Future.delayed(const Duration(milliseconds: 300), () {
            flashEffect.remove();
          });
        });

        stream?.getTracks().forEach((track) => track.stop());
        html.document.getElementById('camera-container')?.remove();
      });

      // Criando um botão de fechar para cancelar a captura
      final closeButton = html.ButtonElement()
        ..text = '✖'
        ..style.position = 'absolute'
        ..style.top = '20px'
        ..style.right = '20px'
        ..style.border = 'none'
        ..style.backgroundColor = 'transparent'
        ..style.color = 'white'
        ..style.fontSize = '30px'
        ..style.cursor = 'pointer';

      closeButton.onClick.listen((_) {
        stream?.getTracks().forEach((track) => track.stop());
        html.document.getElementById('camera-container')?.remove();
      });

      // Contêiner de fundo escuro para imitar a interface do iPhone
      final container = html.DivElement()
        ..id = 'camera-container'
        ..style.position = 'fixed'
        ..style.top = '0'
        ..style.left = '0'
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.backgroundColor = 'rgba(0,0,0,0.9)'
        ..style.zIndex = '9999'
        ..style.display = 'flex'
        ..style.flexDirection = 'column'
        ..style.alignItems = 'center'
        ..style.justifyContent = 'center'
        ..style.overflow = 'hidden';

      final cameraWrapper = html.DivElement()
        ..style.position = 'relative'
        ..style.width = '100%'
        ..style.maxWidth = '420px'
        ..style.height = '80vh'
        ..style.borderRadius = '20px'
        ..style.overflow = 'hidden'
        ..style.display = 'flex'
        ..style.justifyContent = 'center'
        ..style.alignItems = 'center'
        ..children.add(video);

      container.children.addAll([cameraWrapper, takePhotoButton, closeButton]);
      html.document.body?.append(container);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
            image: currentPhoto != null
                ? DecorationImage(
                    image: MemoryImage(
                        base64Decode(currentPhoto!.split(',').last)),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: currentPhoto == null
              ? Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Colors.grey[600],
                )
              : null,
        ),
        // if (MediaQuery.of(context).size.width <= 1200)
        //   ShadButton.outline(
        //     onPressed: pickFromGallery,
        //     child: const Text('Selecione a sua foto.'),
        //   ),
        // if (MediaQuery.of(context).size.width > 1200)

        ShadSelect<String>(
          placeholder: const Text('Escolha como vai inserir a foto'),
          options: const [
            ShadOption(
              value: 'camera',
              child: Text('Câmera'),
            ),
            ShadOption(
              value: 'gallery',
              child: Text('Galeria'),
            ),
          ],
          selectedOptionBuilder: (BuildContext context, String value) {
            return const Text('Escolha como vai inserir a foto');
          },
          onChanged: (value) {
            if (value == 'camera') {
              captureFromCamera();
            } else if (value == 'gallery') {
              pickFromGallery();
            }
          },
        ),
      ],
    );
  }
}
