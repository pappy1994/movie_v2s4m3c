package dev.mvc.customgrp;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언
// 스프링이 자동으로 구현
public interface CustomgrpProcInter {
  /**
   * <insert id="create" parameterType="CustomgrpVO">
   * @param customgrpVO
   * @return
   */
  public int create(CustomgrpVO customgrpVO); 
  
  /**
   * 목록
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


