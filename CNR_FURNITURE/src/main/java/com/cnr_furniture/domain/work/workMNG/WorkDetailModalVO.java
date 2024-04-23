package com.cnr_furniture.domain.work.workMNG;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * Desc: Work의 [작업] 시, INSERT, Update에 필요한 VO
 */
@Getter
@Setter
public class WorkDetailModalVO {
    /*  모달창 1행 */
    private int workDetailModalWorkId;              // 작업번호
    private int workDetailModalLotId;               // 로트번호

    /*  모달창 2행 */
    private int workDetailModalProcessId;           // 공정번호
    private String workDetailModalProcessName;      // 공정명


    /*  모달창 3행 */
    private int workDetailModalMachineId;           // 설비번호
    private String workDetailModalMachineName;      // 설비명
    private String workDetailModalWorkPosition;     // 작업위치


    /*  모달창 4행 */
    private int workDetailModalItemId;              // 제품번호
    private String workDetailModalItemName;         // 제품명
    private String workDetailModalUnit;             // 생산단위


    /*  모달창 5행 */
    private int workDetailModalPlanQuantity;        // 현재작업계획수량(입력받을 값)
    private int workDetailModalProQuantity;         // 생산수량
    private String workDetailModalItemStandard;     // 규격

    /*  모달창 6행 */
    private String workDetailModalWorkStartTime;    // 작업시작시간
    private String workDetailModalWorkEndTime;      // 작업종료시간

    /*  모달창 7행 */
    private int workDetailModalWorkTime;            // 소요시간
    private String workDetailModalWorkStatus;       // 진행상황

    /*  모달창 8행 */
    private String workDetailModalNote;             // 비고
}
