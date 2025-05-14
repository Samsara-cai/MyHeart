#include "Arrays.h"
#include <unordered_map>
#include <algorithm>

/**
 * @brief 时间复杂度0(N^2)   控件复杂度O(1)
 */
std::vector<std::pair<int,int>> getTargetSumIndex(const std::vector<int>& arrays,int target)
{
    std::vector<std::pair<int,int>>  res;

    int startIndex;
    for (int i = 0; i < arrays.size(); ++i) {
        startIndex = i+1;
        for(int m = startIndex;m<arrays.size();++m)
        {
            if(arrays[i] + arrays[m] == target)
            {
                std::pair<int,int>temp;
                temp.first = i;
                temp.second = m;
                res.push_back(temp);
            }
        }
    }
    return res;
}


std::pair<int,int> getTargetSumOneIndex(const std::vector<int>& arrays,int target){
    //利用hash表的思路
    std::unordered_map<int,int>res;
    for (int i = 0; i < arrays.size(); ++i) {
        int x = target-arrays[i];
        auto ite = res.find(x);
        if(ite!=res.end())
        {
            return std::pair<int,int>(ite->second,i);
        }
        res[arrays[i]] = i;
    }
    return std::pair<int,int>();

    // //不允许利用hash表时的解法:对下标排序之后用双指针遍历
    // std::vector<int> index(arrays.size());
    // for(int i = 0;i<arrays.size();++i)
    //     index[i] = i;
    // //对下标数组按照原数组的大小进行排序
    // std::sort(index.begin(),index.end(),[&arrays](int a,int b){return arrays[a]<arrays[b];});
    // int l =0,r=index.size()-1;
    // while(arrays[index[l]]+arrays[index[r]]!=target)
    // {
    //     if(arrays[index[l]]+arrays[index[r]]>target) --r;
    //     else ++l;
    // }
    // return std::pair<int,int>(index[l],index[r]);
}



float getMediaSortedArray(std::vector<int> nums1,std::vector<int> nums2)
{
    /**
     * @brief 求两个正向排列的数组中第K小的数字
     * @param A 数组1
     * @param aIndex 数组1的参与比较的第一个元素的下标
     * @param B 数组2
     * @param bIndex 数组2的参与比较的第一个元素的下标
     * @param k 第k小
     */
    auto getKth = [](const std::vector<int> &A,int aIndex,const std::vector<int>& B ,int bIndex,int k)->int{
        int aNewIndex,bNewIndex;
        int offset = k/2;

    };

    int size1 = nums1.size();
    int size2 = nums2.size();


    if(size1 == 0 && size2 ==0)
        return -1;

    int k1 = (size1+size2 + 1)/2;
    int k2 = (size1+size2 + 2)/2;

    //奇数就多求一次，求均值
    k1 = getKth(nums1,0,nums2,0,k1);
    k2 = getKth(nums1,0,nums2,0,k2);

    return (k1 + k2)/2;
}
