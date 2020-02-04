package dev.mvc.movie_time;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.movie_time.Movie_timeProc")
public class Movie_timeProc implements Movie_timeProcInter {
 @Autowired
 private Movie_timeDAOInter movie_timeDAO;

@Override
public int create(Movie_timeVO movie_timeVO) {
  int count = movie_timeDAO.create(movie_timeVO);
  return count;
}

@Override
public List<Movie_timeVO> list() {
  List<Movie_timeVO> list = movie_timeDAO.list();
  return list;
}

@Override
public Movie_timeVO read(int movie_timeno) {
  Movie_timeVO movie_timeVO = movie_timeDAO.read(movie_timeno);
  return movie_timeVO;
}

@Override
public int update(Movie_timeVO movie_timeVO) {
  int count = movie_timeDAO.update(movie_timeVO);
  return count;
}

@Override
public int update_seqno_up(int movie_timeno) {
  int count = movie_timeDAO.update_seqno_up(movie_timeno);
  return count;
}

@Override
public int update_seqno_down(int movie_timeno) {
  int count = movie_timeDAO.update_seqno_down(movie_timeno);
  return count;
}

@Override
public List<Movie_timeVO> list_seqno_asc() {
  List<Movie_timeVO> list_seqno_asc = movie_timeDAO.list_seqno_asc();
  return list_seqno_asc;
}

@Override
public int delete(int movie_timeno) {
  int count = movie_timeDAO.delete(movie_timeno);
  return count;
}

}
