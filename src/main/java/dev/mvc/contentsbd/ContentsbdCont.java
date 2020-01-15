package dev.mvc.contentsbd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.attachbd.AttachbdProcInter;
import dev.mvc.attachbd.AttachbdVO;
import dev.mvc.boardgrp.BoardgrpProc;
import dev.mvc.boardgrp.BoardgrpProcInter;
import dev.mvc.boardgrp.BoardgrpVO;
import dev.mvc.rpl.RplProcInter;
import dev.mvc.rpl.RplVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class ContentsbdCont {
    @Autowired
    @Qualifier("dev.mvc.contentsbd.ContentsbdProc") // 이름 지정
    private ContentsbdProcInter contentsbdProc;
    
    @Autowired
    @Qualifier("dev.mvc.boardgrp.BoardgrpProc") // 이름 지정
    private BoardgrpProcInter boardgrpProc;
    
    @Autowired
    @Qualifier("dev.mvc.attachbd.AttachbdProc") // 이름 지정
    private AttachbdProcInter attachbdProc;
    
    @Autowired
    @Qualifier("dev.mvc.rpl.RplProc") // 이름 지정
    private RplProcInter rplProc;
    
    public ContentsbdCont() {
      System.out.println("---> ContentsbdCont create.");
    }
    
    // http://localhost:9090/team7/contentsbd/create.do?mno=1&boardgrpno=1
    @RequestMapping(value = "/contentsbd/create.do", method = RequestMethod.GET)
    public ModelAndView create(int boardgrpno) {
      ModelAndView mav = new ModelAndView();

      BoardgrpVO boardgrpVO = boardgrpProc.read(boardgrpno);
      mav.addObject("boardgrpVO", boardgrpVO);

      mav.setViewName("/contentsbd/create"); // /webapp/contentsbd/create.jsp

      return mav;
    }

//    @RequestMapping(value = "/contentsbd/create.do", method = RequestMethod.POST)
//    public ModelAndView create(RedirectAttributes redirectAttributes,
//                                             ContentsbdVO contentsbdVO) {
//      ModelAndView mav = new ModelAndView();
//      int count = contentsbdProc.create(contentsbdVO);
//      if (count == 1) {
//        boardgrpProc.increaseCnt(contentsbdVO.getBoardgrpno()); // 카테고리 글수 증가
//      }
//      // mav.setViewName("/contentsbd/create"); // /webapp/contentsbd/create.jsp
//      // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
//      
//      redirectAttributes.addAttribute("count", count); // redirect parameter 적용
//      redirectAttributes.addAttribute("boardgrpno", contentsbdVO.getBoardgrpno());
//      
//      mav.setViewName("redirect:/contentsbd/create_msg.jsp");
//
//      return mav;
//    }
    
    @RequestMapping(value = "/contentsbd/create.do", method = RequestMethod.POST)
    public ModelAndView create(RedirectAttributes ra,
                               HttpServletRequest request,
                               ContentsbdVO contentsbdVO) {
      ModelAndView mav = new ModelAndView();
      
      // -----------------------------------------------------
      // 파일 전송 코드 시작
      // -----------------------------------------------------
      String fname = ""; // 원본 파일명
      String fupname = ""; // 업로드된 파일명
      long fsize = 0;  // 파일 사이즈
      String thumb = ""; // Preview 이미지
      
      String upDir = Tool.getRealPath(request, "/contentsbd/storage");
      // 전송 파일이 없어서도 fnameMF 객체가 생성됨, 하나의 파일 업로드.
      MultipartFile fnameMF = contentsbdVO.getFnameMF();
      fsize = fnameMF.getSize();  // 파일 크기
      if (fsize > 0) { // 파일 크기 체크
        fname = fnameMF.getOriginalFilename(); // 원본 파일명
        fupname = Upload.saveFileSpring(fnameMF, upDir); // 파일 저장
            
        if (Tool.isImage(fname)) { // 이미지인지 검사
          thumb = Tool.preview(upDir, fupname, 120, 80); // thumb 이미지 생성
        }
      }
      contentsbdVO.setFname(fname);
      contentsbdVO.setFupname(fupname);
      contentsbdVO.setThumb(thumb);
      contentsbdVO.setFsize(fsize); 
      // -----------------------------------------------------
      // 파일 전송 코드 종료
      // -----------------------------------------------------
     
      int count = contentsbdProc.create(contentsbdVO);
      
      ra.addAttribute("count", count);
      ra.addAttribute("boardgrpno", contentsbdVO.getBoardgrpno());
       
      mav.setViewName("redirect:/contentsbd/create_msg.jsp");
      return mav;
    }

    @RequestMapping(value = "/contentsbd/list_all.do", method = RequestMethod.GET)
    public ModelAndView list_all() {
      ModelAndView mav = new ModelAndView();

      List<ContentsbdVO> list = contentsbdProc.list_all();
      mav.addObject("list", list);
      mav.setViewName("/contentsbd/list_all"); // /webapp/contentsbd/list_all.jsp

      return mav;
    }

    /**
     * 카테고리 그룹별 목록
     * http://localhost:9090/team7/contentsbd/list_by_boardgrpno.do?boardgrpno=1
     * 
     * @param boardgrpno
     * @return
     */
    @RequestMapping(value = "/contentsbd/list_by_boardgrpno.do", method = RequestMethod.GET)
    public ModelAndView list_by_boardgrpno(int boardgrpno) {
      ModelAndView mav = new ModelAndView();

      List<ContentsbdVO> list = contentsbdProc.list_by_boardgrpno(boardgrpno);
      mav.addObject("list", list);
      // /webapp/contentsbd/list.jsp

      BoardgrpVO boardgrpVO = boardgrpProc.read(boardgrpno);
      mav.addObject("boardgrpVO", boardgrpVO);

      mav.setViewName("/contentsbd/list_by_boardgrpno"); // 카테고리 그룹별 목록

      return mav;
    }
    
    /**
     * http://localhost:9090/ojt/contentsbd/list.do?boardgrpno=2&word=스위스
     * @param boardgrpno
     * @param word
     * @return
     */
    @RequestMapping(value = "/contentsbd/list.do", method = RequestMethod.GET)
    public ModelAndView list_by_boardgrpno_search(int boardgrpno, String word) {
      ModelAndView mav = new ModelAndView();

      HashMap<String, Object> hashMap = new HashMap<>();
      hashMap.put("boardgrpno", boardgrpno);
      hashMap.put("word", word);
      
      List<ContentsbdVO> list = contentsbdProc.list_by_boardgrpno_search(hashMap); // 검색
      mav.addObject("list", list);
      // /webapp/contentsbd/list.jsp
      
      int search_count = contentsbdProc.search_count(hashMap); // 검색된 레코드 갯수
      mav.addObject("search_count", search_count);

      BoardgrpVO boardgrpVO = boardgrpProc.read(boardgrpno);
      mav.addObject("boardgrpVO", boardgrpVO);

      mav.setViewName("/contentsbd/list_by_boardgrpno_search"); // 카테고리 그룹별 목록

      return mav;
    }
    
    /**
     * 조회 http://localhost:9090/team7/contentsbd/read.do?contentsbdno=1
     * @param contentsbdno
     * @return
     */
    @RequestMapping(value = "/contentsbd/read.do", method = RequestMethod.GET)
    public ModelAndView read(int contentsbdno) {
      ModelAndView mav = new ModelAndView();

      ContentsbdVO contentsbdVO = contentsbdProc.read(contentsbdno);
      mav.addObject("contentsbdVO", contentsbdVO);
      
      BoardgrpVO boardgrpVO = boardgrpProc.read(contentsbdVO.getBoardgrpno());
      mav.addObject("boardgrpVO", boardgrpVO);

      List<AttachbdVO> attachbd_list = attachbdProc.list_by_contentsbdno(contentsbdno);
      mav.addObject("attachbd_list", attachbd_list);      
      
      mav.setViewName("/contentsbd/read");

      return mav;
    }
  
    // http://localhost:9090/ojt/contentsbd/update.do?memberno=1&boardgrpno=1
    @RequestMapping(value = "/contentsbd/update.do", method = RequestMethod.GET)
    public ModelAndView update(int boardgrpno, int contentsbdno) {
      ModelAndView mav = new ModelAndView();

      BoardgrpVO boardgrpVO = boardgrpProc.read(boardgrpno);
      mav.addObject("boardgrpVO", boardgrpVO);

      ContentsbdVO contentsbdVO = contentsbdProc.read(contentsbdno);
      mav.addObject("contentsbdVO", contentsbdVO);

      mav.setViewName("/contentsbd/update"); // /webapp/contentsbd/update.jsp

      return mav;
    }

    /**
     * 수정 처리
     * @param contentsVO
     * @return
     */
    @RequestMapping(value = "/contentsbd/update.do", 
                    method = RequestMethod.POST)
    public ModelAndView update(RedirectAttributes ra,
                               ContentsbdVO contentsbdVO) {
      ModelAndView mav = new ModelAndView();

      int count = contentsbdProc.update(contentsbdVO);

      // mav.setViewName("/contentsbd/create"); // /webapp/contentsbd/create.jsp
      // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
      ra.addAttribute("count", count);
      ra.addAttribute("boardgrpno", contentsbdVO.getBoardgrpno());
      ra.addAttribute("contentsbdno", contentsbdVO.getContentsbdno());
      
      mav.setViewName("redirect:/contentsbd/update_msg.jsp");

      return mav;
    }
    
    /**
     * 첨부 파일 1건 삭제 폼
     * 
     * @param contentsbdno
     * @return
     */
    // http://localhost:9090/team7/contentsbd/delete.do?boardgrpno=1&contentsbdno=1
    @RequestMapping(value = "/contentsbd/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(int boardgrpno, int contentsbdno) {
      ModelAndView mav = new ModelAndView();

      BoardgrpVO boardgrpVO = boardgrpProc.read(boardgrpno);
      mav.addObject("boardgrpVO", boardgrpVO);

      ContentsbdVO contentsbdVO = contentsbdProc.read(contentsbdno);
      mav.addObject("contentsbdVO", contentsbdVO);

      // FK contentsbdno 컬럼 값이 사용된 레코드 갯수 산출: id="count_by_contentsbdno" 
      int count_by_contentsbdno = attachbdProc.count_by_contentsbdno(contentsbdno);
      mav.addObject("count_by_contentsbdno", count_by_contentsbdno);
      
      int count2_by_contentsbdno = rplProc.count2_by_contentsbdno(contentsbdno);
      mav.addObject("count2_by_contentsbdno", count2_by_contentsbdno);
      
      mav.setViewName("/contentsbd/delete"); // /webapp/contentsbd/delete.jsp

      return mav;
    }
    
    /**
     * 한건 삭제 처리
     * @param ra
     * @param boardgrpno
     * @param contentsbdno
     * @return
     */
    @RequestMapping(value = "/contentsbd/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(HttpSession session,
                               RedirectAttributes ra,
                               int boardgrpno, int contentsbdno) {
      ModelAndView mav = new ModelAndView();
      
      int mno = (Integer)session.getAttribute("mno");
      // 현재 로그인한 사용자와 글 등록자가 같은지 검사
      if (mno == contentsbdProc.read(contentsbdno).getMno()) {
        int count = contentsbdProc.delete(contentsbdno);
        if (count == 1) {
          boardgrpProc.decreaseCnt(boardgrpno);
        }
       
        ra.addAttribute("count", count);
        ra.addAttribute("boardgrpno", boardgrpno);
        ra.addAttribute("contentsbdno", contentsbdno);
        
        mav.setViewName("redirect:/contentsbd/delete_msg.jsp");
      } else {
        ra.addAttribute("boardgrpno", boardgrpno);
        mav.setViewName("redirect:/contentsbd/auth_fail_msg.jsp");
      }

      return mav;
    }
  
    /**
     * FK 컬럼값을 이용한 레코드 삭제 처리
     * @param ra
     * @param boardgrpno
     * @return
     */
    @RequestMapping(value = "/contentsbd/delete_by_boardgrpno.do", method = RequestMethod.POST)
    public ModelAndView delete_by_boardgrpno(RedirectAttributes ra, int boardgrpno) {
      ModelAndView mav = new ModelAndView();

      int count = contentsbdProc.delete_by_boardgrpno(boardgrpno);
      if (count > 0) { // FK 컬럼 관련 글이 정상적으로 삭제되었다면 cnt 컬럼 0으로변경
        boardgrpProc.cnt_zero(boardgrpno);
      }

      ra.addAttribute("count", count); // 삭제된 레코드 갯수
      ra.addAttribute("boardgrpno", boardgrpno);
      
      mav.setViewName("redirect:/contentsbd/delete_by_boardgrpno_msg.jsp");

      return mav;
    }
  
    /**
     * 첨부 파일 1건 삭제 폼
     * 
     * @param contentsbdno
     * @return
     */
    @RequestMapping(value = "/contentsbd/file_delete.do", 
                    method = RequestMethod.GET)
    public ModelAndView file_delete(int contentsbdno) {
      ModelAndView mav = new ModelAndView();

      ContentsbdVO contentsbdVO = contentsbdProc.read(contentsbdno);
      mav.addObject("contentsbdVO", contentsbdVO);

      BoardgrpVO boardgrpVO = boardgrpProc.read(contentsbdVO.getBoardgrpno());        
      mav.addObject("boardgrpVO", boardgrpVO);
      
      List<AttachbdVO> attachbd_list = attachbdProc.list_by_contentsbdno(contentsbdno);
      mav.addObject("attachbd_list", attachbd_list);
      
      List<RplVO> rpl_list = rplProc.list_by_contentsbdno(contentsbdno);
      mav.addObject("rpl_list", rpl_list);
      
      mav.setViewName("/contentsbd/file_delete"); // file_delete.jsp

      return mav;
    }
    
    /**
     * 첨부 파일 1건 삭제 처리
     * 
     * @param contentsbdno
     * @return
     */
    @RequestMapping(value = "/contentsbd/file_delete_proc.do", 
                    method = RequestMethod.GET)
    public ModelAndView file_delete_proc(HttpServletRequest request,
                                         int contentsbdno, 
                                         int attachbdno, 
                                         int rplno) {
      ModelAndView mav = new ModelAndView();

      ContentsbdVO contentsbdVO = contentsbdProc.read(contentsbdno);
      mav.addObject("contentsbdVO", contentsbdVO);

      BoardgrpVO boardgrpVO = boardgrpProc.read(contentsbdVO.getBoardgrpno());
      mav.addObject("boardgrpVO", boardgrpVO);
      
      // 삭제할 파일 정보를 읽어옴.
      AttachbdVO attachbdVO = attachbdProc.read(attachbdno);
      
      String upDir = Tool.getRealPath(request, "/attachbd/storage"); // 절대 경로
      Tool.deleteFile(upDir, attachbdVO.getAupname()); // Folder에서 1건의 파일 삭제
      Tool.deleteFile(upDir, attachbdVO.getAthumb()); // 1건의 Thumb 파일 삭제
      
      // DBMS에서 1건의 파일 삭제
      attachbdProc.delete(attachbdno);
      rplProc.delete(rplno);
      
      List<AttachbdVO> attachbd_list = attachbdProc.list_by_contentsbdno(contentsbdno);
      mav.addObject("attachbd_list", attachbd_list);

      List<RplVO> rpl_list = rplProc.list_by_contentsbdno(contentsbdno);
      mav.addObject("rpl_list", rpl_list);
      
      mav.setViewName("/contentsbd/file_delete"); // file_delete.jsp

      return mav;
    }
  
    /**
     * http://localhost:9090/team7/contentsbd/liketo.do?contentsbdno=3
     * {"count":1,"recom":1498}
     * @param contentsbdVO
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/contentsbd/liketo.do",
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
    public String liketo(ContentsbdVO contentsbdVO) {
     // System.out.println("contentsbdno: " + contentsbdVO.getContentsbdno() );
      int count = contentsbdProc.liketo(contentsbdVO.getContentsbdno());

      contentsbdVO = contentsbdProc.read(contentsbdVO.getContentsbdno());
      
      JSONObject obj = new JSONObject();
      obj.put("count",count);
      obj.put("recom",contentsbdVO.getRecom());
   
      return obj.toString(); // {"count":1}

    }
  
    /**
     * http://localhost:9090/ojt/contentsbd/rpl_delete.do?rplno=1&passwd=1234
     * {"delete_count":0,"count":0}
     * {"delete_count":1,"count":1}
     * @param rplno
     * @param passwd
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/contentsbd/rpl_delete.do", 
                    method = RequestMethod.POST,
                    produces = "text/plain;charset=UTF-8")
    public String rpl_delete(int rplno, String passwd) {
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("rplno", rplno);
      map.put("passwd", passwd);
      
      int count = rplProc.checkPasswd(map); // 패스워드 검사
      int delete_count = 0;
      if (count == 1) {
        delete_count = rplProc.delete(rplno); // 댓글 삭제
      }
      
      JSONObject obj = new JSONObject();
      obj.put("count", count);
      obj.put("delete_count", delete_count);
      
      return obj.toString();
    }

  
  
  
  
  
  
  
  
  
  
}
