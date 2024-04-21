package com.cnr_furniture.domain.work.workMNG;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Desc: Work의 [작업등록] 시, INSERT에 필요한 VO
 */
@Getter
@Setter
public class WorkInsertModalVO {
    /* 등록 모달창 1행 */
    private int workInsertModalLotId;               // 로트번호(from instruction 테이블), [검색 keyword]
    private int workInsertModalProcessId;           // 공정번호(from instruction 테이블), [검색 keyword]
    private String workInsertModalProcessName;      // 공정명(from process_info 테이블)

    /* 등록 모달창 2행 */
    private int workInsertModalMachineId;           // 설비번호(from process_info 테이블)
    private String workInsertModalMachineName;      // 설비명(from instruction 테이블)
    private String workInsertModalWorkPosition;     // 작업위치(from process_info 테이블)

    /* 등록 모달창 3행 */
    private int workInsertModalItemId;              // 제품번호(from instruction 테이블)
    private String workInsertModalItemName;         // 제품명(from instruction 테이블의 ins_item_id와
                                                    //          item 테이블의 i_id를 조인하여 i_name 조회 )
    private String workInsertModalUnit;             // 생산단위(from contract 테이블의 단위 )

    /* 등록 모달창 4행 */
    private int workInsertModalLeftoverQuantity;    // 남은생산수량(로트번호, 공정번호 같은 값 가진 애들의 생산수량을 파악하여 process의 계획수량 - process의 생산수량)
    private int workInsertModalPlanQuantity;        // 현재작업계획수량(입력받을 값)
    private int workInsertModalWorkTime;            // 소요시간(작업종료시간 - 작업시작시간 - 60)

    /* 등록 모달창 5행 */
    private String workInsertModalWorkStartTime;    // 작업시작시간(from work 테이블)
    private String workInsertModalWorkEndTime;      // 작업종료시간(from work 테이블)

    /* 등록 모달창 6행 */
    private String workInsertModalNote;             // 비고(from work 테이블)

    /* 모달의 입력칸에는 없으나, [추가] 버튼 누른 후, 목록 보여주는데에는 한 객체들 */
    private Long listSeqModal;                      // 테이블 행번호
}
