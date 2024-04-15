package com.cnr_furniture.domain.process;

import lombok.Builder;
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
    /**제조지시*/
    private String type;                // 이름/번호 선택
    private String keyword;             // 검색 입력값
    private String startDate;           // 시작 날짜
    private String endDate;             // 끝나는 날짜
    private String find_item_process;   // 제품번호 검색
    private String find_ic_process;     // 계약번호
    private String find_pi_process;     // 공정번호
    private String ctStartDate;         // 계약 시작 날짜
    private String ctEndDate;           // 계약 시작 날짜


    /**제조수행지시*/
    private int ins_lot_id;             // 제조로트번호:제조 지시
    private int ins_item_id;            // 제품번호:제조 지시
    private int ins_pi_id;              // 공정번호:제조 지시
    private Integer pPiId;              // 제조공정번호:제조수행지시, Integer을 사용함으로써 null도 가능하게 함
    private Integer pLotId;             // 제조고트번호:제조수행지시, Integer을 사용함으로써 null도 가능하게 함


    /**리스트*/
    private List<ProcessItemVO> itemProList; // 아이템 정보 리스트 추가
    private List<ProcessCtVO>   ctProList;   // 계약 정보 리스트 추가
    private List<ProcessInfoVO> piProList;   // 공정 정보 리스트 추가


    public String[] getTypeArr() {
        return type == null? new String[] {}: type.split("");
    }

}