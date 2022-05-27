import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  int currentIndex;

  CustomBottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xffC51104),
          unselectedItemColor: Colors.grey,
          iconSize: 25.0,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          unselectedFontSize: 0.0,
          selectedFontSize: 0.0,
          currentIndex: widget.currentIndex,
          onTap: (tappedIndex) {
            setState(() {
              widget.currentIndex = tappedIndex;
            });

            ///
          },
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  Icon(Icons.home_rounded
                      // controller.tabIndex.value == 0
                      //     ? Icons.home_rounded
                      //     : Icons.home_outlined,
                      ),
                  // controller.tabIndex.value == 0
                  //     ? Padding(
                  //         padding: const EdgeInsets.only(top: 8.0),
                  //         child: ClipOval(
                  //           child: Container(
                  //             width: 5,
                  //             height: 5,
                  //             color: Color(0xffC51104),
                  //           ),
                  //         ),
                  //       )
                  //     : SizedBox.shrink(),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  Icon(
                    Icons.list_alt_rounded,
                  ),
                  // controller.tabIndex.value == 1
                  //     ? Padding(
                  //         padding: const EdgeInsets.only(top: 8.0),
                  //         child: ClipOval(
                  //           child: Container(
                  //             width: 5,
                  //             height: 5,
                  //             color: Color(0xffC51104),
                  //           ),
                  //         ),
                  //       )
                  //     : SizedBox.shrink(),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  Icon(Icons.account_balance_wallet
                      // controller.tabIndex.value == 2
                      //     ? Icons.account_balance_wallet
                      //     : Icons.account_balance_wallet_outlined,
                      ),
                  // controller.tabIndex.value == 2
                  //     ? Padding(
                  //         padding: const EdgeInsets.only(top: 8.0),
                  //         child: ClipOval(
                  //           child: Container(
                  //             width: 5,
                  //             height: 5,
                  //             color: Color(0xffC51104),
                  //           ),
                  //         ),
                  //       )
                  //     : SizedBox.shrink(),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: const [
                  Icon(Icons.person_rounded
                      // controller.tabIndex.value == 3
                      //     ? Icons.person_rounded
                      //     : Icons.person_outline_rounded,
                      ),
                  // controller.tabIndex.value == 3
                  //     ? Padding(
                  //         padding: const EdgeInsets.only(top: 8.0),
                  //         child: ClipOval(
                  //           child: Container(
                  //             width: 5,
                  //             height: 5,
                  //             color: Color(0xffC51104),
                  //           ),
                  //         ),
                  //       )
                  //     : SizedBox.shrink(),
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
