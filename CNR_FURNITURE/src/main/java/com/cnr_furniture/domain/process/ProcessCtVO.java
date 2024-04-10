package com.cnr_furniture.domain.process;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProcessCtVO {
    private int rn;
    private int ct_id;
    private int ct_item_id;
    private String ct_date;
    private int ct_quantity;
    private String ct_ib_date;
    private String ct_ob_date;
}
