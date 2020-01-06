package dev.mvc.boardgrp;

import java.util.List;

public interface BoardgrpDAOInter {

  /**
   * <xmp>
   * ���
   * <insert id="create" parameterType="BoardgrpVO">
   * </xmp>
   * @return
   * */
  public int create(BoardgrpVO boardgrpVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_seqno_asc" resultType="BoardgrpVO">
   * </xmp> 
   * @return
   */
  public List<BoardgrpVO> list();
  
  /**
   * ��� ���� ����
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   * @param boardgrpno
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_up(int boardgrpno);
  
  /**
   * ��� ���� ����
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   * @param boardgrpno
   * @return ó���� ���ڵ� ����
   */
   public int update_seqno_down (int boardgrpno);
  
   /**
    * ��ȸ
    * <xmp>
    * <select id="read" resultType="BoardgrpVO" parameterType="int">
    * </xmp>  
    * @param boardgrpno
    * @return
    */
    public BoardgrpVO read(int boardgrpno);
   
    /**
     * ���� ó��
     * <xmp>
     * <update id="update" parameterType="BoardgrpVO">
     * </xmp>
     * @param boardgrpVO
     * @return ó���� ���ڵ� ����
     */
    public int update(BoardgrpVO boardgrpVO);
    
    /**
     * ���� ó��
     * <xmp>
     * <delete id="delete" parameterType="int">
     * </xmp> 
     * @param boardgrpno
     * @return ó���� ���ڵ� ����
     */
    public int delete(int boardgrpno);
  
     /**
     * <xmp>
     * �׷쿡 ���� ������ �� �� ����
     * <update id="increaseCnt" parameterType="int">
     * </xmp>
     * @param boardgrpno
     * @return
     */
    public int increaseCnt(int boardgrpno);
    
    /**
     * <xmp>
     * �׷쿡 ���� ������ �� �� ����
     * <update id="decreaseCnt" parameterType="int">
     * </xmp>
     * @param boardgrpno
     * @return
     */
    public int decreaseCnt(int boardgrpno);
  
    /**
     * cnt �÷� 0���� �ʱ�ȭ
     * <xmp>
     * <update id="cnt_zero" parameterType="int"> 
     * </xmp>
     * @param boardgrpno
     * @return
     */
    public int cnt_zero(int boardgrpno);
  
  
  
  
}
