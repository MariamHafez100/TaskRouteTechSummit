import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_assets.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewCardItem extends StatefulWidget {
  Products productEntity ;
  GridViewCardItem({required this.productEntity});

  @override
  State<GridViewCardItem> createState() => _GridViewCardItemState();
}

class _GridViewCardItemState extends State<GridViewCardItem> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  widget.productEntity.images?.isNotEmpty == true ? widget.productEntity.images!.first : "",
                  fit: BoxFit.cover,
                  width: 191.w,
                  height: 119.h,
                ),
              ),
              Positioned(
                top: 5.h,
                right: 2.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: IconButton(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      isFav = true;
                      setState(() {
                      });
                    },
                    icon: isFav == true
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(
                            Icons.favorite_border_rounded,
                          ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              widget.productEntity.title??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp,
                color: AppColors.darkPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  "EGP ${widget.productEntity.price} ",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5,),
                Text("${widget.productEntity.discountPercentage}",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.babyblueColor,
                  decorationThickness: 2.0,
                  color: AppColors.babyblueColor,
                  fontSize: 14.sp,
                ), ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              children: [
                Text(
                  "Review (${widget.productEntity.rating})",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Image.asset(
                  MyAssets.starIcon,
                ),
                 Spacer(
                 // flex: 1,
                ),
                InkWell(
                  onTap: () {

                  },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          )
          // GridViewCardItemBody(
          //   productEntity: productEntity,
          // )
        ],
      ),
    );
  }
}
