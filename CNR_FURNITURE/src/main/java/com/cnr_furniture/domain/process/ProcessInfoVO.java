package com.cnr_furniture.domain.process;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProcessInfoVO {
    private int pi_id;
    private int pi_machine_id;
    private String pi_name;
    private String pi_seq;
}
