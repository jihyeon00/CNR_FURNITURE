package com.cnr_furniture.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemInfoVO {
    private int i_id;
    private String i_name;
    private String i_color;
    private String i_standard;
    private String i_type;
    private String i_uses;
}
