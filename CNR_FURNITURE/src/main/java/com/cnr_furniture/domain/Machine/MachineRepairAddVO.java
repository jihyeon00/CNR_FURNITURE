package com.cnr_furniture.domain.Machine;

import lombok.Data;

/**
 * 설비 수리 이력 관리  추가하는 VO
 */
@Data
public class MachineRepairAddVO {
    private int mr_id;      // 설비수리이력번호
    private  int mw_mi_id;  // 설비 번호
    private int mcr_id;  // 설비 체크 기록 번호
    private String mr_date; // 수리날짜
}
