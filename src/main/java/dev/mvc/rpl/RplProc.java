package dev.mvc.rpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.rpl.RplProc")
public class RplProc implements RplProcInter {
  @Autowired
  private RplDAOInter rplDAO; 
  
  public RplProc(){
    System.out.println("--> RplProc created.");
  
}

  @Override
  public int create(RplVO rplVO) {
    int cnt = rplDAO.create(rplVO);
    return cnt;
  }

  @Override
  public List<RplVO> list() {
    List<RplVO> list = rplDAO.list();
    return list;
  }

  @Override
  public List<RplVO> list_by_contentsbdno(int contentsbdno) {
    List<RplVO> list = rplDAO.list_by_contentsbdno(contentsbdno);
    return list;
  }
}
