package com.cnr_furniture.domain.Machine;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchMachineCheckVO {
    private String type;
    private String keyword;

    private String find_machine_check_type;
    private String find_machine_check_method;
    private String find_machine_check_condition;

    public SearchMachineCheckVO() {}
    public SearchMachineCheckVO(
            String type,
            String keyword,
            String find_machine_check_type,
            String find_machine_check_method,
            String find_machine_check_condition
    ) {
        this.type = type;
        this.keyword = keyword;
        this.find_machine_check_type = find_machine_check_type;
        this.find_machine_check_method = find_machine_check_method;
        this.find_machine_check_condition = find_machine_check_condition;
    }
    public String[] getTypeArr(){
        return type == null ? new String[] {} : type.split("");
    }
}

