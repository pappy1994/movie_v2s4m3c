package dev.mvc.contentsmv;

import java.util.List;

public interface ContentsmvDAOInter {
  /**
   * <xmp> 등록 <insert id="create" parameterType="ContentsVO"> </xmp>
   * 
   * @param contentsVO
   * @return 등록된 레코드 갯수
   */
  public int create(ContentsmvVO contentsmvVO);

  /**
   * <xmp> 전체 목록 <select id="list_all" resultType="ContentsmvVO"> </xmp>
   * 
   * @return
   */
  public List<ContentsmvVO> list_all();
  
  
  public List<ContentsmvVO> list_by_customgrpno(int customgrpno);
  
  /**
   * <select id="read" resultType="ContentsmvVO" parameterType="int">
   * @param contentsmvno
   * @return
   */
  public ContentsmvVO read(int contentsmvno);
  
  /**
   * <update id='update' parameterType="ContentsmvVO">
   * @param contentsmvVO
   * @return
   */
  public int update(ContentsmvVO contentsmvVO); 
  
  /**
   * 한건 삭제
   * @param contentsmvno
   * @return
   */
  public int delete(int contentsmvno);
  
}




