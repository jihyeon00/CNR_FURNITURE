package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.ItemInfo.ItemInfoSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;

import java.util.List;

public interface ItemInfoMapper {

    List<ItemInfoVO> getItemInfoList(ItemInfoSearch itemInfoSearch); //전체 조회

    ItemInfoVO getOneItem(int i_id);
    int addItem(ItemInfoVO itemInfoVO); //등록

    int modifyList(ItemInfoVO itemInfoVO);  //수정
}
