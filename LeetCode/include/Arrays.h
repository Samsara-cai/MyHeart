#ifndef ARRAYS_H
#define ARRAYS_H

#include <vector>
#include "Define.h"

/**
 * @brief 从数组中求两元素之和等于target的元素下标。符合条件的元素组合有多个，但是元素组合不能重复
 * @param arrays 源数组
 * @param target 目标值
 * @return
 */
LEETCODE_API std::vector<std::pair<int,int>> getTargetSumIndex(const std::vector<int>& arrays,int target);


/**
 * @brief 从数组中求两元素之和等于target的元素下标。符合条件的元素组合只有一个
 * @param arrays 源数组
 * @param target 目标值
 * @return
 */
LEETCODE_API std::pair<int,int> getTargetSumOneIndex(const std::vector<int>& arrays,int target);

/**
 * @brief 从两个正向排列的数组中，找出中位数。
 * @param nums1
 * @param nums2
 * @return
 */
LEETCODE_API float getMediaSortedArray(std::vector<int> nums1,std::vector<int> nums2);

/**
 * @brief 给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。
          找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
          返回height数组可以储存的最大水量。
 */
LEETCODE_API float getMediaSortedArray(std::vector<int> nums1);

#endif // DEFINE_H
