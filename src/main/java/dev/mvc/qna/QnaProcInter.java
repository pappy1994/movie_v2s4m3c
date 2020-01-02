package dev.mvc.qna;

import java.util.List;

public interface QnaProcInter {
  
  /**
   * <xmp> 등록 <insert id="create" parameterType="qnaVO"> </xmp>
   * 
   * @param contentsVO
   * @return 등록된 레코드 갯수
   */
  public int create(QnaVO qnaVO);
  
  /**
   * <xmp> 전체 목록 <select id="list_all" resultType="ContentsVO"> </xmp>
   * 
   * @return
   */
  public List<QnaVO> list_all();

  /**
   * <xmp> qnagrpno별 전체 목록
   * <select id="list_by_qnagrpno" resultType="QnaVO" parameterType="int">
   * </xmp>
   * 
   * @return
   */
  public List<QnaVO> list_by_qnagrpno(int qnagrpno);
  
  /**
   * <select id="read" resultType="QnaVO" parameterType="int"> 
   * @param qnagrpno
   * @return
   */
  public QnaVO read(int qnano);
  
  /**
   * <update id='update' parameterType="QnaVO"> 
   * @param qnaVO
   * @return
   */
  public int update(QnaVO qnaVO);
  
  /**
   * <delete id="delete" parameterType="int"> 
   * @param qnano
   * @return
   */
  public int delete(int qnano);
  

 
  
  
}


