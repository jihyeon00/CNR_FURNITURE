package com.cnr_furniture.domain.production.search;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Desc: Production의 거래처 VO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductionSelectCompanyVO {
    private int companyId;
    private String companyName;
    private String companyMail;
    private String companyDiv;
    private String companyAddress;
    private String companyPh;
}
