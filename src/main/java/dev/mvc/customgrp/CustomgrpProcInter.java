package dev.mvc.customgrp;

import java.util.List;

// MyBATIS�� <mapper namespace="dev.mvc.categrp.CategrpDAOInter">�� ����
// �������� �ڵ����� ����
public interface CustomgrpProcInter {
  /**
   * <insert id="create" parameterType="CustomgrpVO">
   * @param customgrpVO
   * @return
   */
  public int create(CustomgrpVO customgrpVO); 
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="CategrpVO">
   * </xmp> 
   * @return
   */
  public List<CustomgrpVO> list();
 
  
  public CustomgrpVO read(int customgrpno);
  
  public int update(CustomgrpVO customgrpVO);
  
  public int delete(int customgrpno);
}


