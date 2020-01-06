package dev.mvc.customgrp;

import java.util.List;





// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언 
public interface CustomgrpDAOInter {
  // 매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.  
  
  /**
   * <insert id="create" parameterType="CustomgrpVO">
   * @param customgrpVO
   * @return
   */
  public int create(CustomgrpVO customgrpVO); 
  
  /**
   * 목록
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