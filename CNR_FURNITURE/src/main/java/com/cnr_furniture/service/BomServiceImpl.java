package com.cnr_furniture.service;

import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoSearch;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;
import com.cnr_furniture.domain.bom.BomSearch;
import com.cnr_furniture.domain.bom.BomVO;
import com.cnr_furniture.mapper.BomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Log4j
@Service
public class BomServiceImpl implements BomService{

    @Autowired
    BomMapper bomMapper;

    @Override
    public List<ItemInfoVO> getBomInfoList(BomSearch bomSearch) {
        return bomMapper.getBomInfoList(bomSearch);
    } //전체 조회

    @Override
    public List<BomVO> getListBom(int i_id) {
        return bomMapper.getListBom(i_id);
    }

    @Override
    public List<BomVO> getBomDetails() {
        return bomMapper.getBomDetails();
    }

    @Override
    public List<MaterialInfoVO> getMaterialList(MaterialInfoSearch mtSearch) {
        return bomMapper.getMaterialList(mtSearch);
    }

    @Override
    public int modify(BomVO bomVO) {
        int rtn = bomMapper.update(bomVO);
        return rtn;
    }

    @Override
    public int insertBomList(BomVO bomVO) {
//        int rtn = 0;
//        try {
//            rtn = bomMapper.addBomList(bomVO);
//        } catch (Exception e) {
//            rtn = -1;
//        }
//
//        return rtn;
        return bomMapper.addBomList(bomVO);
    }

    /*try catch*/
}
