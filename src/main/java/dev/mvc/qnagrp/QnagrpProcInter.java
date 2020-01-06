package dev.mvc.qnagrp;

import java.util.List;

public interface QnagrpProcInter {
  /**
   * <Xmp>
   * 카테고리 그룹 등록
   * <insert id="create" parameterType="QnacategrpVO"> 
   * </Xmp>
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int create(QnagrpVO qnagrpVO);
  
  /**
   * 목록
   * <select id="list_seqno_asc" resultType="QnagrpVO" > 
   * @return
   */
  public List<QnagrpVO> list_seqno_asc();
  
  /**
   * 수정
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



