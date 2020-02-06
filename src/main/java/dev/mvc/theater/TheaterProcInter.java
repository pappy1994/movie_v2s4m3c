package dev.mvc.theater;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface TheaterProcInter {
  
  public int create(TheaterVO theaterVO);
  
  public List<TheaterVO> list();
  
  public List<TheaterVO> theater_list_areano(int areano);
  
  public TheaterVO read(int theaterno);
  
  public int update(TheaterVO theaterVO);
  
  public int delete(int theaterno);
  
  public List<TheaterVO> list_by_areano_search(HashMap<String, Object> hashMap);
  
  public int search_count(HashMap<String, Object> hashMap);
  
  public String pagingBox(String listFile, int categrpno, int search_count, int nowPage, String word);
  
  public ArrayList<TheaterVO> list_by_areano_search_paging(HashMap<String, Object> map);

}
