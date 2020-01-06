package dev.mvc.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.qna.QnaProc")
public class QnaProc implements QnaProcInter {
  @Autowired
  private QnaDAOInter qnaDAO;
  
  public int create(QnaVO qnaVO) {
    int cnt = qnaDAO.create(qnaVO);
    return cnt;
  }
  
  @Override
  public List<QnaVO> list_all() {
    List<QnaVO> list = qnaDAO.list_all();
    return list;
  }

  @Override
  public List<QnaVO> list_by_qnagrpno(int qnagrpno) {
    List<QnaVO> list = qnaDAO.list_by_qnagrpno(qnagrpno);
    return list;
  }
  
  @Override
  public QnaVO read(int qnano) {
    QnaVO qnaVO = qnaDAO.read(qnano);
    return qnaVO;
  }
  
  @Override
  public int update(QnaVO qnaVO) {
    int count = qnaDAO.update(qnaVO);
    return count;
  }
  
  @Override
  public int delete(int qnano) {
    int count = qnaDAO.delete(qnano);
    return count;
  }

  
}



