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

    /** BOM관리 제품목록 조회, 검색 **/
    @Override
    public List<ItemInfoVO> getBomInfoList(BomSearch bomSearch) {
        return bomMapper.getBomInfoList(bomSearch);
    } //전체 조회

    /** BOM관리 제품번호 한 개 값 가져오기 **/
    @Override
    public List<BomVO> getListBom(int i_id) {
        return bomMapper.getListBom(i_id);
    }

    /** BOM관리 bom 세부목록 조회 **/
    @Override
    public List<BomVO> getBomDetails() {
        return bomMapper.getBomDetails();
    }

    /** BOM Insert 자재목록 조회, 검색 **/
    @Override
    public List<MaterialInfoVO> getMaterialList(MaterialInfoSearch mtSearch) {
        return bomMapper.getMaterialList(mtSearch);
    }

    /** BOM관리 BOM수정 **/
    @Override
    public int modify(BomVO bomVO) {
        int rtn = bomMapper.update(bomVO);
        return rtn;
    }

    /** Bom Insert bom추가 후 수정**/
    @Override
    public int modifyAll(BomVO bomVO) {
        int rtn = bomMapper.updateAll(bomVO);
        return rtn;
    }


    /** Bom Insert bom추가 **/
    @Override
    public int insertBomList(BomVO bomVO) {
        return bomMapper.addBomList(bomVO);
    }


}
