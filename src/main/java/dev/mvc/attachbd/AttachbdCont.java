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
  @Qualifier("dev.mvc.boardgrp.BoardgrpProc") // 이름 지정
  private BoardgrpProcInter boardgrpProc;

  @Autowired
  @Qualifier("dev.mvc.attachbd.AttachbdProc") // 이름 지정
  private AttachbdProcInter attachbdProc;
  
  @Autowired
  @Qualifier("dev.mvc.rpl.RplProc") // 이름 지정
  private RplProcInter rplProc;
  
  public AttachbdCont(){
    System.out.println("--> AttachbdCont created.");
  }
  
  /**
   * 파일 등록폼
   * @param boardgrpno 카테고리 그룹 FK
   * @param contentsbdno 컨텐츠 번호 FK
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
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int contentsbdno = attachbdVO.getContentsbdno(); // 부모글 번호
    String aname = ""; // 원본 파일명
    String aupname = ""; // 업로드된 파일명
    long asize = 0;  // 파일 사이즈
    String athumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/attachbd/storage");
    // 전송 파일이 없어서도 anamesMF 객체가 생성됨.
    List<MultipartFile> anamesMF = attachbdVO.getAnamesMF();
    int count = anamesMF.size(); // 전송 파일 갯수
    if (count > 0) {
      for (MultipartFile multipartFile:anamesMF) { // 파일 추출
        asize = multipartFile.getSize();// 파일 크기
        if (asize > 0) { // 파일 크기 체크
          aname = multipartFile.getOriginalFilename(); // 원본 파일명
          aupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장
          
          if (Tool.isImage(aname)) { // 이미지인지 검사
            athumb = Tool.preview(upDir, aupname, 120, 80); // thumb 이미지 생성
          }
        }
        AttachbdVO vo = new AttachbdVO();
        vo.setContentsbdno(contentsbdno);
        vo.setAname(aname);
        vo.setAupname(aupname);
        vo.setAthumb(athumb);
        vo.setAsize(asize);
        
        upload_count = upload_count + attachbdProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("boardgrpno", boardgrpno);
    ra.addAttribute("contentsbdno", attachbdVO.getContentsbdno());
    
    mav.setViewName("redirect:/attachbd/create_msg.jsp");
    return mav;
  }
  
  /**
   * 목록
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
   * FK contentsbdno 컬럼값을 이용한 레코드 삭제 처리
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
    
    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("cnt", cnt); // 삭제된 레코드 갯수
    ra.addAttribute("contentsbdno", contentsbdno);
    ra.addAttribute("boardgrpno", boardgrpno);
    
    mav.setViewName("redirect:/attachbd/delete_by_contentsbdno_msg.jsp");

    return mav;
  }
  
  
}