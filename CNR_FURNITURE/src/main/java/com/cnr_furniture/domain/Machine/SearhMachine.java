package com.cnr_furniture.domain.Machine;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearhMachine {
    private String type;
    private String keyword;

    private String find_machine_name;
    private String find_machine_type;
    private String find_machine_position;
    private String find_machine_id;

    public String[] getTypeArr(){
        return type == null ? new String[] {} : type.split("");
    }
}
