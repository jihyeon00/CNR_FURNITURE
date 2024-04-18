package com.cnr_furniture.domain.work.workMNG;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Desc: Work의 [자재투입등록] 시, INSERT에 필요한 VO
 */
@Getter
@Setter
public class WorkInsertMaterialModalVO {
    /* 등록 모달창 1행 */
    private int insLotIdModal;                  // 로트번호(from instruction 테이블), [검색 keyword]
    private int processIdModal;                 // 공정번호(from instruction 테이블)

    /* 등록 모달창 2행 */
    private int itemIdModal;                    // 제품번호(from instruction 테이블)
    private String itemNameModal;                  // 제품명(from instruction 테이블의 ins_item_id와
                                                //       item 테이블의 i_id를 조인하여 i_name 조회 )
    private int productionPlanQuantityModal;    // 계획생산수량(from instruction 테이블의 ins_lot_size)

    /* 등록 모달창 3행 */
    private int materialIdModal;                // 자재번호(from Material 테이블), [검색 keyword]
    private String materialNameModal;           // 자재명(from Material 테이블)
    private int item1EaMaterialModal;           // 제품1EA별 투입수량(from BOM 테이블의 B_MATERIAL_QUANTITY)

    /* 등록 모달창 4행 */
    private int minInsertQuantityModal;         // 최소투입수량(instruction 테이블의 ins_lot_size * BOM 테이블의 B_MATERIAL_QUANTITY)
    private String unitMaterialModal;           // 단위(from Contract 테이블)
    private int insertQuantityModal;            // 투입수량(실제 투입될 자재 수량), inventory 테이블의 inv_quantity

    /* 모달의 입력칸에는 없으나, [추가] 버튼 누른 후, 목록 보여주는데에는 한 객체들 */
    private Long listSeqModal;                  // 테이블 행번호
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date invDateModal;                  // 투입일자 (from inventory 테이블의 inv_date)

}
