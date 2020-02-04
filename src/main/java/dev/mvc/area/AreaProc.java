package dev.mvc.area;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.area.AreaProc")
public class AreaProc implements AreaProcInter {
  @Autowired
  private AreaDAOInter areaDAO;

  @Override
  public int create(AreaVO areaVO) {
    int count = areaDAO.create(areaVO);
    return count;
  }

  @Override
  public List<AreaVO> list() {
    List<AreaVO> list = areaDAO.list();
    return list;
  }

  @Override
  public AreaVO read(int areano) {
    AreaVO areaVO = areaDAO.read(areano);
    return areaVO;
  }

  @Override
  public int update(AreaVO areaVO) {
    int count = areaDAO.update(areaVO);
    return count;
  }

  @Override
  public int delete(int areano) {
    int count = areaDAO.delete(areano);
    return count;
  }

  @Override
  public int increaseCnt(int areano) {
    int count = areaDAO.increaseCnt(areano);
    return count;
  }

  @Override
  public int decreaseCnt(int areano) {
    int count = areaDAO.decreaseCnt(areano);
    return count;
  }

}
