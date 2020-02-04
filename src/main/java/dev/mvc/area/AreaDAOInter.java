package dev.mvc.area;

import java.util.List;

public interface AreaDAOInter {

  public int create(AreaVO areaVO);
  
  public List<AreaVO> list();
  
  public AreaVO read(int areano);
  
  public int update(AreaVO areaVO);
  
  public int increaseCnt(int areano);
  
  public int decreaseCnt(int areano);
  
  public int delete(int areano);
}
