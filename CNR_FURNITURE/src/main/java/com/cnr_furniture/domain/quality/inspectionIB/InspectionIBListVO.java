package com.cnr_furniture.domain.quality.inspectionIB;

import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * inspectionIB 에서 테이블 조회하는 VO (with. 검색 기능 포함)
 *  */
@Data
public class InspectionIBListVO {
    /* 테이블 조회내용 */
    private Long listSeq;               // 테이블 행번호
    private Long qiID;                  // 품질검사 번호(from Qualisty_Inspection 테이블)

    private Long matID;                 // 자재번호(from Material 테이블), [검색 keyword]
    private String matName;             // 자재명(from Material 테이블)
    private String matUses;             // 자재용도(from Material 테이블)

    private Long contractID;            // 계약번호(from Contract 테이블), [검색 keyword]
    private String companyName;         // 거래처명(from Contract 테이블의 ct_id에 포함된 ct_company_id를 join하여,
                                        //         Company 테이블에서 c_name을 조회)
    private String units;               // 단위(from Contract 테이블)
    private Long contractQuantity;      // 계약수량/계약입고수량(from Contract 테이블)

    private Long inspectionQuantity;    // 검사수량(실제 입고되어 검사한 수량, from Quality_Inspection 테이블)
    private Long poorQuantity;          // 불량수량(from Quality_Inspection 테이블)
    private Long defectRate;            // 불량률(from Quality_Inspection 테이블에서 가져온 값을 계산)
                                        // 불량률 = (불량품 수 / 전체 수량) * 100
    private Long goodQuantity;          // 양품수량(from Quality_Inspection 테이블)
    private Date inspectionDate;        // 검사일자(입고일자), (from Quality_Inspection 테이블)
    private String notes;               // 비고(from Quality_Inspection 테이블)

    private String qsDiv1;              // 불량유형1(from Quality_Standard 테이블), [검색 keyword]
    private String qsDiv2;              // 불량유형2(from Quality_Standard 테이블), [검색 keyword]
    private Date inspectionDate1;       // 검사일자1(입고일자1), (from 검색창에서 입력된 것을 Quality_Inspection 테이블에서 검색), [검색 keyword]
    private Date inspectionDate2;       // 검사일자2(입고일자2), (from 검색창에서 입력된 것을 Quality_Inspection 테이블에서 검색), [검색 keyword]

    // 날짜 포맷을 위한 SimpleDateFormat 정의
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public String getFormattedInspectionDate() {
        return formatDateTime(this.inspectionDate);
    }

    public String getFormattedInspectionDate1() {
        return formatDateTime(this.inspectionDate1);
    }

    public String getFormattedInspectionDate2() {
        return formatDateTime(this.inspectionDate2);
    }

    // 날짜 포맷을 적용하는 메소드
    private String formatDateTime(Date date) {
        if (date == null) return null;
        return dateFormat.format(date);
    }
}
