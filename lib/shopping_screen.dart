import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // iOS에서 StatusBar의 색상을 정해주기위해 설정
    // TabBar 등을 사용하려면 Scaffold 혹은 Meterial로 감싸줘야함.
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: false,
                backgroundColor: Colors.white,
                title: Text(
                  "Flutter Shopping App",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SliverPersistentHeader(
                  pinned: true, delegate: TabBarDelegate()),
              SliverFillRemaining(
                // 탭바 뷰 내부에는 스크롤이 되는 위젯이 들어옴.
                hasScrollBody: true,
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.amber,
                    ),
                    Container(
                      color: Colors.redAccent,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: [
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "홈",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "특가",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "랭킹",
              ),
            ),
          ),
        ],
        indicatorWeight: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
