import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:towermarket/colors/colors.dart';
import 'package:towermarket/product/bloc/category_bloc.dart';
import '../../models/category.dart';
import '../../typography/text_styles.dart';

class CategoryThumbnail extends StatefulWidget {
  final Category category;

  const CategoryThumbnail({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryThumbnail> createState() => _CategoryThumbnailState();
}

class _CategoryThumbnailState extends State<CategoryThumbnail> {
  double _bottom = -24;
  double _top = 14;

  _updateState() {
    setState(() {
      _bottom = -12;
      _top = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
          onTap: () {
            context
                .read<CategoryBloc>()
                .add(CategorySelect(category: widget.category));
            _updateState();
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 200),
                            right: 12,
                            left: 12,
                            top: 6,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: widget.category.isSelected
                                    ? TowerMarketColors.lightyellow
                                    : TowerMarketColors.lightgrey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            top: _top,
                            left: 12,
                            right: 12,
                            bottom: _bottom,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(widget.category.image),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          widget.category.title,
                          style: TowerMarketTextStyle.title3.copyWith(
                            color: TowerMarketColors.grey,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 3.5,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _SelectedThumbnail extends StatelessWidget {
//   const _SelectedThumbnail({
//     Key? key,
//     required this.category,
//   }) : super(key: key);

//   final Category category;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.read<CategoryBloc>().add(CategorySelect(category: category));
//       },
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Positioned(
//                         right: 12,
//                         left: 12,
//                         top: 6,
//                         bottom: 0,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: TowerMarketColors.lightyellow,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 8,
//                         left: 8,
//                         top: 0,
//                         bottom: -12,
//                         child: Container(
//                           alignment: Alignment.bottomCenter,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Hero(
//                               tag: 'Category',
//                               child: Image.asset(category.image)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.bottomCenter,
//                     child: Text(
//                       category.title,
//                       style: TowerMarketTextStyle.title3.copyWith(
//                         color: TowerMarketColors.black,
//                         fontWeight: TowerMarketFontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 4,
//             height: double.infinity,
//             decoration: const BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(4),
//                 bottomLeft: Radius.circular(4),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
