package com.cnr_furniture.domain.quality;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class InspectionUpdateVO {
    /* 등록 모달창 1행 */
    private Long editContractID;           // 계약번호(from Contract 테이블), [검색 keyword]
    private String editCompanyName;        // 거래처명(from Contract 테이블의 ct_id에 포함된 ct_company_id를 join하여,
                                            //         Company 테이블에서 c_name을 조회)
    private String editUnit;               // 단위(from Contract 테이블)

    /* 등록 모달창 2행 */
    private Long editMatID;                // 자재번호(from Material 테이블), [검색 keyword]
    private String editMatName;            // 자재명(from Material 테이블)
    private String editMatUses;            // 자재용도(from Material 테이블)

    /* 등록 모달창 3행 */
    private Long editContractQuantity;     // 계약수량/계약입고수량(from Contract 테이블)
    private Long editInspQuantity;   // 검사수량(실제 입고되어 검사한 수량, from Quality_Inspection 테이블)
    private Long editPoorQuantity;         // 불량수량(from Quality_Inspection 테이블)

    /* 등록 모달창 4행 */
    private String editQsDiv1;             // 불량유형1(from Quality_Standard 테이블), [검색 keyword]
    private String editQsDiv2;             // 불량유형2(from Quality_Standard 테이블)

    /* 등록 모달창 5행 */
    private String editNote;              // 비고(from Quality_Inspection 테이블)

    /* 모달의 입력칸에는 없으나, 수정 시 필요한 객체들 */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date editInspectionDate;       // 검사일자(입고일자), (from Quality_Inspection 테이블)
    private Long editGoodQuantity;         // 양품수량(from Quality_Inspection 테이블)
}
