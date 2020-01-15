package dev.mvc.attachbd;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.boardgrp.BoardgrpProcInter;
import dev.mvc.boardgrp.BoardgrpVO;
import dev.mvc.rpl.RplProcInter;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class AttachbdCont {
  @Autowired
  @Qualifier("dev.mvc.boardgrp.BoardgrpProc") // �̸� ����
  private BoardgrpProcInter boardgrpProc;

  @Autowired
  @Qualifier("dev.mvc.attachbd.AttachbdProc") // �̸� ����
  private AttachbdProcInter attachbdProc;
  
  @Autowired
  @Qualifier("dev.mvc.rpl.RplProc") // �̸� ����
  private RplProcInter rplProc;
  
  public AttachbdCont(){
    System.out.println("--> AttachbdCont created.");
  }
  
  /**
   * ���� �����
   * @param boardgrpno ī�װ� �׷� FK
   * @param contentsbdno ������ ��ȣ FK
   * @return
   */
  // http://localhost:9090/team7/attachbd/create.do?boardgrpno=1&contentsbdno=1
  @RequestMapping(value = "/attachbd/create.do", method = RequestMethod.GET)
  public ModelAndView create(int boardgrpno, int contentsbdno) {
    ModelAndView mav = new ModelAndView();

    BoardgrpVO boardgrpVO = boardgrpProc.read(boardgrpno);
    mav.addObject("boardgrpVO", boardgrpVO);

    mav.setViewName("/attachbd/create"); // /webapp/attachbd/create.jsp

    return mav;
  }
  
  @RequestMapping(value = "/attachbd/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                             HttpServletRequest request,
                             AttachbdVO attachbdVO,
                             int boardgrpno) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int contentsbdno = attachbdVO.getContentsbdno(); // �θ�� ��ȣ
    String aname = ""; // ���� ���ϸ�
    String aupname = ""; // ���ε�� ���ϸ�
    long asize = 0;  // ���� ������
    String athumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/attachbd/storage");
    // ���� ������ ����� anamesMF ��ü�� ������.
    List<MultipartFile> anamesMF = attachbdVO.getAnamesMF();
    int count = anamesMF.size(); // ���� ���� ����
    if (count > 0) {
      for (MultipartFile multipartFile:anamesMF) { // ���� ����
        asize = multipartFile.getSize();// ���� ũ��
        if (asize > 0) { // ���� ũ�� üũ
          aname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          aupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ����
          
          if (Tool.isImage(aname)) { // �̹������� �˻�
            athumb = Tool.preview(upDir, aupname, 120, 80); // thumb �̹��� ����
          }
        }
        AttachbdVO vo = new AttachbdVO();
        vo.setContentsbdno(contentsbdno);
        vo.setAname(aname);
        vo.setAupname(aupname);
        vo.setAthumb(athumb);
        vo.setAsize(asize);
        
        upload_count = upload_count + attachbdProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("boardgrpno", boardgrpno);
    ra.addAttribute("contentsbdno", attachbdVO.getContentsbdno());
    
    mav.setViewName("redirect:/attachbd/create_msg.jsp");
    return mav;
  }
  
  /**
   * ���
   * http://localhost:9090/team7/attachbd/list.do
   * 
   * @param boardgrpno
   * @return
   */
  @RequestMapping(value = "/attachbd/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<Contentsbd_AttachbdVO> list = attachbdProc.list();
    mav.addObject("list", list);

    mav.setViewName("/attachbd/list");

    return mav;
  }
  
  /**
   * FK contentsbdno �÷����� �̿��� ���ڵ� ���� ó��
   * @param ra
   * @param boardgrpno
   * @return
   */
  @RequestMapping(value = "/attachbd/delete_by_contentsbdno.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete_by_contentsbdno(RedirectAttributes ra,
                                             int contentsbdno,
                                             int boardgrpno) {
    ModelAndView mav = new ModelAndView();

    int count = attachbdProc.delete_by_contentsbdno(contentsbdno);
    int cnt = rplProc.delete2_by_contentsbdno(contentsbdno);
    
    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("cnt", cnt); // ������ ���ڵ� ����
    ra.addAttribute("contentsbdno", contentsbdno);
    ra.addAttribute("boardgrpno", boardgrpno);
    
    mav.setViewName("redirect:/attachbd/delete_by_contentsbdno_msg.jsp");

    return mav;
  }
  
  
}