package com.cnr_furniture.service;

import com.cnr_furniture.domain.inventory.CriteriaItemInventoryVO;
import com.cnr_furniture.domain.inventory.ItemInventoryListVO;
import com.cnr_furniture.mapper.ItemInventoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.util.List;

@Log4j
@Service
public class ItemInventoryServiceImpl implements ItemInventoryService {
  @Autowired
  private ItemInventoryMapper itemInventoryMapper;

  /**
   * 검색창 - 제품번호
   */
  @Override
  public List<ItemInventoryListVO> getItemIDList() {
    return itemInventoryMapper.getItemIDList();
  }

  /**
   * 검색창 - 제품명
   */
  @Override
  public List<ItemInventoryListVO> getItemNameList() {
    return itemInventoryMapper.getItemNameList();
  }

  /**
   * 검색창 - 제품용도
   */
  @Override
  public List<ItemInventoryListVO> getItemUsesList() {
    return itemInventoryMapper.getItemUsesList();
  }

  /**
   * 검색창 - 재고 조회(with 검색)
   */
  @Override
  public List<ItemInventoryListVO> getItemInventoryList(CriteriaItemInventoryVO cri) {
    return itemInventoryMapper.getItemInventoryList(cri);
  }

}
