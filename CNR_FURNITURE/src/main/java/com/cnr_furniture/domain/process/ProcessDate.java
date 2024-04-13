package com.cnr_furniture.domain.process;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

/**
 *검색을 위한 클래스
 */
@Getter
@Setter
public class ProcessDate {
    private String type;                // 이름/번호 선택
    private String keyword;             // 검색 입력값
    private String startDate;           // 시작 날짜
    private String endDate;             // 끝나는 날짜
    private String find_item_process;   // 제품번호 검색
    private String find_ic_process;     // 계약번호
    private String find_pi_process;     // 공정번호
    private String ctStartDate;         // 계약 시작 날짜
    private String ctEndDate;           // 계약 시작 날짜

    private int ins_lot_id;
    private int ins_item_id;
    private int ins_pi_id;

    private int p_lot_id;
    private int p_pi_id;


    private List<ProcessItemVO> itemProList; // 아이템 정보 리스트 추가
    private List<ProcessCtVO>   ctProList;   // 계약 정보 리스트 추가
    private List<ProcessInfoVO> piProList;   // 공정 정보 리스트 추가

    public String[] getTypeArr() {
        return type == null? new String[] {}: type.split("");
    }

}