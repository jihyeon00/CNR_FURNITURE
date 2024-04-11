package com.cnr_furniture.domain.process;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

    /**
     *제품 테이블 클래스
     */
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public class ProcessItemVO {
        private int i_id;
        private String i_name;
        private String i_color;
        private String i_standard;
        private String i_type;
        private String i_uses;
    }

