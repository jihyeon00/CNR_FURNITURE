package com.cnr_furniture.service;

import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;
import com.cnr_furniture.domain.bom.BomSearch;
import com.cnr_furniture.domain.bom.BomVO;

import java.util.List;

public interface BomService {

    List<ItemInfoVO> getBomInfoList(BomSearch bomSearch); //전체 조회

    List<BomVO> getListBom(int i_id); // 리스트 조회

    List<BomVO> getBomDetails();

}
