package com.cnr_furniture.service;

import com.cnr_furniture.domain.MaterialInfo.MaterialInfoSearch;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;

import java.util.List;

public interface MaterialInfoService {

    List<MaterialInfoVO> getMaterialInfo(MaterialInfoSearch MTInfoSearch);

    int insertMaterial(
            String m_name,
            String m_uses
    );

    MaterialInfoVO getOneMaterial(int m_id);

    int updateMaterial(
            String m_name,
            String m_uses,
            int m_id
    );
}
