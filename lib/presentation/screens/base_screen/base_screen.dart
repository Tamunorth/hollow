import 'package:flutter/material.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/app/dependencies/svg_dep.dart';
import 'package:hollow_bit/generated/assets.dart';

import '../home_screen/home_screen2.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          Home2(),
          Wallet(),
          Card(),
          Profile(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              selectedItemColor: ColorConstants.darkGrey01,
              unselectedItemColor: Colors.grey,
              iconSize: 0.0,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedFontSize: 0.0,
              selectedFontSize: 0.0,
              currentIndex: currentIndex,
              onTap: (tappedIndex) {
                setState(() {
                  currentIndex = tappedIndex;
                });

                ///
              },
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgAsset(
                        imgPath: Assets.imagesHome,
                        color: currentIndex != 0 ? Colors.grey : null,
                      ),
                      currentIndex != 0
                          ? const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SvgAsset(
                                imgPath: Assets.imagesHump,
                                color: Colors.transparent,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SvgAsset(imgPath: Assets.imagesHump),
                            ),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgAsset(
                        imgPath: Assets.imagesWalletIcon,
                        color: currentIndex != 1
                            ? Colors.grey
                            : ColorConstants.primary600,
                      ),
                      currentIndex != 1
                          ? const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SvgAsset(
                                imgPath: Assets.imagesHump,
                                color: Colors.transparent,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SvgAsset(imgPath: Assets.imagesHump),
                            ),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgAsset(
                        imgPath: Assets.imagesCard,
                        color: currentIndex != 2
                            ? Colors.grey
                            : ColorConstants.primary600,
                      ),
                      currentIndex != 2
                          ? const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SvgAsset(
                                imgPath: Assets.imagesHump,
                                color: Colors.transparent,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SvgAsset(imgPath: Assets.imagesHump),
                            ),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgAsset(
                        imgPath: Assets.imagesUser,
                        color: currentIndex != 3
                            ? Colors.grey
                            : ColorConstants.primary600,
                      ),
                      currentIndex != 3
                          ? const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SvgAsset(
                                imgPath: Assets.imagesHump,
                                color: Colors.transparent,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: SvgAsset(imgPath: Assets.imagesHump),
                            ),
                    ],
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Wallet'));
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Card'));
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile'));
  }
}
