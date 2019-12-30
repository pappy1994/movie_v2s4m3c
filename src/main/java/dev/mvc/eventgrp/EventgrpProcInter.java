package dev.mvc.eventgrp;

import java.util.List;

public interface EventgrpProcInter {
  
  /**
   * <Xmp>
   * ī�װ� �׷� ���
   * <insert id="create" parameterType="EventgrpVO"> 
   * </Xmp>
   * @param eventgrpVO
   * @return ó���� ���ڵ� ����
   */
  public int create(EventgrpVO eventgrpVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="EventgrpVO">
   * </xmp> 
   * @return
   */
  public List<EventgrpVO> list_eventgrpno_asc();
 
  /**
   * ��ȸ
   * <xmp>
   *   <select id="read" resultType="EventgrpVO" parameterType="int">
   * </xmp>  
   * @param eventgrpno
   * @return
   */
  public EventgrpVO read(int eventgrpno);
  
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="EventgrpVO"> 
   * </xmp>
   * @param eventgrpVO
   * @return ó���� ���ڵ� ����
   */
  public int update(EventgrpVO eventgrpVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param eventgrpno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int eventgrpno);
  
}
