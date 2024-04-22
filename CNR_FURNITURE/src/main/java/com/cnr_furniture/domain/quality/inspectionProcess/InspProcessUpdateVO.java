package com.cnr_furniture.domain.quality.inspectionProcess;

import lombok.Data;

/* 수입검사관리 - 수정 시, 필요한 객체 */
@Data
public class InspProcessUpdateVO {
    private Long qiID;              // 수입검사번호(from QUALITY_INSPECTION 테이블)

    /* 수정 모달창 1행 */
    private Long workID;            // 작업번호
    private Long processID;         // 공정번호
    private String processName;     // 공정명

    /* 수정 모달창 2행 */
    private Long lotID;             // LOT번호
    private Long machineID;         // 설비번호
    private String unit;            // 단위

    /* 수정 모달창 3행 */
    private Long dailyWorkQuantity; // 일일총작업수량
    private Long inspectionQuantity;// 검사수량
    private Long defectQuantity;    // 불량수량

    /* 수정 모달창 4행 */
    private String qsDiv1;          // 불량유형1(from QUALITY_STANDARD 테이블)
    private String qsDiv2;          // 불량유형2(from QUALITY_STANDARD 테이블)
    private String note;            // 비고(from QUALITY_INSPECTION 테이블)
}
