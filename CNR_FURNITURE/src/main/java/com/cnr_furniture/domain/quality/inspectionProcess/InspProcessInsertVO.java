package com.cnr_furniture.domain.quality.inspectionProcess;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/* '/inspectionProcess' (공정불량등록) - [등록] 모달창 VO */
@Data
public class InspProcessInsertVO {
    private Long workID;            // 작업번호
    private Long processID;         // 공정번호
    private String processName;     // 공정명

    private Long lotID;             // 제조LOT번호
    private Long machineID;         // 설비번호
    private String unit;            // 단위

    private Long dailyWorkQuantity; // 일일총작업수량
    private Long inspectionQuantity;// 검사수량
    private Long defectQuantity;    // 불량수량

    private String qsDiv1;          // 불량유형1
    private String qsDiv2;          // 불량유형2
    private String note;            // 비고

    /* 입력칸에 입력 시, 필요하지는 않으나,
    * [추가] 버튼을 누른 후, 조회하는데 필요한 객체 */
    private Long listSeq;
    // Long: 정수형이므로, 불량률(소숫점) 표현에 적합하지 않음.
    // BigDecimal: 금융이나 정밀 계산이 필요한 애플리케이션에서 BigDecimal을 사용하면 더욱 정확한 계산이 가능
    private BigDecimal defectRate;  // 불량률 = (불량품 수 / 검사수량) * 100
    private Long goodQuantity;      // 양품수량
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inspectionDate;    // 검사일자

    /* 품질검사ID를 미리 조회하고, 이를 이용하여 INSERT
    * 사유: 서브쿼리는 기능저하를 일으킬 수 있음 */
    private Long qsID;              // [불량유형1], [불량유형2]에 따른 [불량기준ID]

}
