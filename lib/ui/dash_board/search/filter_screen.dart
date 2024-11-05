import 'package:flutter/material.dart';
import 'package:flutter_mob/configs/colors.dart';
import 'package:flutter_mob/configs/constants.dart';
import 'package:flutter_mob/configs/themes.dart';
import 'package:flutter_mob/models/filter.dart';
import 'package:flutter_mob/ui/components/app_bar/app_bar_title.dart';
import 'package:flutter_mob/ui/components/button/button_normal.dart';
import 'package:flutter_mob/ui/components/input/input_field.dart';
import 'package:flutter_mob/ui/components/scroll_behavior/scroll_behavior.dart';
import 'package:flutter_mob/ui/components/text/text_normal.dart';

class FilterScreen extends StatefulWidget {
  final List<Filter> listSelectedFilter;

  const FilterScreen({super.key, required this.listSelectedFilter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final TextEditingController editingStartPriceController =
      TextEditingController();
  final TextEditingController editingEndPriceController =
      TextEditingController();
  List<Filter> listSelectedFilter = [];

  @override
  void initState() {
    listSelectedFilter = widget.listSelectedFilter;
    int existedMinPriceFilter =
        listSelectedFilter.indexWhere((element) => element.title == "minPrice");
    int existedMaxPriceFilter =
        listSelectedFilter.indexWhere((element) => element.title == "maxPrice");
    if (existedMinPriceFilter >= 0) {
      editingStartPriceController.text =
          listSelectedFilter[existedMinPriceFilter]
              .queryPrice!
              .startPrice
              .toString();
    }
    if (existedMaxPriceFilter >= 0) {
      editingEndPriceController.text = listSelectedFilter[existedMaxPriceFilter]
          .queryPrice!
          .endPrice
          .toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                AppBarTitle(appTitle: StringName.filter),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 6,
                              ),
                              TextNormal(
                                title: StringName.sizeWatch,
                                fontName: AppThemes.dmSerifDisplay,
                                size: 22,
                                lineHeight: 1.2,
                                colors: AppColors.black1,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                runSpacing: 12,
                                spacing: 12,
                                children: Constants.mockListSizeWatch.map((e) {
                                  return cardFilter(e);
                                }).toList(),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextNormal(
                                title: StringName.wireMaterial,
                                fontName: AppThemes.dmSerifDisplay,
                                size: 22,
                                lineHeight: 1.2,
                                colors: AppColors.black1,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                runSpacing: 12,
                                spacing: 12,
                                children:
                                    Constants.mockListWireMaterial.map((e) {
                                  return cardFilter(e);
                                }).toList(),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextNormal(
                                title: StringName.factoryMaterial,
                                fontName: AppThemes.dmSerifDisplay,
                                size: 22,
                                lineHeight: 1.2,
                                colors: AppColors.black1,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                runSpacing: 12,
                                spacing: 12,
                                children:
                                    Constants.mockListFactoryMaterial.map((e) {
                                  return cardFilter(e);
                                }).toList(),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextNormal(
                                title: StringName.priceRange,
                                fontName: AppThemes.dmSerifDisplay,
                                size: 22,
                                lineHeight: 1.2,
                                colors: AppColors.black1,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.grey3),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InputField(
                                        controller: editingStartPriceController,
                                        hintText: 'Tối thiểu',
                                        inputType: TextInputType.number,
                                        onChange: (value) {
                                          int existedFilter = listSelectedFilter
                                              .indexWhere((element) =>
                                                  element.title == "minPrice");
                                          bool isSelected = existedFilter >= 0;
                                          if (value.isNotEmpty) {
                                            double? minPrice =
                                                double.tryParse(value);
                                            if (minPrice != null) {
                                              if (isSelected) {
                                                listSelectedFilter[
                                                        existedFilter]
                                                    .queryPrice!
                                                    .startPrice = minPrice;
                                              } else {
                                                listSelectedFilter.add(Filter(
                                                    title: "minPrice",
                                                    queryPrice: QueryPrice(
                                                        startPrice: minPrice)));
                                              }
                                              setState(() {});
                                              return;
                                            }
                                          }

                                          if (isSelected) {
                                            listSelectedFilter
                                                .removeAt(existedFilter);
                                          }
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: SizedBox(
                                          width: 16,
                                          child: Divider(
                                            thickness: 2,
                                          )),
                                    ),
                                    Expanded(
                                      child: InputField(
                                        controller: editingEndPriceController,
                                        hintText: 'Tối đa',
                                        inputType: TextInputType.number,
                                        onChange: (value) {
                                          int existedFilter = listSelectedFilter
                                              .indexWhere((element) =>
                                                  element.title == "maxPrice");
                                          bool isSelected = existedFilter >= 0;
                                          if (value.isNotEmpty) {
                                            double? maxPrice =
                                                double.tryParse(value);
                                            if (maxPrice != null) {
                                              if (isSelected) {
                                                listSelectedFilter[
                                                        existedFilter]
                                                    .queryPrice!
                                                    .endPrice = maxPrice;
                                              } else {
                                                listSelectedFilter.add(Filter(
                                                    title: "maxPrice",
                                                    queryPrice: QueryPrice(
                                                        startPrice: maxPrice)));
                                              }
                                              setState(() {});
                                              return;
                                            }
                                          }

                                          if (isSelected) {
                                            listSelectedFilter
                                                .removeAt(existedFilter);
                                          }
                                          setState(() {});
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              ButtonNormal(
                                text: StringName.apply,
                                onPressed: () {
                                  Navigator.pop(context, listSelectedFilter);
                                },
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
        ],
      ),
    );
  }

  Widget cardFilter(Filter filter) {
    int existedFilter = listSelectedFilter
        .indexWhere((element) => element.title == filter.title);
    bool isSelected = existedFilter >= 0;
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          listSelectedFilter.removeAt(existedFilter);
        } else {
          listSelectedFilter.add(filter);
        }
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isSelected ? AppColors.yellow1 : AppColors.grey3),
        child: TextNormal(
          title: filter.title,
          colors: AppColors.bPrimaryColor,
          fontName: AppThemes.sourceSans,
        ),
      ),
    );
  }

  String getValueInput(String input) {
    return input.split("=").last;
  }
}
