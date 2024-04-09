package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.bom.BomSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;
import com.cnr_furniture.domain.bom.BomVO;

import java.util.List;

public interface BomMapper {

    List<ItemInfoVO> getBomInfoList(BomSearch bomSearch); //제품목록 조회

    List<BomVO>  getListBom(int i_id); // 제품의 bom 리스트

    List<BomVO> getBomDetails();

}
