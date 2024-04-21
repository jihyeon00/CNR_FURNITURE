package com.cnr_furniture.service;
import com.cnr_furniture.domain.production.search.*;
import com.cnr_furniture.mapper.ProductionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.util.List;

@Log4j
@Service
public class ProductionServiceImpl implements ProductionService{
    @Autowired
    private ProductionMapper productionMapper;

    /** 거래처 조회 */
    @Override
    public List<ProductionSelectCompanyVO> findCompanyList() {
        return productionMapper.productionSelectCompanyList();
    }

    /** 제품 조회 */
    @Override
    public List<ProductionSelectItemVO> findItemList() {
        return productionMapper.productionSelectItemList();
    }

    /** 제조계획 조회 */
    @Override
    public List<ProductionSelectInstructionVO> findInstructionList() {
        return productionMapper.productionSelectInstructionList();
    }

    /** 공정 정보 조회 */
    @Override
    public List<ProductionSelectProcessInfoVO> findProcessInfoList() {
        return productionMapper.productionSelectProcessInfoList();
    }

    /** 설비 정보 조회 */
    @Override
    public List<ProductionSelectMachineInfoVO> findMachineInfoList() {
        return productionMapper.productionSelectMachineInfoList();
    }

    /** 작업 진행 상태 selectBox */


    /** 가동여부 selectBox */
}
