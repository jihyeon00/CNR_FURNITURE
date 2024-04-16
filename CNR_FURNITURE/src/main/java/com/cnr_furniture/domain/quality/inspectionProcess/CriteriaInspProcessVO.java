package com.cnr_furniture.domain.quality.inspectionProcess;

import lombok.Data;

/**
 * [공정검사관리] - 검색(/inspectionProcess)
 */
@Data
public class CriteriaInspProcessVO {
    // 페이지 상단 - 검색용
    private Long lotID;
    private Long processID;
    private String processName;
    private String qsDiv1;
    private String qsDiv2;
    private Long workID;
    private Long machineID;

    /* inspectionProcess 검색 옵션 */
    public CriteriaInspProcessVO() {}
    public CriteriaInspProcessVO(
        // 검색용
        Long lotID,
        Long processID,
        String processName,
        String qsDiv1,
        String qsDiv2,
        Long workID,
        Long machineID
    ) {
        this.lotID = lotID;
        this.processID = processID;
        this.processName = processName;
        this.qsDiv1 = qsDiv1;
        this.qsDiv2 = qsDiv2;
        this.workID = workID;
        this.machineID = machineID;
    }
}
