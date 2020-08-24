import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final couponImages = [
  'https://i.pinimg.com/originals/b0/38/bc/b038bcff1a1db8883b0371dac96a6ff6.jpg',
  'https://i.pinimg.com/originals/22/a6/b3/22a6b3253a120a9d9f8d276e4cf44065.png',
  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fast-food-voucher-design-template-8a9391261d71c0180cbf5d4a19ad0637_screen.jpg?ts=1580378770',
];

final categories = [
  {
    'icon': Icon(Icons.fastfood),
    'name': 'Comida',
  },
  {
    'icon': Icon(Icons.pets),
    'name': 'Mascota',
  },
  {
    'icon': Icon(Icons.local_pharmacy),
    'name': 'Farmacia',
  },
  {
    'icon': Icon(Icons.smartphone),
    'name': 'Tecnología',
  },
  {
    'icon': FaIcon(FontAwesomeIcons.gift),
    'name': 'Regalos',
  },
];

final restaurants = [
  {
    'id': 1,
    'title': 'Pollerias pollos',
    'image':
        'https://www.comedera.com/wp-content/uploads/2018/08/pollo-frito.jpg',
    'summary': 'Pollos, parrilladas, postres...',
    'deliveryTime': '53min - 1h',
    'averagePrice': 22,
    'score': 4.4,
    'comments': 100,
  },
  {
    'id': 2,
    'title': 'Pizzeria pizzas',
    'image':
        'https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2017/04/pizzapepperoni0.jpg',
    'summary': 'Pizzas, pastas, lasagnas...',
    'deliveryTime': '53min - 1h',
    'averagePrice': 24,
    'score': 4.4,
    'comments': 100,
  },
  {
    'id': 3,
    'title': 'Heladeria helados',
    'image':
        'https://prod.media.wapa.pe/1200x630/wapa/imagen/2020/01/25/noticia-1579985517-helado-de-frutas-para-preparar-en-casa-portada.png',
    'summary': 'Helados, postres, jugos...',
    'deliveryTime': '53min - 1h',
    'averagePrice': 24,
    'score': 4.4,
    'comments': 100,
  },
  {
    'id': 3,
    'title': 'Heladeria helados',
    'image':
        'https://prod.media.wapa.pe/1200x630/wapa/imagen/2020/01/25/noticia-1579985517-helado-de-frutas-para-preparar-en-casa-portada.png',
    'summary': 'Helados, postres, jugos...',
    'deliveryTime': '53min - 1h',
    'averagePrice': 24,
    'score': 4.4,
    'comments': 100,
  },
];

final addresses = [
  {
    'isMain': true,
    'address': 'Fulgencio Valdez 748',
  },
  {
    'isMain': false,
    'address': 'Juan de Arona 305',
  },
];