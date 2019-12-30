package dev.mvc.econtents;

import java.util.List;

public interface EcontentsDAOInter {

  /**
   * <Xmp>
   * 카테고리 그룹 등록
   * <insert id="create" parameterType="EcontentsVO"> 
   * </Xmp>
   * @param econtentsVO
   * @return 처리된 레코드 갯수
   */
  public int create(EcontentsVO econtentsVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="EcontentsVO">
   * </xmp> 
   * @return
   */
  public List<EcontentsVO> list();
  
  /**
   * 조회
   * <xmp>
   * <select id="read" resultType="EcontentsVO" parameterType="int">
   * </xmp>
   * @return
   */
  public EcontentsVO read(int econtentsno);
  
  /**
   * 수정
   * <xmp>
   * <update id='update' parameterType="EcontentsVO">
   * </xmp>
   * @return
   */
  public int update(EcontentsVO econtentsVO);
  
  /**
   * 삭제
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @return
   */
  public int delete(int econtentsno);
  
  /**
   * <xmp> 전체 목록 <select id="list_all" resultType="ContentsVO"> </xmp>
   * 
   * @return
   */
  public List<EcontentsVO> list_all();
}
