package com.cnr_furniture.domain.bom;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BomVO {
    
    private int rn; //번호순서
    
    private String b_material_id; //자재번호

    private int b_item_id; //제품번호 = i_id ITEM

    private String m_name; // 자재명 from MATERIAL

    private String b_unit; // 자재 단위

    private String b_material_quantity; // 자재수량

}
