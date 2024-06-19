import 'package:e_commerce_app/src/models/enums/categories.dart';
import 'package:e_commerce_app/src/models/sub_total.dart';
import 'package:uuid/uuid.dart';

import '../models/enums/units.dart';
import '../models/product.dart';

class ProductsRepository {
  static List<Product> get items => [
        Product(
          uuid: const Uuid().v4(),
          title: 'ARROZ PANELA GAUCHA',
          price: 25.99,
          description: 'Arroz Panela Gaucha 5kg',
          image: 'assets/images/commerce.jpg',
          category: Categories.mercearia,
          unit: Units.un,
          subTotal: SubTotal(25.99, 1),
          others: {},
          isPromotion: false,
          promotion: 0,
        ),
        Product(
          uuid: const Uuid().v4(),
          title: 'BANANA PRATA',
          price: 12.99,
          description: 'Banana Prata kg',
          image: 'assets/images/commerce.jpg',
          category: Categories.mercearia,
          unit: Units.kg,
          subTotal: SubTotal(12.99, 1),
          others: {},
          isPromotion: false,
          promotion: 50,
        ),
        Product(
          uuid: const Uuid().v4(),
          title: 'SUCO TANG 1L',
          price: .99,
          description: 'Suco Tang 1L Sabores',
          image: 'assets/images/commerce.jpg',
          category: Categories.mercearia,
          unit: Units.un,
          subTotal: SubTotal(.99, 1),
          others: {
            'data': [
              {'title': 'LARANJA', 'total': 0},
              {'title': 'LIMÃO', 'total': 0},
              {'title': 'UVA', 'total': 0},
            ],
            'total': 0,
          },
          isPromotion: false,
          promotion: 0,
        ),
        Product(
          uuid: const Uuid().v4(),
          title: 'PIZZA',
          price: 20,
          description: 'Pizza Sabores',
          image: 'assets/images/commerce.jpg',
          category: Categories.mercearia,
          unit: Units.un,
          subTotal: SubTotal(20, 1),
          others: {
            'data': [
              {'title': 'PORTUGUESA', 'total': 0},
              {'title': 'CALABRESA', 'total': 0},
              {'title': 'FRANGO', 'total': 0},
            ],
            'total': 0,
          },
          isPromotion: true,
          promotion: 20,
        ),
        Product(
          uuid: const Uuid().v4(),
          title: 'FEIJÃO CARIOCA',
          price: 14.99,
          description: 'Feijão Carioca 5Kg',
          image: 'assets/images/commerce.jpg',
          category: Categories.mercearia,
          unit: Units.un,
          subTotal: SubTotal(14.99, 1),
          others: {},
          isPromotion: false,
          promotion: 0,
        ),
        Product(
          uuid: const Uuid().v4(),
          title: 'FEIJÃO PRETO CARIOCA',
          price: 15.99,
          description: 'Feijão Preto Carioca 5Kg',
          image: 'assets/images/commerce.jpg',
          category: Categories.padaria,
          unit: Units.un,
          subTotal: SubTotal(15.99, 1),
          others: {},
          isPromotion: true,
          promotion: 50,
        ),
      ];
}
