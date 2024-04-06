package com.cnr_furniture.service;

import com.cnr_furniture.domain.ItemInfo.ItemInfoSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;

import java.util.List;

public interface ItemInfoService {

    List<ItemInfoVO> getItemInfoList(ItemInfoSearch itemInfoSearch);

    ItemInfoVO getOneItem(int i_id);

    int insertItem(
          String i_name,
          String i_color,
          String i_standard,
          String i_type,
          String i_uses
    );

    int updateItem(
            String i_name,
            String i_color,
            String i_standard,
            String i_type,
            String i_uses,
            int i_id
    );
}
