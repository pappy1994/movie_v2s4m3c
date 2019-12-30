package dev.mvc.theater;

import java.util.List;

public interface TheaterProcInter {
  
  public int create_area(TheaterVO theaterVO);
  
  public int create_theater(TheaterVO theaterVO);
  
  public List<TheaterVO> list();
  
  public TheaterVO read(int theaterno);
  
  public int update(TheaterVO theaterVO);
  
  public int delete(int theaterno);

}
