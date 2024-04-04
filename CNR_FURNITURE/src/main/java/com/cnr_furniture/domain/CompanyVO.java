package com.cnr_furniture.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyVO {
  private String C_ID;
  private String C_NAME;
  private String C_EMAIL;
  private String C_DIV;
  private String C_ADDRESS;
  private String C_PH;
}
