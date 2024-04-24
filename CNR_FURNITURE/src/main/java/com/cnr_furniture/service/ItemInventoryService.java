package com.cnr_furniture.service;

import com.cnr_furniture.domain.inventory.CriteriaItemInventoryVO;
import com.cnr_furniture.domain.inventory.ItemInventoryListVO;

import java.util.List;

public interface ItemInventoryService {
  /**
   * 검색창 - 제품번호
   */
  List<ItemInventoryListVO> getItemIDList();

  /**
   * 검색창 - 제품명
   */
  List<ItemInventoryListVO> getItemNameList();

  /**
   * 검색창 - 제품용도
   */
  List<ItemInventoryListVO> getItemUsesList();

  /**
   * 검색창 - 재고 조회(with 검색)
   */
  List<ItemInventoryListVO> getItemInventoryList(CriteriaItemInventoryVO cri);

}
