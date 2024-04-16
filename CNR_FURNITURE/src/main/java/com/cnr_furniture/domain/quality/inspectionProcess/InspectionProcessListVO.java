package com.cnr_furniture.domain.quality.inspectionProcess;

import lombok.Data;

import java.util.Date;

/**
 * [공정검사관리] - 검색 및 현황(목록) 조회
 * '/inspectionProcess'
 */
@Data
public class InspectionProcessListVO {
    private Long qiID;                  // 검사번호(수정할 때, 보내줘야함)
    private Long listSeq;               // 번호
    private Long workID;                // 작업번호(WORK 테이블), [검색 keywork]
    private Long lotID;                 // lot번호(WORK 테이블), [검색 keywork]
    private Long machineID;             // 설비번호(Machine_Info 테이블: 작업번호의 lotID, 공정ID를 추적한... 더 보완할 것.), [검색 keywork]
    private Long processID;             // 공정번호(WORK 테이블), [검색 keywork]
    private String processName;         // 공정명(PROCESS_INFO 테이블: work 테이블의 공정번호와 동일한 번호의 공정명), [검색 keywork]
    private String unit;                // 단위(계약?BOM?)
    private Long dailyWorkQuantity;     // 일일총생산량(WORK 테이블: W_ITEM_QUANTITY)
    private Long inspectionQuantity;    // 검사수량(Quality_Inspection 테이블)
    private Long defectQuantity;        // 불량수량(Quality_Inspection 테이블)
    private Long defectRate;            // 불량률 = (불량품 수 / 검사수량) * 100
    private Long goodQuantity;          // 양품수량(Quality_Inspection 테이블)
    private String qsDiv1;              // 불량유형1(Quality_Standard), [검색 keywork]
    private String qsDiv2;              // 불량유형2(Quality_Standard), [검색 keywork]
    private Date inspectionDate;        // 검사일자
    private String note;                // 비고(Quality_Inspection 테이블)
}
