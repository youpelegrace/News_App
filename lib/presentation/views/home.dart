import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/view_model/news.dart';
import 'package:news_app/core/view_model/theme.dart';
import 'package:news_app/presentation/widgets/header_row.dart';
import 'package:news_app/presentation/widgets/tab_bar.dart';
import 'package:news_app/utils/constant/colors.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late ThemeModel themeModel;
  bool isLoading = true;

  @override
  void initState() {
    final data = Provider.of<NewsProvider>(context, listen: false);
    data.techCategory();
    data.healthsCategory();
    data.sportsCategory();
    data.getNewsDetails();
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeModel = context.read<ThemeModel>();
    final data = Provider.of<NewsProvider>(context);
    final isLightMode = themeModel.mode == ThemeMode.light;
    print(data.healthCategory?.articles!.length);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            margin: const EdgeInsets.only(
              left: 15,
              top: 5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kPrimaryColor.withOpacity(0.10)),
            child: InkWell(
                onTap: () {
                  themeModel.toggleIsDarkMode();
                },
                child: isLightMode
                    ? const Icon(
                        Icons.light_mode,
                        color: kPrimaryColor,
                      )
                    : const Icon(Icons.dark_mode)),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 5),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("images/pp.jpeg"), fit: BoxFit.contain),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Breaking News',
                    style: Theme.of(context).textTheme.headline1),
                HeaderRow(),
                const SizedBox(
                  height: 20,
                ),
                TabBarsRow(tabController: _tabController),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TabBarBuild(tabController: _tabController))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
