package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.ItemInfoVO;

import java.util.List;

public interface ItemInfoMapper {

    List<ItemInfoVO> getItemInfoList();

    int addItem(ItemInfoVO itemInfoVO);

    int modifyList(ItemInfoVO itemInfoVO);
}
