import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Belajar SliverAppBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/images/image1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.download), text: "Download"),
                      new Tab(icon: new Icon(Icons.favorite), text: "Favorite Songs"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: <Widget>[
            BelajarListView(),
            BelajarListView(),
            BelajarListView(),
          ]),
        ),
      ),
    );
  }
}

class BelajarListView extends StatelessWidget {
  final List Songs = [
    "All The Way.mp3",
    "CIDRO 2.mp3",
    "SATRU.mp3",
    "Sekali Lagi.mp3",
    "Cintanya AKu.mp3",
    "Hilang Tapi Ada.mp3",
    "Mesin Waktu.mp3",
    "About A Girl.mp3",
    "Mawar De Jongh.mp3",
    "Love Buzz.mp3",
    "Be Okay Again Today.mp3",
    "Menualah Denganku.mp3"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(Songs[index], style: TextStyle(fontSize: 15)),
                subtitle: Text('ini subtitle dari ' + Songs[index]),
                leading: CircleAvatar(
                  child: Text(Songs[index][0], // ambil karakter pertama text
                      style: TextStyle(fontSize: 5)),
                )),
          );
        },
        itemCount: Songs.length,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
