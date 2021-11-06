part of '../pages.dart';

class ListArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, prov, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: Text(
              'Berita',
              style: fontAppBarTitle,
            ),
          ),
          body: ListArticle(),
        );
      },
    );
  }
}

class ListArticle extends StatefulWidget {
  @override
  _ListArticleState createState() => _ListArticleState();
}

class _ListArticleState extends State<ListArticle> {
  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, prov, _) {
        return Builder(
          builder: (context) {
            if (prov.isArticleInit && prov.articles.isEmpty) {
              prov.getMore(context);
              return buildLoadingArticle();
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  return await prov.reload(context);
                },
                child: prov.isArticleInit == false && prov.articles.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(iconsPath + 'soon.png',
                              width: 100, height: 100),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Nanti artikel akan tampil disini',
                              style: fontBlack),
                        ],
                      )
                    : NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                            setState(() {
                              isLoadingMore = true;
                            });
                            prov.getMore(context).then((_) {
                              setState(() {
                                isLoadingMore = false;
                              });
                            });
                            return true;
                          }
                          return false;
                        },
                        child: ListView.separated(
                            separatorBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(),
                                ),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: isLoadingMore
                                ? prov.articles.length + 3
                                : prov.articles.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = prov.articles[index];
                              if (index >= prov.articles.length) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  width: 300,
                                  height: 210,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.black26,
                                            Colors.black12
                                          ])),
                                );
                              }
                              return OpenContainer(
                                transitionDuration: 500.milliseconds,
                                closedElevation: 0,
                                closedBuilder:
                                    (BuildContext c, VoidCallback action) =>
                                        Container(
                                  margin: EdgeInsets.all(5),
                                  width: 300,
                                  height: 210,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        width: 300,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    data.thumbnail!))),
                                      )),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${data.judul}',
                                                style: fontBlack.copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Container(
                                                width: 300,
                                                child: Text(
                                                  '${parseHtmlString(data.deskripsi!)}',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: fontBlack.copyWith(
                                                    color: Colors.black54,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                openBuilder:
                                    (BuildContext c, VoidCallback action) =>
                                        ArticlePage(data),
                                tappable: true,
                              );
                            }),
                      ),
              );
            }
          },
        );
      },
    );
  }
}
