import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mob/blocs/product/product_bloc.dart';
import 'package:flutter_mob/blocs/product/product_event.dart';
import 'package:flutter_mob/blocs/product/product_state.dart';
import 'package:flutter_mob/configs/colors.dart';
import 'package:flutter_mob/configs/constants.dart';
import 'package:flutter_mob/configs/themes.dart';
import 'package:flutter_mob/models/watch/watch.dart';
import 'package:flutter_mob/ui/components/app_bar/app_bar_title.dart';
import 'package:flutter_mob/ui/components/button/button_normal.dart';
import 'package:flutter_mob/ui/components/card/card_comment.dart';
import 'package:flutter_mob/ui/components/scroll_behavior/scroll_behavior.dart';
import 'package:flutter_mob/ui/components/text/text_normal.dart';
import 'package:flutter_mob/utils/Loading_helper.dart';
import 'package:flutter_mob/utils/utility.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WatchDetailScreen extends StatefulWidget {
  final Watch watch;

  const WatchDetailScreen({super.key, required this.watch});

  @override
  State<WatchDetailScreen> createState() => _WatchDetailScreenState();
}

class _WatchDetailScreenState extends State<WatchDetailScreen> {
  int quantity = 1;
  bool isLoaded = false;
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) async {
        if (state is UpdateProductToCartLoadingState) {
          LoadingHelper.showLoading(context);
        } else if (state is UpdateProductToCartSuccessState) {
          LoadingHelper.hideLoading(context);
          setState(() {
            quantity = 1;
          });
        } else if (state is UpdateProductToCartErrorState) {
          LoadingHelper.hideLoading(context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: Column(
            children: [
              AppBarTitle(appTitle: widget.watch.name),
              Expanded(
                child: ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: MediaQuery.of(context).size.width - 40,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: AppColors.grey3,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.grey4)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: PageView(
                                      controller: pageController,
                                      onPageChanged: (value) {
                                        setState(() {
                                          currentIndex = value;
                                        });
                                      },
                                      children: widget.watch.photoUrls.map((e) {
                                        return e.contains("svg")
                                            ? SvgPicture.network(e,
                                                fit: BoxFit.cover)
                                            : Image.network(e,
                                                fit: BoxFit.cover);
                                      }).toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  if (widget.watch.photoUrls.length > 1)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                          widget.watch.photoUrls.length,
                                          (index) => Container(
                                                width: 10,
                                                height: 10,
                                                margin: EdgeInsets.only(
                                                    right: index !=
                                                            (widget
                                                                    .watch
                                                                    .photoUrls
                                                                    .length -
                                                                1)
                                                        ? 4
                                                        : 0),
                                                decoration: BoxDecoration(
                                                    color: currentIndex == index
                                                        ? Colors.black
                                                        : null,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.black)),
                                              )).toList(),
                                    )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: TextNormal(
                                      title: widget.watch.name,
                                      colors: AppColors.bPrimaryColor,
                                      fontName: AppThemes.specialElite,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: handleDecreaseQuantity,
                                      child: Container(
                                        width: 37,
                                        height: 37,
                                        decoration: BoxDecoration(
                                            color: AppColors.yellow1,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.remove,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: TextNormal(
                                        title: quantity.toString(),
                                        colors: AppColors.bPrimaryColor,
                                        fontName: AppThemes.sourceSans,
                                        fontWeight: FontWeight.w600,
                                        size: 18,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: handleIncreaseQuantity,
                                      child: Container(
                                        width: 37,
                                        height: 37,
                                        decoration: BoxDecoration(
                                            color: AppColors.yellow1,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.add,
                                          size: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            TextNormal(
                              title:
                                  "${Utility.formatNumberDoubleToInt(widget.watch.price)}\$",
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.spicyRice,
                              size: 20,
                            ),
                            SizedBox(
                              height: 38,
                            ),
                            TextNormal(
                              title: "Thông số:",
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.spectral,
                              fontWeight: FontWeight.w700,
                              size: 22,
                            ),
                            SizedBox(height: 8),
                            TextNormal(
                              title: "Thương hiệu: ${widget.watch.brand?.name}",
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.spectral,
                              size: 18,
                            ),
                            SizedBox(height: 4),
                            TextNormal(
                              title: "Kích thước: ${widget.watch.size}mm",
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.spectral,
                              size: 18,
                            ),
                            SizedBox(height: 4),
                            TextNormal(
                              title:
                                  "Loại máy: ${Utility.getMachineCategory(widget.watch.machineCategory!)}",
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.spectral,
                              size: 18,
                            ),
                            SizedBox(height: 4),
                            TextNormal(
                              title:
                                  "Loại dây: ${Utility.getWireCategory(widget.watch.wireCategory!)}",
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.spectral,
                              size: 18,
                            ),
                            SizedBox(height: 4),
                            TextNormal(
                              title: "Mô tả:",
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.spectral,
                              size: 18,
                            ),
                            TextNormal(
                              title: widget.watch.description,
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.spectral,
                              size: 18,
                            ),
                            SizedBox(
                              height: 38,
                            ),
                            ButtonNormal(
                              text: StringName.addToCart,
                              onPressed: onClickAddWatch,
                            ),
                            SizedBox(
                              height: 38,
                            ),
                            TextNormal(
                              title: StringName.commentProduct,
                              colors: AppColors.bPrimaryColor,
                              fontName: AppThemes.specialElite,
                              size: 20,
                            ),
                            SizedBox(
                              height:
                                  widget.watch.listReview.isNotEmpty ? 8 : 20,
                            ),
                            widget.watch.listReview.isNotEmpty
                                ? Column(
                                    children: widget.watch.listReview
                                        .map((e) => CardComment(
                                              review: e,
                                            ))
                                        .toList(),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextNormal(
                                        title: StringName.noComment,
                                        colors: AppColors.bPrimaryColor,
                                        fontName: AppThemes.spectral,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleDecreaseQuantity() {
    if (quantity == 1) return;
    setState(() {
      quantity--;
    });
  }

  handleIncreaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  onClickAddWatch() {
    BlocProvider.of<ProductBloc>(context).add(UpdateProductToCartEvent(
        watchId: widget.watch.id,
        quantity: quantity,
        type: UpdateCartTypeEnum.PLUS));
  }
}
