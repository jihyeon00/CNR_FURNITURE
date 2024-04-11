package com.cnr_furniture.domain.quality;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/* inspectionIB 에서 검색을 위한 VO */
@Data
public class CriteriaInspIBVO {   // 자재번호, 계약번호, 제조LOT번호, 불량유형1, 불량유형2, 검사일자(입고일자) 2개
    private Long matID;
    private Long contractID;
    private String qsDiv1;
    private String qsDiv2;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inspectionDate1;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inspectionDate2;

    /* inspectionIB 검색 옵션 */
    public CriteriaInspIBVO() {}
    public CriteriaInspIBVO(
            Long matID,
            Long contractID,
            String qsDiv1,
            String qsDiv2,
            Date inspectionDate1,
            Date inspectionDate2
    ) {
        this.matID = matID;
        this.contractID = contractID;
        this.qsDiv1 = qsDiv1;
        this.qsDiv2 = qsDiv2;
        this.inspectionDate1 = inspectionDate1;
        this.inspectionDate2 = inspectionDate2;
    }
}
