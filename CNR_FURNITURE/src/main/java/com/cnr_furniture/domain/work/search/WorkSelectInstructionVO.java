package com.cnr_furniture.domain.work.search;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 제조계획 테이블
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkSelectInstructionVO {
    private int insLotId;
    private int insItemId;
    private int insEmpId;
    private int insCtId;
    private int insPiId;
    private int insLotSize;
    private String insStartDate;
    private String insEndDate;
}
