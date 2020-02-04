package dev.mvc.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.theater.TheaterDAOInter;

@Component("dev.mvc.reserve.ReserveProc")
public class ReserveProc implements ReserveProcInter {
  @Autowired
  private ReserveDAOInter reserveDAO;

}
