package com.cnr_furniture.domain.quality;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/* inspectionIB 에서 검색을 위한 VO */
@Data
public class CriteriaInspIBVO {   // 자재번호, 계약번호, 제조LOT번호, 불량유형1, 불량유형2, 검사일자(입고일자) 2개
    // 페이지 상단 - 검색창의 검색을 위함
    private Long contractID;
    private Long matID;
    private String qsDiv1;
    private String qsDiv2;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inspectionDate1;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inspectionDate2;

    // 모달용
    private Long contractIDModal;
    private Long matIDModal;
    private String qsDiv1Modal;
    private String qsDiv2Modal;

    /* inspectionIB 검색 옵션 */
    public CriteriaInspIBVO() {}
    public CriteriaInspIBVO(
            // 검색용
            Long contractID,
            Long matID,
            String qsDiv1,
            String qsDiv2,
            Date inspectionDate1,
            Date inspectionDate2,

            // 모달용
            Long contractIDModal,
            String qsDiv1Modal,
            String qsDiv2Modal
    ) {
        // 검색용
        this.contractID = contractID;
        this.matID = matID;
        this.qsDiv1 = qsDiv1;
        this.qsDiv2 = qsDiv2;
        this.inspectionDate1 = inspectionDate1;
        this.inspectionDate2 = inspectionDate2;

        // 모달용
        this.contractIDModal = contractIDModal;
        this.qsDiv1Modal =qsDiv1Modal;
        this.qsDiv2Modal = qsDiv2Modal;
    }

}
