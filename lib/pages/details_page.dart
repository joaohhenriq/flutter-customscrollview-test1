import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  AnimationController _containerController;
  Animation<double> width;
  Animation<double> height;

  double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  void initState() {
    _containerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    width = Tween<double>(
      begin: 200,
      end: 220,
    ).animate(
      CurvedAnimation(parent: _containerController, curve: Curves.ease),
    );

    height = Tween<double>(
      begin: 400,
      end: 400,
    ).animate(
      CurvedAnimation(parent: _containerController, curve: Curves.ease),
    );

    height.addListener(() {
      setState(() {
        if (height.isCompleted) {}
      });
    });

    _containerController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.value,
      height: height.value,
      color: Colors.black87,
      child: Hero(
        tag: "app",
        child: Card(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            width: width.value,
            height: height.value,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                CustomScrollView(
                  shrinkWrap: false,
                  slivers: <Widget>[
                    SliverAppBar(
                      elevation: 0,
                      forceElevated: true,
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      expandedHeight: _appBarHeight,
                      pinned: _appBarBehavior == AppBarBehavior.pinned,
                      floating: _appBarBehavior == AppBarBehavior.floating ||
                          _appBarBehavior == AppBarBehavior.snapping,
                      snap: _appBarBehavior == AppBarBehavior.snapping,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text("It's just a test",),
                        background: Container(
                          color: Colors.blue,
                          width: width.value,
                          height: _appBarHeight,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(35),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black12))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.cyan,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text("10:00 AM"),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.map,
                                              color: Colors.cyan,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text("10 km"),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 8),
                                    child: Text(
                                      "ABOUT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 25),
                                    padding:
                                        EdgeInsets.only(top: 5, bottom: 10),
                                    height: 120,
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        border: new Border(
                                            top: new BorderSide(
                                                color: Colors.black12))),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
