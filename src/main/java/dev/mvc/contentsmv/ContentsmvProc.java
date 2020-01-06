package dev.mvc.contentsmv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import nation.web.tool.Tool;

@Component("dev.mvc.contentsmv.ContentsmvProc")
public class ContentsmvProc implements ContentsmvProcInter {
  @Autowired
  private ContentsmvDAOInter contentsmvDAO;
  
  @Override
  public int create(ContentsmvVO contentsmvVO) {
    int count = contentsmvDAO.create(contentsmvVO);
    return count;
  }

  @Override
  public List<ContentsmvVO> list_all() {
    List<ContentsmvVO> list = contentsmvDAO.list_all();
    return list;
  }

  @Override
  public List<ContentsmvVO> list_by_customgrpno(int customgrpno) {
    List<ContentsmvVO> list = contentsmvDAO.list_by_customgrpno(customgrpno);
    return list;
  }

  @Override
  public ContentsmvVO read(int contentsmvno) {
    ContentsmvVO contentsmvVO = contentsmvDAO.read(contentsmvno);
    return contentsmvVO;
  }

  @Override
  public int update(ContentsmvVO contentsmvVO){
    int count = contentsmvDAO.update(contentsmvVO);
    return count; 
  }

  @Override
  public int delete(int contentsmvno) {
    int count = contentsmvDAO.delete(contentsmvno);
    return count;
  }
  
  
  
}