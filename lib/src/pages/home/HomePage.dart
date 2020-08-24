import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tarsk_app/src/mocks.dart';
import 'package:tarsk_app/src/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  showAddresses() {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MyBottomNavigationBar(),
        body: CustomScrollView(
          slivers: <Widget>[
            currentUserLocation(context),
            searchInput(),
            couponList(),
            categoryList(),
            restaurantList(width, context),
          ],
        ),
      ),
    );
  }

  bottomAppBar(width) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        color: AppColors.midGreen,
        height: 53,
        width: width * 0.75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.home, color: AppColors.midYellow),
                onPressed: () {},
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite, color: AppColors.midYellow),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.list,
                        color: AppColors.midYellow),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  currentUserLocation(context) {
    return SliverToBoxAdapter(
      child: UserLocationBar(),
    );
  }

  couponList() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 128,
        child: ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: couponImages.map((i) {
            return Container(
              margin: const EdgeInsets.only(right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.network(
                  i,
                  height: 128,
                  width: 220,
                  fit: BoxFit.fill,
                  loadingBuilder: (_, child, chunkEvent) {
                    if (chunkEvent == null) return child;

                    return SizedBox(
                      height: 128,
                      width: 220,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  searchInput() {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColors.grey)),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.grey,
                ),
                hintText: 'Busca tienda, producto, comida...',
                contentPadding: const EdgeInsets.all(0),
                hintStyle: TextStyle(color: AppColors.grey)),
          )),
    );
  }

  categoryList() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: categories.map((c) {
            return Container(
              height: 120,
              width: 90,
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(13)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  c['icon'],
                  Text(
                    '${c['name']}',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  restaurantList(width, context) {
    return SliverList(
        delegate: SliverChildListDelegate(restaurants.asMap().entries.map((e) {
      final r = e.value;

      final itemGoesLeft = e.key % 2 == 0;

      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pushNamed(context, '/store', arguments: r['id']);
        },
        child: SizedBox(
          height: 140,
          width: width,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 8,
                left: itemGoesLeft ? 8 : null,
                right: !itemGoesLeft ? 8 : null,
                child: Column(
                  crossAxisAlignment: itemGoesLeft
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '${r['title']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '${r['summary']}',
                      style: TextStyle(fontSize: 12),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          size: 12,
                        ),
                        Text(
                          '${r['deliveryTime']}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      'S/${r['averagePrice']} por persona',
                      style: TextStyle(fontSize: 12),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColors.midGreen,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          '${r['score']}',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: itemGoesLeft ? null : 0,
                right: !itemGoesLeft ? null : 0,
                top: 0,
                child: ClipPath(
                  clipper: RestaurantItemClipper(itemGoesLeft: itemGoesLeft),
                  child: Image.network(
                    r['image'],
                    width: width * 0.6,
                    height: 140,
                    fit: BoxFit.fill,
                    loadingBuilder: (_, child, chunkEvent) {
                      if (chunkEvent == null) return child;

                      return SizedBox(
                        width: width * 0.6,
                        height: 140,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList()));
  }
}

class RestaurantItemClipper extends CustomClipper<Path> {
  final bool itemGoesLeft;

  RestaurantItemClipper({this.itemGoesLeft});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (this.itemGoesLeft) {
      path.lineTo(0, size.height);
      path.lineTo(size.width * 0.55, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    } else {
      path.lineTo(size.width * 0.45, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//MyBottomNavigationBarState

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          _index = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            backgroundColor: AppColors.midGreen,
            icon: Icon(Icons.home, color: AppColors.midYellow),
            title: Text(
              'Inicio',
              style: TextStyle(color: AppColors.midYellow),
            )),
        BottomNavigationBarItem(
            backgroundColor: AppColors.midGreen,
            icon: Icon(
              Icons.favorite,
              color: AppColors.midYellow,
            ),
            title: Text(
              'Favoritos',
              style: TextStyle(color: AppColors.midYellow),
            )),
        BottomNavigationBarItem(
            backgroundColor: AppColors.midGreen,
            icon: Icon(
              Icons.list,
              color: AppColors.midYellow,
            ),
            title: Text(
              'Mis pedidos',
              style: TextStyle(color: AppColors.midYellow),
            )),
        BottomNavigationBarItem(
            backgroundColor: AppColors.midGreen,
            icon: Icon(
              Icons.shopping_cart,
              color: AppColors.midYellow,
            ),
            title: Text(
              'Mi carrito',
              style: TextStyle(color: AppColors.midYellow),
            )),
      ],
    );
  }
}

//UserLocationBarState

class UserLocationBar extends StatefulWidget {
  UserLocationBar({Key key}) : super(key: key);

  @override
  _UserLocationBarState createState() => _UserLocationBarState();
}

class _UserLocationBarState extends State<UserLocationBar> {
  var _mainAddress = '';

  showAddressList() async {
    final listAddressOptions = addresses.map((a) {
      return PopupMenuItem<String>(
        child: Text(a['address']),
        value: a['address'],
      );
    }).toList();

    listAddressOptions.add(
      PopupMenuItem<String>(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.add_circle_outline),
            Text('Agregar dirección')
          ],
        ),
        value: 'add',
      )
    );

    var address = await showMenu<String>(
        context: context,
        position: RelativeRect.fromLTRB(0, 50, 0, 0),
        items: listAddressOptions);

    if (address != null) {

      if (address == 'add') {
        Navigator.pushNamed(context, '/user-location');
      } else {
        setState(() {
          _mainAddress = address;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _mainAddress = addresses.firstWhere((a) => a['isMain'])['address'];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showAddressList,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: AppColors.midGreen,
            ),
            Text(_mainAddress),
            Icon(Icons.person_pin)
          ],
        ),
      ),
    );
  }
}
