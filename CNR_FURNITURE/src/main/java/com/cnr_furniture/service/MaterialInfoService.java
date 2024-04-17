package com.cnr_furniture.service;

import com.cnr_furniture.domain.MaterialInfo.MaterialInfoSearch;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;

import java.util.List;

public interface MaterialInfoService {
    
    /** 자재 조회 및 검색 **/
    List<MaterialInfoVO> getMaterialInfo(MaterialInfoSearch MTInfoSearch);

    /** 자재 등록 **/
    int insertMaterial(
            String m_name,
            String m_uses
    );

    /** 수정 할 자재 조회 **/
    MaterialInfoVO getOneMaterial(int m_id);

    /** 자재 수정 **/
    int updateMaterial(
            String m_name,
            String m_uses,
            int m_id
    );
}
