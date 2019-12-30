package dev.mvc.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.theater.TheaterProc")
public class TheaterProc implements TheaterProcInter {
  @Autowired
  private TheaterDAOInter theaterDAO;

  @Override
  public int create_area(TheaterVO theaterVO) {
    int count = theaterDAO.create_area(theaterVO);
    return count;
  }

  @Override
  public int create_theater(TheaterVO theaterVO) {
    int count = theaterDAO.create_theater(theaterVO);
    return count;
  }

  @Override
  public List<TheaterVO> list() {
    List<TheaterVO> list = theaterDAO.list();
    return list;
  }

  @Override
  public TheaterVO read(int theaterno) {
    TheaterVO theaterVO = theaterDAO.read(theaterno);
    return theaterVO;
  }

  @Override
  public int update(TheaterVO theaterVO) {
    int count = theaterDAO.update(theaterVO);
    return count;
  }

  @Override
  public int delete(int theaterno) {
    int count = theaterDAO.delete(theaterno);
    return count;
  }

}
