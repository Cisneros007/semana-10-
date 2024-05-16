import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class ImageItem {
  final String name;
  final String path;
  final String type;

  ImageItem({
    required this.name,
    required this.path,
    required this.type,
  });
}

class MyApp extends StatelessWidget {
  final List<ImageItem> images = [
    ImageItem(name: 'Image 1', path: 'assets/images/image1.png', type: 'PNG'),
    ImageItem(name: 'Image 2', path: 'assets/images/image2.jpg', type: 'JPEG'),
    ImageItem(name: 'Image 3', path: 'assets/images/image3.svg', type: 'SVG'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Gallery'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ImageWidget(image: images[index]);
          },
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final ImageItem image;

  const ImageWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    switch (image.type) {
      case 'PNG':
        imageWidget = Image.asset(image.path);
        break;
      case 'JPEG':
        imageWidget = Image.asset(image.path);
        break;
      case 'SVG':
        imageWidget = SvgPicture.asset(image.path);
        break;
      default:
        imageWidget = Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: imageWidget),
        SizedBox(height: 10),
        Text(
          image.name,
          style: TextStyle(
            fontFamily: _getFontFamily(image.type),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _getFontFamily(String type) {
    switch (type) {
      case 'PNG':
        return 'Arial';
      case 'JPEG':
        return 'Times New Roman';
      case 'SVG':
        return 'Roboto';
      default:
        return '';
    }
  }
}
