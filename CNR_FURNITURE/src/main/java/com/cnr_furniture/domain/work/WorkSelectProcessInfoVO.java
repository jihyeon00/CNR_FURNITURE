package com.cnr_furniture.domain.work;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkSelectProcessInfoVO {
    private int pi_id;
    private int pi_machine_id;
    private String pi_name;
    private String mi_name;
    private String position;
}
