package com.cnr_furniture.domain.process;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *설비 테이블 클래스
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ManagementVO {
    private Integer miId;               // 설비 번호
    private String miName;              // 설비 이름
    private Integer miPosition;          // 설비 위치
    private String miType;              // 설비 유형
}
