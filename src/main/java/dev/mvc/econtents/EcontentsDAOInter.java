package dev.mvc.econtents;

import java.util.List;

public interface EcontentsDAOInter {

  /**
   * <Xmp>
   * ī�װ� �׷� ���
   * <insert id="create" parameterType="EcontentsVO"> 
   * </Xmp>
   * @param econtentsVO
   * @return ó���� ���ڵ� ����
   */
  public int create(EcontentsVO econtentsVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="EcontentsVO">
   * </xmp> 
   * @return
   */
  public List<EcontentsVO> list();
  
  /**
   * ��ȸ
   * <xmp>
   * <select id="read" resultType="EcontentsVO" parameterType="int">
   * </xmp>
   * @return
   */
  public EcontentsVO read(int econtentsno);
  
  /**
   * ����
   * <xmp>
   * <update id='update' parameterType="EcontentsVO">
   * </xmp>
   * @return
   */
  public int update(EcontentsVO econtentsVO);
  
  /**
   * ����
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @return
   */
  public int delete(int econtentsno);
  
  /**
   * <xmp> ��ü ��� <select id="list_all" resultType="ContentsVO"> </xmp>
   * 
   * @return
   */
  public List<EcontentsVO> list_all();
}
