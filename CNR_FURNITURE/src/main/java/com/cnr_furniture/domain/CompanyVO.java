package com.cnr_furniture.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CompanyVO {
  private String c_ID;
  private String c_NAME;
  private String c_EMAIL;
  private String c_DIV;
  private String c_ADDRESS;
  private String c_PH;
}
