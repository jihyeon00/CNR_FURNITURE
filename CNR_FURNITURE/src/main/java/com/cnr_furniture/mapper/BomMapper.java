package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.bom.BomSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;
import com.cnr_furniture.domain.bom.BomVO;

import java.util.List;

public interface BomMapper {

    List<ItemInfoVO> getBomInfoList(BomSearch bomSearch); //BOM관리 제품목록 조회, 검색

    List<BomVO> getBomDetails(); //BOM관리 bom 세부목록 조회

    List<BomVO>  getListBom(int i_id); // BOM관리 제품번호 한개 값 가져오기

    List<BomVO> getBomListForInsert(BomSearch bomSearch); //BOM 등록의 자재목록 조회, 검색

}
