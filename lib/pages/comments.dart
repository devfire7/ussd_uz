import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:shop_uz/componenets/category_card.dart';
import 'package:shop_uz/componenets/checkout_side.dart';
import 'package:shop_uz/componenets/product_card.dart';
import 'package:shop_uz/constants.dart';
import 'package:shop_uz/modules/test_module.dart';
import 'package:shop_uz/pages/product/product_ui_config.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
 final dragController = DragController();
  bool statusBar = false;
  var cat_row = 3;
  var pro_row = 4;
  String activeIndexCard = '-1';

  Future<void> refreshOrder(newChild)async{
    setState(() {
      orders.add(newChild);
    });
  }
  Future<void> selectableCard(index)async{
    setState(() {
      activeIndexCard = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     var customSize = MediaQuery.of(context).size.width;

    // ==== For category With ======
    if (customSize > mediumSize) {
      isShowRightSidebar = false;
      statusBar = false;
      cat_row = 3;
    }
    ;

    if (customSize < mediumSize) {
      cat_row = 2;
      statusBar = true;
    }

    // ==== For Products with =====
    if (customSize < medium2Size) {
      pro_row = 3;
    }

    if (customSize >= medium2Size) {
      pro_row = 4;
    }

    //============= Mobile Responsible ========
    if (customSize > miniSize && customSize < mediumSize) {
      cat_row = 2;
      pro_row = 3;
    }
    if (customSize < miniSize) {
      cat_row = 1;
      pro_row = 2;
    }

    return  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ======== Body Left side start======
              Expanded(
                flex: 3,
                child: Stack(children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isShowRightSidebar = false;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: SingleChildScrollView(
                        child: Container(

                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ====== Start Body Top colorly Border Cards =======
                                Column(
                                  children: List.generate(
                                      (categories.length / cat_row).ceil(), (index) {
                                    var cat_row_mini = cat_row;
                                    if (categories.length <=
                                        index * cat_row + cat_row) {
                                      cat_row_mini =
                                          categories.length - index * cat_row;
                                    }

                                    return Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          top: 15, left: 20, right: 50),
                                      height: 52,
                                      child: Row(
                                        children: List.generate(
                                          cat_row_mini,
                                              (index1) {
                                            return CategoryCard(
                                              imagePath:
                                              categories[index * cat_row + index1]
                                              ["imagePath"]!,
                                              name:
                                              categories[index * cat_row + index1]
                                              ["name"]!,
                                              amount:
                                              categories[index * cat_row + index1]
                                              ["c_amount"]!,
                                              borderColor: Color(0xFF4cbd91),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                                ),

                                /// ====== End Top Colorly border Card =========
                                Container(
                                  margin: EdgeInsets.only(top: 25, bottom: 15, left: 40, right: 50),
                                  child: const Text(
                                    'Search by keyword',
                                    style: TextStyle(
                                        color: Color(0xFFaeaeae), fontSize: 12.5),
                                  ),
                                ),

                                /// ===== Start Cards of Products =========
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  // height: double.infinity,
                                  child: Column(
                                    children: List.generate(
                                        (products.length / pro_row).ceil(),
                                            (index) {
                                          var pro_row_mini = pro_row;
                                          if (products.length <=
                                              index * pro_row + pro_row) {
                                            pro_row_mini =
                                                products.length - index * pro_row;
                                          }
                                          return Row(
                                            children:
                                            List.generate(pro_row_mini, (index1) {
                                              return ProductCard(
                                                name:
                                                products[index * pro_row + index1]
                                                ['name']!,
                                                price:
                                                products[index * pro_row + index1]
                                                ['price']!,
                                                imagePath:
                                                products[index * pro_row + index1]
                                                ['imagePath']!,
                                                refreshOrder:refreshOrder,
                                                activeIndexCard:activeIndexCard.toString(),
                                                currentIndex:(index * pro_row + index1).toString(),
                                                selectableCard:selectableCard,
                                              );
                                            }),
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (isShowRightSidebar)
                    CheckoutSide(
                      isShow: true,
                      orders: orders,
                    ),
                  DraggableWidget(
                    bottomMargin: 200,
                    topMargin: 10,
                    verticalSpace: 20,
                    intialVisibility: statusBar,
                    // horizontalSpace: 10,
                    shadowBorderRadius: 50,
                    child: Tooltip(
                      message: "Products orders",
                      waitDuration: Duration(milliseconds:500),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isShowRightSidebar=!isShowRightSidebar;
                            statusBar=false;
                          });
                        },
                        child: Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Stack(
                            children: [
                              Center(child: Text(orders.length.toString(),style: TextStyle(color: Colors.white,fontSize: 13),),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    initialPosition: AnchoringPosition.topRight,
                    dragController: dragController,
                  )
                ]),
              ),
              //======== Body Left side End ==========

              //======== Body Right side start ==========
              if (customSize >= mediumSize)
               Expanded(
                  flex: 1,
                  child: CheckoutSide(isShow: false, orders: orders),
                ),
     
            ],
          );
          
  }
}
