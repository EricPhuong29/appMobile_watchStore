import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mob/blocs/product/product_bloc.dart';
import 'package:flutter_mob/blocs/product/product_event.dart';
import 'package:flutter_mob/blocs/product/product_state.dart';
import 'package:flutter_mob/configs/colors.dart';
import 'package:flutter_mob/configs/constants.dart';
import 'package:flutter_mob/configs/images.dart';
import 'package:flutter_mob/configs/themes.dart';
import 'package:flutter_mob/models/filter.dart';
import 'package:flutter_mob/models/watch/watch.dart';
import 'package:flutter_mob/storage/sharedpreferences/shared_preferences_manager.dart';
import 'package:flutter_mob/ui/components/card/card_recent_search.dart';
import 'package:flutter_mob/ui/components/card/card_watch.dart';
import 'package:flutter_mob/ui/components/input/search_input_field.dart';
import 'package:flutter_mob/ui/components/scroll_behavior/scroll_behavior.dart';
import 'package:flutter_mob/ui/components/text/text_normal.dart';
import 'package:flutter_mob/utils/Loading_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  List<String> listRecentSearchs = [];
  List<Watch> listWatch = [];
  bool isFocusInput = false;
  bool isSearched = false;
  List<Filter> listSelectedFilter = [];

  @override
  void initState() {
    focusNode.addListener(() {
      isFocusInput = focusNode.hasFocus;
      setState(() {});
    });
    initData();
    super.initState();
  }

  initData() async {
    SharedPrefManager? sharedPrefManager =
        await SharedPrefManager.getInstance();
    listRecentSearchs = await sharedPrefManager!
            .getStringList(SharedPrefManager.searchHistoriesKey) ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) async {
        if (state is GetListProductLoadingState) {
          LoadingHelper.showLoading(context);
        } else if (state is GetListProductSuccessState) {
          LoadingHelper.hideLoading(context);
          setState(() {
            listWatch = state.listWatch;
          });
        } else if (state is GetListProductErrorState) {
          LoadingHelper.hideLoading(context);
          Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchInputField(
                        controller: controller,
                        focusNode: focusNode,
                        onSearch: (textSearch) async {
                          BlocProvider.of<ProductBloc>(context).add(
                              GetListProductEvent(
                                  limit: 50, page: 1, textSearch: textSearch));
                          isSearched = true;
                          focusNode.unfocus();
                          listSelectedFilter.clear();
                          setState(() {});
                          if (textSearch.isNotEmpty) {
                            int existed = listRecentSearchs
                                .indexWhere((element) => element == textSearch);
                            if (existed < 0) {
                              listRecentSearchs.add(textSearch);
                              SharedPrefManager? sharedPrefManager =
                                  await SharedPrefManager.getInstance();
                              await sharedPrefManager!.putStringList(
                                  SharedPrefManager.searchHistoriesKey,
                                  listRecentSearchs);
                            }
                          }
                        },
                      ),
                    ),
                    if (isSearched)
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              var result = await Navigator.pushNamed(
                                  context, Constants.filterScreen,
                                  arguments: listSelectedFilter);
                              if (result != null) {
                                LoadingHelper.showLoading(context);
                                await Future.delayed(Duration(seconds: 2));
                                LoadingHelper.hideLoading(context);
                                listSelectedFilter = result as List<Filter>;
                                setState(() {});
                              }
                            },
                            child: Image.asset(
                              AppImages.iconFilter,
                              height: 24,
                              color: listSelectedFilter.isNotEmpty
                                  ? AppColors.yellow1
                                  : null,
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
              Expanded(
                  child: Stack(
                children: [
                  if (!isFocusInput && isSearched)
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ScrollConfiguration(
                        behavior: CustomScrollBehavior(),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                TextNormal(
                                  title: filterWatches(
                                              listWatch, listSelectedFilter)
                                          .isNotEmpty
                                      ? StringName.searchResult
                                      : StringName.searchNotFound,
                                  fontName: AppThemes.jaldi,
                                  size: 22,
                                  lineHeight: 1.2,
                                  colors: AppColors.black1,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Wrap(
                                  runSpacing: 30,
                                  spacing: 20,
                                  children: filterWatches(
                                          listWatch, listSelectedFilter)
                                      .map((e) => CardWatch(
                                            watchData: e,
                                            isShowAddButton: false,
                                            widthCard: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    60) /
                                                2,
                                            heightCard: 260,
                                            onClick: onCLickDetailWatch,
                                          ))
                                      .toList(),
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (isFocusInput)
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        children: getLastFiveOrAll(listRecentSearchs)
                            .reversed
                            .map((e) => CardRecentSearch(
                                  textSearch: e,
                                  onClickTextSearch: (textSearch) async {
                                    if (textSearch.isNotEmpty) {
                                      controller.text = textSearch;
                                      isSearched = true;
                                      focusNode.unfocus();
                                      listSelectedFilter.clear();
                                      BlocProvider.of<ProductBloc>(context).add(
                                          GetListProductEvent(
                                              limit: 50,
                                              page: 1,
                                              textSearch: textSearch));
                                      setState(() {});
                                    }
                                  },
                                ))
                            .toList(),
                      ),
                    )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  onCLickDetailWatch(Watch watch) {
    BlocProvider.of<ProductBloc>(context)
        .add(GetDetailProductEvent(watchId: watch.id));
  }

  List<String> getLastFiveOrAll(List<String> inputList) {
    if (inputList.length <= 5) {
      return inputList;
    } else {
      return inputList.sublist(inputList.length - 5);
    }
  }

  List<Watch> filterWatches(List<Watch> watches, List<Filter> filters) {
    List<Watch> sizeFilteredWatches = [];
    List<Watch> priceFilteredWatches = [];
    List<Watch> wireFilteredWatches = [];
    List<Watch> factoryFilteredWatches = [];
    List<Filter> sizeFilters =
        filters.where((element) => element.querySize != null).toList();
    List<Filter> priceFilters =
        filters.where((element) => element.queryPrice != null).toList();
    List<Filter> factoryFilters =
        filters.where((element) => element.factory != null).toList();
    List<Filter> wireFilters =
        filters.where((element) => element.wire != null).toList();

    if (sizeFilters.isNotEmpty) {
      for (var filter in sizeFilters) {
        var newWatches = watches.where((watch) {
          bool matches = true;

          if (filter.querySize != null) {
            final startSize = filter.querySize?.startSize;
            final endSize = filter.querySize?.endSize;
            if (startSize != null && endSize != null) {
              matches =
                  matches && (watch.size >= startSize && watch.size <= endSize);
            } else if (startSize != null) {
              matches = matches && watch.size >= startSize;
            } else if (endSize != null) {
              matches = matches && watch.size <= endSize;
            }
          }

          return matches;
        }).toList();
        sizeFilteredWatches = [...sizeFilteredWatches, ...newWatches];
      }

      sizeFilteredWatches = removeDuplicateWatches(sizeFilteredWatches);
    } else {
      sizeFilteredWatches = watches;
    }

    if (priceFilters.isNotEmpty) {
      for (var filter in priceFilters) {
        var newWatches = sizeFilteredWatches.where((watch) {
          bool matches = true;

          if (filter.queryPrice != null) {
            final startPrice = filter.queryPrice?.startPrice;
            final endPrice = filter.queryPrice?.endPrice;
            if (startPrice != null && endPrice != null) {
              matches = matches &&
                  (watch.price >= startPrice && watch.price <= endPrice);
            } else if (startPrice != null) {
              matches = matches && watch.price >= startPrice;
            } else if (endPrice != null) {
              matches = matches && watch.price <= endPrice;
            }
          }

          return matches;
        }).toList();
        priceFilteredWatches = [...priceFilteredWatches, ...newWatches];
      }

      priceFilteredWatches = removeDuplicateWatches(priceFilteredWatches);
    } else {
      priceFilteredWatches = sizeFilteredWatches;
    }

    if (wireFilters.isNotEmpty) {
      for (var filter in wireFilters) {
        var newWatches = priceFilteredWatches.where((watch) {
          bool matches = true;

          if (filter.wire != null) {
            matches = matches && watch.wireCategory == filter.wire;
          }

          return matches;
        }).toList();
        wireFilteredWatches = [...wireFilteredWatches, ...newWatches];
      }

      wireFilteredWatches = removeDuplicateWatches(wireFilteredWatches);
    } else {
      wireFilteredWatches = priceFilteredWatches;
    }

    if (factoryFilters.isNotEmpty) {
      for (var filter in factoryFilters) {
        var newWatches = wireFilteredWatches.where((watch) {
          bool matches = true;

          if (filter.factory != null) {
            matches = matches && watch.machineCategory == filter.factory;
          }

          return matches;
        }).toList();
        factoryFilteredWatches = [...factoryFilteredWatches, ...newWatches];
      }

      factoryFilteredWatches = removeDuplicateWatches(factoryFilteredWatches);
    } else {
      factoryFilteredWatches = wireFilteredWatches;
    }
    return factoryFilteredWatches;
  }

  List<Watch> removeDuplicateWatches(List<Watch> watches) {
    return watches.fold<List<Watch>>([], (uniqueWatches, watch) {
      if (!uniqueWatches.any((w) => w.id == watch.id)) {
        uniqueWatches.add(watch);
      }
      return uniqueWatches;
    });
  }
}
