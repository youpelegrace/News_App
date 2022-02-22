import 'package:flutter/material.dart';
import 'package:news_app/core/view_model/news.dart';
import 'package:news_app/presentation/widgets/health.dart';
import 'package:news_app/presentation/widgets/sports.dart';
import 'package:news_app/presentation/widgets/tech.dart';
import 'package:provider/src/provider.dart';

class TabBarBuild extends StatelessWidget {
  TabBarBuild({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: MediaQuery.of(context).size.width,
      child: TabBarView(controller: _tabController, children: [
        SpotsTab(),
        TechTab(),
        BussinessTab(),
      ]),
    );
  }
}

class TabBarsRow extends StatelessWidget {
  TabBarsRow({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  late NewsProvider _newsProvider;

  @override
  Widget build(BuildContext context) {
    _newsProvider = context.watch<NewsProvider>();
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TabBar(controller: _tabController, tabs: [
        Tab(
          child: Text('Sports', style: Theme.of(context).textTheme.headline6),
        ),
        Tab(
          child: Text('Tech', style: Theme.of(context).textTheme.headline6),
        ),
        Tab(
          child: Text('Health', style: Theme.of(context).textTheme.headline6),
        ),
      ]),
    );
  }
}
