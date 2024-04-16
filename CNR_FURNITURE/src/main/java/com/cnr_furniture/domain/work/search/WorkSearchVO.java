package com.cnr_furniture.domain.work.search;


import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 검색을 위한 클래스
 */
@Getter
@Setter
public class WorkSearchVO {
    private String type;                        // 이름/번호 선택
    private String keyword;                     // 검색 입력값
    private String find_work_company;           // 거래처 검색
    private String find_work_item;              // 제품 검색
    private String workStartDate;               // 지시 시작 날짜
    private String workEndDate;                 // 지시 종료 날짜
    private String find_work_instruction;       // 제조 지시의 제조LOT번호
    private String find_work_processInfo;       // 공정번호
    private String find_work_id;                // 작업번호


    private List<WorkSelectCompanyVO> companyList;          // 회사 리스트
    private List<WorkSelectItemVO> itemList;                // 제품 리스트
    private List<WorkSelectInstructionVO> instructionList;  // 제조지시 정보 리스트
    private List<WorkSelectProcessInfoVO> processInfoList;  // 공정 정보 리스트


    public String[] getTypeArr() {
        return type == null? new String[] {}: type.split("");
    }

}
