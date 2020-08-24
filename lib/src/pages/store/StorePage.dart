import 'package:flutter/material.dart';
import 'package:tarsk_app/src/mocks.dart';
import 'package:tarsk_app/src/utils/colors.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final id = ModalRoute.of(context).settings.arguments;
    final restaurant = restaurants.firstWhere((r) => r['id'] == id);

    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          restaurantAppBar(restaurant, height, width),
          productList(),
        ],
      ),
    );
  }

  productList() {
    return SliverList(
        delegate: SliverChildListDelegate(List.generate(8, (index) {
      return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    'https://dam.cocinafacil.com.mx/wp-content/uploads/2020/04/recetas-de-comida-cuarentena.jpg',
                    height: 77,
                    width: 144,
                    fit: BoxFit.fill),
              ),
            ),
            Flexible(
              child: Text(
                '1 pollo, 1 papa familiar, ensalada, cremas',
              ),
            ),
            Flexible(
              child: Text('S/55.00'),
            ),
          ],
        ),
      );
    })));
  }

  restaurantAppBar(restaurant, height, width) {
    return SliverAppBar(
      pinned: true,
      leading: BackButton(
        color: Colors.white,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
      expandedHeight: height * 0.3,
      backgroundColor: AppColors.midYellow,
      title: Text('${restaurant['title']}'),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            ClipPath(
                clipper: StoreImageClipper(),
                child: Image.network(
                  restaurant['image'],
                  fit: BoxFit.fill,
                  height: height * 0.3,
                  width: double.infinity,
                )),
            Positioned(
              bottom: 12,
              child: Container(
                height: 82,
                width: width * 0.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(31),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black,
                          spreadRadius: 1.0,
                          blurRadius: 4.0)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${restaurant['title']}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '${restaurant['summary']}',
                          style: TextStyle(fontSize: 12),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              size: 12,
                            ),
                            Text(
                              '${restaurant['deliveryTime']}  S/${restaurant['averagePrice']} por persona',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 24,
                          child: Center(
                            child: Text(
                              '${restaurant['score']}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.midGreen,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 35,
                          height: 24,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${restaurant['comments']} \n',
                                  ),
                                  TextSpan(
                                    text: 'comments',
                                  ),
                                ],
                                style: TextStyle(
                                    color: AppColors.midGreen, fontSize: 6)),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                              border: Border.all(color: AppColors.midGreen)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StoreImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.5);

    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height);
    path.quadraticBezierTo(
        size.width * 0.75, size.height, size.width, size.height * 0.5);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
