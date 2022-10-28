import 'dart:isolate';

import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_uz/pages/account/account_page.dart';
import 'package:shop_uz/pages/product/product_page.dart';
import 'package:shop_uz/pages/product/product_ui_config.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage(
    {
      Key? key, 
      required this.pref
    }
    ) : super(key: key);

 final SharedPreferences pref;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    var customSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          //============ Top Appbar started ! =========
          Container(
            width: double.infinity,
            color: Color(0xFF6400c2),
            height: 70,
            child: Row(
              children: [
                Container(
                  width: widthAppBarContent,
                  height: 70,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.clear_all,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  color: Color(0xFF8b10fe),
                ),
                Container(
                  margin: EdgeInsets.only(left: marginHomeAppBar),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF5800a3).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 6,
                        offset:
                        const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF5800a3).withOpacity(0.7),
                            spreadRadius: 6,
                            blurRadius: 10,
                            offset: const Offset(0, 5),),
                        ]),
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      radius: 18,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF9dd057),
                        child: const Text(
                          'D',
                        ),
                        radius: 17.1,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: marginHomeAppBar),
                  child: Text(
                    'Mr Developer',
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: (customSize < mediumSize)
                          ? ((2 * widthAppBarContent) + 54)
                          : ((widthAppBarContent) + 54),
                      height: 70,
                      child: Row(
                          children: [
                            Container(
                              width: 54,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF31c491),
                                  radius: 4.6,
                                ),
                              ),
                            ),
                            Container(
                              width: (customSize < mediumSize)
                                  ? 2 * widthAppBarContent
                                  : widthAppBarContent,
                              height: 70,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("hi !");
                                    },
                                    child: Container(
                                      width: widthAppBarContent,
                                      child: Center(
                                        child: Icon(
                                          Icons.lock_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (customSize < mediumSize)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isShowRightSidebar = !isShowRightSidebar;
                                        });
                                      },
                                      child: Container(
                                        width: widthAppBarContent,
                                        child: Center(
                                          child: Icon(
                                            Icons.menu_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              color: Color(0xFF8b10fe),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //========== Ende Top Appbar ==========

          //========== Start Body of Page =======

           AccountPage(),
          // ProductPage(),

          // ========= End Body main  part =========

          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Container(
          //     margin: EdgeInsets.only(right: 10, top: 19),
          //     child: Material(
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(3)),
          //       elevation: 8,
          //       child: Container(
          //         decoration: BoxDecoration(
          //             color: Colors.blue,
          //             borderRadius: BorderRadius.circular(3)),
          //         padding: EdgeInsets.fromLTRB(70, 12, 70, 12),
          //         child: Text(
          //           'CLOSE',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
