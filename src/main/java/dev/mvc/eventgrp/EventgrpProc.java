package dev.mvc.eventgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.eventgrp.EventgrpProc")
public class EventgrpProc implements EventgrpProcInter {

  @Autowired
  private EventgrpDAOInter eventgrpDAO;

  @Override
  public int create(EventgrpVO eventgrpVO) {
    int count = eventgrpDAO.create(eventgrpVO);
    return count;
  }

  @Override
  public List<EventgrpVO> list_eventgrpno_asc() {
    List<EventgrpVO> list = eventgrpDAO.list_eventgrpno_asc();
    return list;
  }

  @Override
  public EventgrpVO read(int eventgrpno) {
    EventgrpVO eventgrpVO = eventgrpDAO.read(eventgrpno);
    return eventgrpVO;
  }

  @Override
  public int update(EventgrpVO eventgrpVO) {
    int count = eventgrpDAO.update(eventgrpVO);
    return count;
  }

  @Override
  public int delete(int eventgrpno) {
    int count = eventgrpDAO.delete(eventgrpno);
    return count;
  }


}
