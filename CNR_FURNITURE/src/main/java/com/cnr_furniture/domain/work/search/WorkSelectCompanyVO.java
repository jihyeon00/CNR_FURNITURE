package com.cnr_furniture.domain.work.search;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Desc: Work의 거래처 VO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkSelectCompanyVO {
    private int companyId;
    private String companyName;
    private String companyMail;
    private String companyDiv;
    private String companyAddress;
    private String companyPh;
}
