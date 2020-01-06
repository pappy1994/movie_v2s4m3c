package dev.mvc.qnagrp;

import java.util.List;

public interface QnagrpProcInter {
  /**
   * <Xmp>
   * ī�װ� �׷� ���
   * <insert id="create" parameterType="QnacategrpVO"> 
   * </Xmp>
   * @param categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int create(QnagrpVO qnagrpVO);
  
  /**
   * ���
   * <select id="list_seqno_asc" resultType="QnagrpVO" > 
   * @return
   */
  public List<QnagrpVO> list_seqno_asc();
  
  /**
   * ����
   * <xmp>
   * <update id="update" parameterType="QnacategrpVO">
   * </xmp>
   * @param qnacategrpVO
   * @return
   */
  public int update(QnagrpVO qnagrpVO);
  
  /**
   * <select id="read" resultType="QnacategrpVO" parameterType="int">
   * @param qnacategrpno
   * @return
   */
  public QnagrpVO read(int qnagrpno);
  
  /**
   * <delete id="delete" parameterType="int">
   * @param qnacategrpno
   * @return
   */
  public int delete(int qnagrpno);
  
  /**
   * <update id="update_seqno_up" parameterType="int"> 
   * @param qnagrpno
   * @return
   */
  public int update_seqno_up(int qnagrpno);
  
  /**
   * <update id="update_seqno_down" parameterType="int"> 
   * @param qnagrpno
   * @return
   */
  public int update_seqno_down(int qnagrpno);
   
}



