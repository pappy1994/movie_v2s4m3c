package dev.mvc.contentsbd;

import java.util.HashMap;
import java.util.List;

public interface ContentsbdDAOInter {

 /**
  * <xmp>
  * 등록
  * <insert id = "create" parameterType="ContentsbdVO">
  * </xmp>
  * @return
  * */ 
  public int create(ContentsbdVO contentsbdVO);
  
  /**
   * <xmp>
   * 목록
   * <select id="list_all" resultType="ContentsbdVO">
   * </xmp>
   * @return
   * */ 
  public List<ContentsbdVO> list_all();
  
  /**
   * <xmp>
   * 게시판 번호별 목록
   * <select id="list_by_boardgrpno" resultType="ContentsbdVO" parameterType="int">
   * </xmp>
   * @return
   * */ 
  public List<ContentsbdVO> list_by_boardgrpno(int boardgrpno);
  
  /**
   * <xmp>
   * 전체 등록 레코드 갯수 
   * <select id="total_count" resultType="int">
   * </xmp>
   * @return 전체 등록 레코드 갯수
   */
  public int total_count();
    
  /**
   * <xmp>
   * 조회
   * <select id="read" resultType="ContentsbdVO" parameterType="int">
   * </xmp> 
   * @param contentsbdno
   * @return
   */
  public ContentsbdVO read(int contentsbdno);
  
  /**
   * 수정
   * @param contentsbdVO
   * @return 수정된 레코드 갯수
   */
  public int update(ContentsbdVO contentsbdVO);
  
  /**
   * 한건 삭제
   * @param contentsbdno
   * @return
   */
  public int delete(int contentsbdno);
  
  /**
   * <xmp>
   * 부모 카테고리 번호별 레코드 갯수
   * <select id="count_by_boardgrpno" resultType="int">
   * </xmp>
   * @param boardgrpno
   * @return
   */
  public int count_by_boardgrpno(int boardgrpno);
  
  /**
   * <xmp>
   * 부모 카테고리 번호별 레코드 삭제
   * <delete id="delete_by_boardgrpno" parameterType="int">
   * </xmp>
   * @param boardgrpno
   * @return
   */
  public int delete_by_boardgrpno(int boardgrpno);
  
  public int increaseReplycnt(int contentsbdno);
  
  public int decreaseReplycnt(int contentsbdno);
  
  public int liketo(int contentsbdno);
  
  /**
   * 카테고리별 검색 목록
   * @param hashMap
   * @return
   */
  public List<ContentsbdVO> list_by_boardgrpno_search(HashMap<String, Object> hashMap);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  
  
  
  
  
  
  
  
  
}
