package com.cnr_furniture.domain.Machine;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchMachineVO {
    private String type;
    private String keyword;

    private String find_machine_name;
    private String find_machine_type;
    private String find_machine_position;
    private String find_machine_id;
    private String find_machine_status;
    private String find_machine_condition;


    public String[] getTypeArr(){
        return type == null ? new String[] {} : type.split("");
    }
}
