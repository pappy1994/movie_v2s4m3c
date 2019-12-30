package dev.mvc.customgrp;

import java.util.List;





// MyBATIS�� <mapper namespace="dev.mvc.categrp.CategrpDAOInter">�� ���� 
public interface CustomgrpDAOInter {
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.  
  
  /**
   * <insert id="create" parameterType="CustomgrpVO">
   * @param customgrpVO
   * @return
   */
  public int create(CustomgrpVO customgrpVO); 
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="CustomgrpVO">
   * </xmp> 
   * @return
   */
  public List<CustomgrpVO> list();

  public CustomgrpVO read(int customgrpno);    
  
  public int update(CustomgrpVO customgrpVO);
  
  public int delete(int customgrpno);
}