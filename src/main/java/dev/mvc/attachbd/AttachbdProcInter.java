package dev.mvc.attachbd;

import java.util.List;

public interface AttachbdProcInter {
 
  /**
   * <xmp>
   * ���� ���
   * <insert id="create" parameterType="AttachbdVO">
   * </xmp>
   * @param attachbdVO
   * @return
   */
  public int create(AttachbdVO attachbdVO);
  
  /**
   * ���� ���
   * @return
   */
  public List<Contentsbd_AttachbdVO> list();
  
  /**
   * contentsbdno�� ÷�� ���� ��� 
   * @param contentsbdno
   * @return
   */
  public List<AttachbdVO> list_by_contentsbdno(int contentsbdno);
  
  /**
   * ��ȣ������ ���� ���� 
   * @param attachbdno
   * @return ������ ���ڵ� ����
   */
  public int delete(int attachbdno); 
  
  /**
   * contentsbdno �� ���ڵ� ����
   * @param contentsbdno
   * @return ���ڵ� ����
   */
  public int count_by_contentsbdno(int contentsbdno);
  
  /**
   * contentsno �� ���ڵ� ����
   * @param contentsno
   * @return ���ڵ� ����
   */
  public int delete_by_contentsbdno(int contentsbdno);
  
}