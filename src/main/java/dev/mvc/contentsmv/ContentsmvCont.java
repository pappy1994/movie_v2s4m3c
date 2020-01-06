package dev.mvc.contentsmv;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import dev.mvc.customgrp.CustomgrpProcInter;
import dev.mvc.customgrp.CustomgrpVO;
import nation.web.tool.Tool;

@Controller
public class ContentsmvCont {
  @Autowired
  @Qualifier("dev.mvc.contentsmv.ContentsmvProc")
  private ContentsmvProcInter contentsmvProc;

  @Autowired
  @Qualifier("dev.mvc.customgrp.CustomgrpProc") // �̸� ����
  private CustomgrpProcInter customgrpProc;
  
  
  public ContentsmvCont() {
    System.out.println("--> ContentsmvCont created.");
  }

  // http://localhost:9090/ojt/contents/create.do?mno=1&categrpno=1
  @RequestMapping(value = "/contentsmv/create.do", method = RequestMethod.GET)
  public ModelAndView create(int customgrpno) {
    ModelAndView mav = new ModelAndView();

    CustomgrpVO customgrpVO = customgrpProc.read(customgrpno);
    mav.addObject("customgrpVO", customgrpVO);

    mav.setViewName("/contentsmv/create"); // /webapp/contents/create.jsp

    return mav;
  }

  @RequestMapping(value = "/contentsmv/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           ContentsmvVO contentsmvVO) {
    ModelAndView mav = new ModelAndView();

    int count = contentsmvProc.create(contentsmvVO);

   /* if (count == 1) {
      customgrpProc.increaseCnt(contentsVO.getcustomgrpno()); // ī�װ� �ۼ� ����
    }*/
    // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
    // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
    
    ra.addAttribute("count", count); // redirect parameter ����
    ra.addAttribute("customgrpno", contentsmvVO.getCustomgrpno());
    
    mav.setViewName("redirect:/contentsmv/create_msg.jsp");

    return mav;
  }

  @RequestMapping(value = "/contentsmv/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();

    List<ContentsmvVO> list = contentsmvProc.list_all();
    mav.addObject("list", list);
    mav.setViewName("/contentsmv/list_all"); // /webapp/contents/list_all.jsp

    return mav;
  }
  
  @RequestMapping(value = "/contentsmv/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_customgrpno(int customgrpno) {
    ModelAndView mav = new ModelAndView();

    List<ContentsmvVO> list = contentsmvProc.list_by_customgrpno(customgrpno);
    mav.addObject("list", list);
    // /webapp/contents/list.jsp

    CustomgrpVO customgrpVO = customgrpProc.read(customgrpno);
    mav.addObject("customgrpVO", customgrpVO);

    mav.setViewName("/contentsmv/list"); // ī�װ� �׷캰 ���

    return mav;
  }
  /**
   * ��ȸ http://localhost:9090/ojt/contents/read.do?contentsno=1
   * 
   * @param contentsmvno
   * @return
   */
  @RequestMapping(value = "/contentsmv/read.do", method = RequestMethod.GET)
  public ModelAndView read(int contentsmvno) {
    ModelAndView mav = new ModelAndView();

    ContentsmvVO contentsmvVO = contentsmvProc.read(contentsmvno);
    mav.addObject("contentsmvVO", contentsmvVO);

    CustomgrpVO customgrpVO = customgrpProc.read(contentsmvVO.getCustomgrpno());
    mav.addObject("customgrpVO", customgrpVO);
    
    /*List<AttachfileVO> attachfile_list = attachfileProc.list_by_contentsno(contentsno);
    mav.addObject("attachfile_list", attachfile_list);*/
    
    mav.setViewName("/contentsmv/read");

    return mav;
  }
  
//http://localhost:9090/ojt/contents/update.do?memberno=1&categrpno=1
 @RequestMapping(value = "/contentsmv/update.do", method = RequestMethod.GET)
 public ModelAndView update(int customgrpno, int contentsmvno) {
   ModelAndView mav = new ModelAndView();

   CustomgrpVO customgrpVO = customgrpProc.read(customgrpno);
   mav.addObject("customgrpVO", customgrpVO);

   ContentsmvVO contentsmvVO = contentsmvProc.read(contentsmvno);
   mav.addObject("contentsmvVO", contentsmvVO);

   mav.setViewName("/contentsmv/update"); // /webapp/contents/update.jsp

   return mav;
 }

 /**
  * ���� ó��
  * @param contentsVO
  * @return
  */
 @RequestMapping(value = "/contentsmv/update.do", 
                            method = RequestMethod.POST)
 public ModelAndView update(RedirectAttributes ra,
                                           ContentsmvVO contentsmvVO) {
   ModelAndView mav = new ModelAndView();

   int count = contentsmvProc.update(contentsmvVO);

   // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
   // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
   ra.addAttribute("count", count);
   ra.addAttribute("customgrpno", contentsmvVO.getCustomgrpno());
   ra.addAttribute("contentsmvno", contentsmvVO.getContentsmvno());
   
   mav.setViewName("redirect:/contentsmv/update_msg.jsp");

   return mav;
 }
 
 /**
  * �Ѱ� ������
  * @param customgrpno
  * @param contentsmvno
  * @return
  */
 // http://localhost:9090/ojt/contentsmv/delete.do?customgrpno=1&contentsmvno=1
 @RequestMapping(value = "/contentsmv/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete(int customgrpno, int contentsmvno) {
   ModelAndView mav = new ModelAndView();

   CustomgrpVO customgrpVO = customgrpProc.read(customgrpno);
   mav.addObject("customgrpVO", customgrpVO);

   ContentsmvVO contentsmvVO = contentsmvProc.read(contentsmvno);
   mav.addObject("contentsmvVO", contentsmvVO);
   
   /*// FK contentsno �÷� ���� ���� ���ڵ� ���� ����: id="count_by_contentsno" 
   int count_by_contentsmvno = attachfileProc.count_by_contentsno(contentsno);
   mav.addObject("count_by_contentsno", count_by_contentsno);*/
   
   mav.setViewName("/contentsmv/delete"); // /webapp/contents/delete.jsp

   return mav;
 }
 
 /**
  * �Ѱ� ���� ó��
  * @param ra
  * @param customgrpno
  * @param contentsmvno
  * @return
  */
 @RequestMapping(value = "/contentsmv/delete.do", 
                            method = RequestMethod.POST)
 public ModelAndView delete(HttpSession session,
                                          RedirectAttributes ra,
                                           int customgrpno,
                                           int contentsmvno) {
   ModelAndView mav = new ModelAndView();

   int mno = (Integer)session.getAttribute("mno");
   // ���� �α����� ����ڿ� �� ����ڰ� ������ �˻�
   if (mno == contentsmvProc.read(contentsmvno).getMno()) {
     int count = contentsmvProc.delete(contentsmvno);
     /*if (count == 1) {
       customgrpProc.decreaseCnt(customgrpno);
     }*/

     ra.addAttribute("count", count);
     ra.addAttribute("customgrpno", customgrpno);
     ra.addAttribute("contentsmvno", contentsmvno);
     
     mav.setViewName("redirect:/contentsmv/delete_msg.jsp");
   } else {
     ra.addAttribute("customgrpno", customgrpno);
     mav.setViewName("redirect:/contentsmv/auth_fail_msg.jsp");
   }

   return mav;
 }
  
}