package dev.mvc.econtents;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.econtents.EcontentsProc")
public class EcontentsProc implements EcontentsProcInter {
  
  @Autowired
  private EcontentsDAOInter econtentsDAO;

  @Override
  public int create(EcontentsVO econtentsVO) {
    int count = econtentsDAO.create(econtentsVO);
    return count;
  }

  @Override
  public List<EcontentsVO> list() {
    List<EcontentsVO> list = econtentsDAO.list();
    return list;
  }

  @Override
  public EcontentsVO read(int econtentsno) {
    EcontentsVO econtentsVO = econtentsDAO.read(econtentsno);
    return econtentsVO;
  }

  @Override
  public int update(EcontentsVO econtentsVO) {
    int count = econtentsDAO.update(econtentsVO);
    return count;
  }

  @Override
  public int delete(int econtentsno) {
    int count = econtentsDAO.delete(econtentsno);
    return count;
  }

  @Override
  public List<EcontentsVO> list_all() {
    List<EcontentsVO> list = econtentsDAO.list_all();
    return list;
  }

}
