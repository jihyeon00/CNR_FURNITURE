package com.cnr_furniture.domain.quality;

import lombok.Data;

import java.util.Date;

/**
 * inspectionIB의 [자재불량등록] 시, INSERT에 필요한 VO
 */
@Data
public class InspectionIBInsertVO {
    /* 등록 모달창 1행 */
    private Long matID;                 // 자재번호(from Material 테이블), [검색 keyword]
    private String matName;             // 자재명(from Material 테이블)
    private String units;               // 단위(from Contract 테이블)

    /* 등록 모달창 2행 */
    private Long contractID;            // 계약번호(from Contract 테이블), [검색 keyword]
    private String companyName;         // 거래처명(from Contract 테이블의 ct_id에 포함된 ct_company_id를 join하여,
                                        //         Company 테이블에서 c_name을 조회)
    private String matUses;             // 자재용도(from Material 테이블)

    /* 등록 모달창 3행 */
    private Date inspectionDate;        // 검사일자(입고일자), (from Quality_Inspection 테이블)
    private Long contractQuantity;      // 계약수량/계약입고수량(from Contract 테이블)
    private Long inspectionQuantity;    // 검사수량(실제 입고되어 검사한 수량, from Quality_Inspection 테이블)

    /* 등록 모달창 4행 */
    private String qsDiv1;              // 불량유형1(from Quality_Standard 테이블), [검색 keyword]
    private String qsDiv2;              // 불량유형2(from Quality_Standard 테이블)
    private Long poorQuantity;          // 불량수량(from Quality_Inspection 테이블)

    /* 등록 모달창 5행 */
    private String notes;               // 비고(from Quality_Inspection 테이블)

}
