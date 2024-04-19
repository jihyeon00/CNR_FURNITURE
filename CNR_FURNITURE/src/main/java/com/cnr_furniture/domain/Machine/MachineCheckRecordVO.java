package com.cnr_furniture.domain.Machine;

import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class MachineCheckRecordVO {
    private int mcr_id;     // 설비 체크 기록 번호
    private int mcr_mci_id; // 설비 체크 기준 번호
    private int mcr_mi_id;  // 설비 번호
    private int mcr_emp_id; // 작성자 번호
    private String mcr_date;   // 설비체크날짜
    private String mcr_answer;  // 답변(Y / N)
    private String mcr_note;    // 비고

}
