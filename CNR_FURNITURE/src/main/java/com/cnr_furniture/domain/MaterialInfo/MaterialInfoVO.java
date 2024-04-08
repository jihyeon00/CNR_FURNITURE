package com.cnr_furniture.domain.MaterialInfo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MaterialInfoVO {
    private int m_id;
    private String m_name;
    private String m_uses;

    private int rn;
}
