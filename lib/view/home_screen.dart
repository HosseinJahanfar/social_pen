import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_component.dart';
import '../my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
           
            HomePagePoster(size: size, textTheme: textTheme),
         
            const SizedBox(
              height: 16,
            ),
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),
         
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),

          
            HomePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
        
            SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
            
            HomePagePodcastList(size: size, bodyMargin: bodyMargin),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
//!homePagePodcastList
class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          //*blog item
          return Padding(
            padding:
                EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: NetworkImage(blogList[index].imageUrl),
                          fit: BoxFit.cover),
                    ),
                    foregroundDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                            colors: GradiantColors.blogPost,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: const Text(
                    'حسین جهانفر',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 14),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.microphon.image().image,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodcasts,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}
//!homePageBlogList
class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          //*blog item
          return Padding(
            padding:
                EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: NetworkImage(
                                  blogList[index].imageUrl),
                              fit: BoxFit.cover),
                        ),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                                colors: GradiantColors.blogPost,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTheme.subtitle1,
                            ),
                            Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              children: [
                                Text(
                                  blogList[index].views,
                                  style: textTheme.subtitle1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  size: 16,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
//!seeMoreBlog
class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 14),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePen.image().image,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

//!homePageTagList
class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                0, 8, index == 0 ? bodyMargin : 15, 8),
            child: MainTags(textTheme: textTheme,index:index),
          );
        },
      ),
    );
  }
}


//!homePagePoster
class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(homePagePosterMap["imageAsset"]),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                colors: GradiantColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        homePagePosterMap["view"],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        size: 16,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
              Text(
                homePagePosterMap["title"],
                style: textTheme.headline1,
              )
            ],
          ),
        )
      ],
    );
  }
}
