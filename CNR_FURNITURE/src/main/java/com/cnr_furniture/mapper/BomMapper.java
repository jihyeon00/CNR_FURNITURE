package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.MaterialInfo.MaterialInfoSearch;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;
import com.cnr_furniture.domain.bom.BomSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;
import com.cnr_furniture.domain.bom.BomVO;

import java.util.List;

public interface BomMapper {

    List<ItemInfoVO> getBomInfoList(BomSearch bomSearch); //BOM 관리 제품목록 조회, 검색

    List<BomVO> getBomDetails(); //BOM 관리 bom 세부목록 조회

    List<BomVO>  getListBom(int i_id); // BOM 관리 제품번호 한개 값 가져오기

    List<MaterialInfoVO> getMaterialList(MaterialInfoSearch mtSearch); //*BOM 등록의 자재목록 조회, 검색

    int update(BomVO bomVO); //Bom 관리 수정
    
    int updateAll(BomVO bomVO); //*Bom 등록 추가 후 전체수정
    int addBomList (BomVO bomVO); //*BOM 등록

    /*int removeBomInserted(int rn);*/
}
