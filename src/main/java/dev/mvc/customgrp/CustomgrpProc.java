package dev.mvc.customgrp;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.customgrp.CustomgrpProc")
public class CustomgrpProc implements CustomgrpProcInter {
  // CategrpDAOInter�� MyBATIS�� ȣ���ϴ� �ڵ尡 �ڵ�������.
  // �ڵ� ������ Ŭ������ ��ü�� �ڵ� �Ҵ��.
  @Autowired
  private CustomgrpDAOInter customgrpDAO;  
  
  @Override
  public int create(CustomgrpVO customgrpVO) {
    int count = customgrpDAO.create(customgrpVO);
    return count;
  }
  
  
  @Override
  public List<CustomgrpVO> list() {
    List<CustomgrpVO> list = customgrpDAO.list();
    
    return list;
  }

  @Override
  public CustomgrpVO read(int customgrpno) {
    CustomgrpVO customgrpVO = customgrpDAO.read(customgrpno);
    return customgrpVO;
  }



  @Override
  public int update(CustomgrpVO customgrpVO) {
    int count =customgrpDAO.update(customgrpVO);
    return count;
  }


  @Override
  public int delete(int customgrpno) {
    int count = customgrpDAO.delete(customgrpno);
    return count;
  }
  
  


  /*
  @Override
  public int delete(int categrpno) { 
    int count =categrpDAO.delete(categrpno);
    return count;
  }



  @Override
  public List<CategrpVO>list_seqno_asc() {
    List <CategrpVO> list = categrpDAO.list_seqno_asc();
    return list;
  }



  @Override
  public int update_seqno_up(int categrpno) {
    int count = categrpDAO.update_seqno_up(categrpno);
    return count;
  }



  



  @Override
  public int cnt_zero(int categrpno) {
    int count =categrpDAO.cnt_zero(categrpno);
    return count;
  }*/
  

}