package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.ItemInfo.ItemInfoSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;

import java.util.List;

public interface ItemInfoMapper {

    List<ItemInfoVO> getItemInfoList(ItemInfoSearch itemInfoSearch); //제품 조회 및 검색

    ItemInfoVO getOneItem(int i_id); //수정할 제품 값 불러오기
    int addItem(ItemInfoVO itemInfoVO); //제품 등록

    int modifyList(ItemInfoVO itemInfoVO);  //제품 수정
}
