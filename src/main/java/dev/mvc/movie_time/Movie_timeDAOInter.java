package dev.mvc.movie_time;

import java.util.List;

public interface Movie_timeDAOInter {

  public int create(Movie_timeVO movie_timeVO);
  
  public List<Movie_timeVO> list();
  
  public Movie_timeVO read(int movie_timeno);
  
  public int update(Movie_timeVO movie_timeVO);
  
  public int update_seqno_up(int movie_timeno);
  
  public int update_seqno_down(int movie_timeno);
  
  public List<Movie_timeVO> list_seqno_asc();
  
  public int delete(int movie_timeno);
}
