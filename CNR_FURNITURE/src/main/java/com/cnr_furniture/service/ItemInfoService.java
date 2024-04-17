package com.cnr_furniture.service;

import com.cnr_furniture.domain.ItemInfo.ItemInfoSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;

import java.util.List;

public interface ItemInfoService {
    
    
    /** 제품 조회 및 검색 **/
    List<ItemInfoVO> getItemInfoList(ItemInfoSearch itemInfoSearch);

    /** 수정할 제품 값 불러오기 **/
    ItemInfoVO getOneItem(int i_id);

    /** 제품 등록 **/
    int insertItem(
          String i_name,
          String i_color,
          String i_standard,
          String i_type,
          String i_uses
    );

    /** 제품 수정 **/
    int updateItem(
            String i_name,
            String i_color,
            String i_standard,
            String i_type,
            String i_uses,
            int i_id
    );
}
