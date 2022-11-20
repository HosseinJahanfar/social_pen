import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_pen/gen/assets.gen.dart';
import 'package:social_pen/models/data_model.dart';
import 'package:social_pen/models/fake_data.dart';
import 'package:social_pen/my_component.dart';
import 'package:social_pen/my_strings.dart';

import '../my_colors.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.tcbot,
                    height: 100,
                  ),
                  Text(
                    MyStrings.successfulRegistration,
                    style: textTheme.headline4,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'نام و نام خانوادگی',
                        hintStyle: textTheme.headline4),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyStrings.chooseCats,
                    style: textTheme.headline4,
                  ),
                  //*TagList
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: tagList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.3),
                          itemBuilder: ((context, index) {
                            return InkWell(
                                onTap: (() {
                                  setState(() {
                                    if (!selectedList
                                        .contains(tagList[index])) {
                                      selectedList.add(tagList[index]);
                                    } else {print("${tagList[index].title} Exist");}
                                  });
                                }),
                                child: MainTags(
                                    textTheme: textTheme, index: index));
                          })),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //*selectedList
                  Image.asset(
                    Assets.icons.downCatArrow.path,
                    scale: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: selectedList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.2),
                          itemBuilder: ((context, index) {
                            return Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: SolidColors.surface),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      selectedList[index].title,
                                      style: textTheme.headline4,
                                    ),
                                    InkWell(
                                      onTap: (() {
                                        setState(() {
                                          selectedList.removeAt(index);
                                        });
                                      }),
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
