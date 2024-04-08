package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.MaterialInfo.MaterialInfoSearch;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;

import java.util.List;

public interface MaterialInfoMapper {

    List<MaterialInfoVO> getMaterialInfo(MaterialInfoSearch MTInfoSearch);

    int addMaterial (MaterialInfoVO materialInfoVO);

    MaterialInfoVO getOneMaterial (int m_id);

    int modifyMaterial(MaterialInfoVO materialInfoVO);

}
