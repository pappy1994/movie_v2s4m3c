package dev.mvc.theater;

import java.util.List;

public interface TheaterProcInter {
  
  public int create(TheaterVO theaterVO);
  
  public List<TheaterVO> list();
  
  public List<TheaterVO> theater_list_areano(int areano);
  
  public TheaterVO read(int theaterno);
  
  public int update(TheaterVO theaterVO);
  
  public int delete(int theaterno);

}
