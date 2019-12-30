package dev.mvc.eventgrp;

import java.util.List;

public interface EventgrpProcInter {
  
  /**
   * <Xmp>
   * 카테고리 그룹 등록
   * <insert id="create" parameterType="EventgrpVO"> 
   * </Xmp>
   * @param eventgrpVO
   * @return 처리된 레코드 갯수
   */
  public int create(EventgrpVO eventgrpVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="EventgrpVO">
   * </xmp> 
   * @return
   */
  public List<EventgrpVO> list_eventgrpno_asc();
 
  /**
   * 조회
   * <xmp>
   *   <select id="read" resultType="EventgrpVO" parameterType="int">
   * </xmp>  
   * @param eventgrpno
   * @return
   */
  public EventgrpVO read(int eventgrpno);
  
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="EventgrpVO"> 
   * </xmp>
   * @param eventgrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(EventgrpVO eventgrpVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param eventgrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int eventgrpno);
  
}
