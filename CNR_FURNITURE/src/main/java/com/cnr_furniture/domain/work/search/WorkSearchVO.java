package com.cnr_furniture.domain.work.search;


import com.cnr_furniture.domain.work.workMNG.WorkVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Desc: Work의 검색을 위한 VO
 */
@Getter
@Setter
public class WorkSearchVO {
    private String type;                        // 이름/번호 선택
    private String keyword;                     // 검색 입력값
    private String find_work_company;           // 거래처 검색
    private String find_work_item;              // 제품 검색
    private String workStartDate;               // 시작 날짜
    private String workEndDate;                 // 종료 날짜
    private String find_work_instruction;       // 제조 지시의 제조LOT번호
    private String find_work_processInfo;       // 공정번호
    private String find_work_id;                // 작업번호
    private String find_dp_name;                // 작업팀
    private String find_work_machine;           // 설비번호
    private String find_emp_id;                 // 사원번호


    private List<WorkSelectCompanyVO> companyList;          // 회사 리스트
    private List<WorkSelectItemVO> itemList;                // 제품 리스트
    private List<WorkSelectInstructionVO> instructionList;  // 제조지시 정보 리스트
    private List<WorkSelectProcessInfoVO> processInfoList;  // 공정 정보 리스트
    private List<WorkSelectMachineInfoVO> machineInfoList;  // 설비 정보 리스트
    private List<WorkSelectWorkVO> workList;                // 작업 리스트
    private List<WorkVO> dpNameList;                        // 부서명 리스트


    public String[] getTypeArr() {
        return type == null? new String[] {}: type.split("");
    }

}
