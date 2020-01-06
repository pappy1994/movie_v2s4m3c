package dev.mvc.attachbd;

import java.util.List;

public interface AttachbdProcInter {
 
  /**
   * <xmp>
   * 파일 등록
   * <insert id="create" parameterType="AttachbdVO">
   * </xmp>
   * @param attachbdVO
   * @return
   */
  public int create(AttachbdVO attachbdVO);
  
  /**
   * 파일 목록
   * @return
   */
  public List<Contentsbd_AttachbdVO> list();
  
  /**
   * contentsbdno별 첨부 파일 목록 
   * @param contentsbdno
   * @return
   */
  public List<AttachbdVO> list_by_contentsbdno(int contentsbdno);
  
  /**
   * 번호에따른 파일 삭제 
   * @param attachbdno
   * @return 삭제된 레코드 갯수
   */
  public int delete(int attachbdno); 
  
  /**
   * contentsbdno 별 레코드 갯수
   * @param contentsbdno
   * @return 레코드 갯수
   */
  public int count_by_contentsbdno(int contentsbdno);
  
  /**
   * contentsno 별 레코드 삭제
   * @param contentsno
   * @return 레코드 갯수
   */
  public int delete_by_contentsbdno(int contentsbdno);
  
}