package com.cnr_furniture.service;

import com.cnr_furniture.domain.ItemInfoVO;

import java.util.List;

public interface ItemInfoService {

    List<ItemInfoVO> getItemInfoList();

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
