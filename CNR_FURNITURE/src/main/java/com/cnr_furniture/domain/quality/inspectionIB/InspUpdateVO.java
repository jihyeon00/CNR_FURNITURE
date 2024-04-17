package com.cnr_furniture.domain.quality.inspectionIB;

import lombok.Data;

/* 수입검사관리 - 수정 시, 필요한 객체 */
@Data
public class InspUpdateVO {
    private Long qiID;      // 수입검사번호(from QUALITY_INSPECTION 테이블)
    private String qsDiv1;  // 불량유형1(from QUALITY_STANDARD 테이블)
    private String qsDiv2;  // 불량유형2(from QUALITY_STANDARD 테이블)
    private String notes;   // 비고(from QUALITY_INSPECTION 테이블)

    private String qsDiv1Modal; // 수정 모달창 option1에 따른 option2 위함.(insert 모달의 xml 함수 그대로 사용해서 그러함.)
    private String qsDiv2Modal;
}
