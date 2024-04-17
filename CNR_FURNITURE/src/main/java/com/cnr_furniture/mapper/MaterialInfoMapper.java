package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.MaterialInfo.MaterialInfoSearch;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;

import java.util.List;

public interface MaterialInfoMapper {

    List<MaterialInfoVO> getMaterialInfo(MaterialInfoSearch MTInfoSearch); //자재 조회 및 검색

    int addMaterial (MaterialInfoVO materialInfoVO); //자재 등록

    MaterialInfoVO getOneMaterial (int m_id); //수정할 자재 가져오기

    int modifyMaterial(MaterialInfoVO materialInfoVO); //자재 수정

}
