package com.cnr_furniture.domain.quality;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * inspectionIB의 [자재불량등록] 시, INSERT에 필요한 VO
 */
@Data
public class InspectionIBInsertVO {
    /* 등록 모달창 1행 */
    private Long contractIDModal;           // 계약번호(from Contract 테이블), [검색 keyword]
    private String companyNameModal;        // 거래처명(from Contract 테이블의 ct_id에 포함된 ct_company_id를 join하여,
                                            //         Company 테이블에서 c_name을 조회)
    private String unitModal;               // 단위(from Contract 테이블)

    /* 등록 모달창 2행 */
    private Long matIDModal;                // 자재번호(from Material 테이블), [검색 keyword]
    private String matNameModal;            // 자재명(from Material 테이블)
    private String matUsesModal;            // 자재용도(from Material 테이블)

    /* 등록 모달창 3행 */
    private Long contractQuantityModal;     // 계약수량/계약입고수량(from Contract 테이블)
    private Long inspectionQuantityModal;   // 검사수량(실제 입고되어 검사한 수량, from Quality_Inspection 테이블)
    private Long poorQuantityModal;         // 불량수량(from Quality_Inspection 테이블)

    /* 등록 모달창 4행 */
    private String qsDiv1Modal;             // 불량유형1(from Quality_Standard 테이블), [검색 keyword]
    private String qsDiv2Modal;             // 불량유형2(from Quality_Standard 테이블)

    /* 등록 모달창 5행 */
    private String notesModal;              // 비고(from Quality_Inspection 테이블)


    /* 모달의 입력칸에는 없으나, [추가] 버튼 누른 후, 목록 보여주는데에는 한 객체들 */
    private Long listSeqModal;              // 테이블 행번호
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inspectionDateModal;       // 검사일자(입고일자), (from Quality_Inspection 테이블)
    private Long goodQuantityModal;         // 양품수량(from Quality_Inspection 테이블)
    private Long defectRateModal;           // 불량률(from Quality_Inspection 테이블에서 가져온 값을 계산)
                                            // 불량률 = (불량품 수 / 전체 수량) * 100

}
