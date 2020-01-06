package dev.mvc.boardgrp;

import java.util.List;

public interface BoardgrpDAOInter {

  /**
   * <xmp>
   * 등록
   * <insert id="create" parameterType="BoardgrpVO">
   * </xmp>
   * @return
   * */
  public int create(BoardgrpVO boardgrpVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_seqno_asc" resultType="BoardgrpVO">
   * </xmp> 
   * @return
   */
  public List<BoardgrpVO> list();
  
  /**
   * 출력 순서 상향
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   * @param boardgrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_up(int boardgrpno);
  
  /**
   * 출력 순서 하향
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   * @param boardgrpno
   * @return 처리된 레코드 갯수
   */
   public int update_seqno_down (int boardgrpno);
  
   /**
    * 조회
    * <xmp>
    * <select id="read" resultType="BoardgrpVO" parameterType="int">
    * </xmp>  
    * @param boardgrpno
    * @return
    */
    public BoardgrpVO read(int boardgrpno);
   
    /**
     * 수정 처리
     * <xmp>
     * <update id="update" parameterType="BoardgrpVO">
     * </xmp>
     * @param boardgrpVO
     * @return 처리된 레코드 갯수
     */
    public int update(BoardgrpVO boardgrpVO);
    
    /**
     * 삭제 처리
     * <xmp>
     * <delete id="delete" parameterType="int">
     * </xmp> 
     * @param boardgrpno
     * @return 처리된 레코드 갯수
     */
    public int delete(int boardgrpno);
  
     /**
     * <xmp>
     * 그룹에 속한 컨텐츠 글 수 증가
     * <update id="increaseCnt" parameterType="int">
     * </xmp>
     * @param boardgrpno
     * @return
     */
    public int increaseCnt(int boardgrpno);
    
    /**
     * <xmp>
     * 그룹에 속한 컨텐츠 글 수 감소
     * <update id="decreaseCnt" parameterType="int">
     * </xmp>
     * @param boardgrpno
     * @return
     */
    public int decreaseCnt(int boardgrpno);
  
    /**
     * cnt 컬럼 0으로 초기화
     * <xmp>
     * <update id="cnt_zero" parameterType="int"> 
     * </xmp>
     * @param boardgrpno
     * @return
     */
    public int cnt_zero(int boardgrpno);
  
  
  
  
}
