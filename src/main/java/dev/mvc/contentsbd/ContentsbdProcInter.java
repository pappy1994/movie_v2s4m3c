package dev.mvc.contentsbd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ContentsbdProcInter {

  /**
   * <xmp>
   * ���
   * <insert id = "create" parameterType="ContentsbdVO">
   * </xmp>
   * @return
   * */ 
   public int create(ContentsbdVO contentsbdVO);
  
   /**
    * <xmp>
    * ���
    * <select id="list_all" resultType="ContentsbdVO">
    * </xmp>
    * @return
    * */ 
   public List<ContentsbdVO> list_all();
   
   /**
    * <xmp>
    * �Խ��� ��ȣ�� ���
    * <select id="list_by_boardgrpno" resultType="ContentsbdVO" parameterType="int">
    * </xmp>
    * @return
    * */ 
   public List<ContentsbdVO> list_by_boardgrpno(int boardgrpno);
  
   /**
    * <xmp>
    * ��ü ��� ���ڵ� ���� 
    * <select id="total_count" resultType="int">
    * </xmp>
    * @return ��ü ��� ���ڵ� ����
    */
   public int total_count();
     
   /**
    * <xmp>
    * ��ȸ
    * <select id="read" resultType="ContentsbdVO" parameterType="int">
    * </xmp> 
    * @param contentsbdno
    * @return
    */
   public ContentsbdVO read(int contentsbdno);
  
   /**
    * ����
    * @param contentsbdVO
    * @return ������ ���ڵ� ����
    */
   public int update(ContentsbdVO contentsbdVO);
  
   /**
    * �Ѱ� ����
    * @param contentsbdno
    * @return
    */
   public int delete(int contentsbdno);
    
   /**
    * <xmp>
    * �θ� ī�װ� ��ȣ�� ���ڵ� ����
    * <select id="count_by_boardgrpno" resultType="int">
    * </xmp>
    * @param boardgrpno
    * @return
    */
   public int count_by_boardgrpno(int boardgrpno);
   
   /**
    * <xmp>
    * �θ� ī�װ� ��ȣ�� ���ڵ� ����
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
    * ī�װ��� �˻� ���
    * @param hashMap
    * @return
    */
   public List<ContentsbdVO> list_by_boardgrpno_search(HashMap<String, Object> hashMap);
   
   /**
    * ī�װ��� �˻� ���ڵ� ����
    * @param hashMap
    * @return
    */
   public int search_count(HashMap<String, Object> hashMap);
   
   /**
    * ������ ��� ���ڿ� ����, Box ����
    * @param listFile ��� ���ϸ� 
    * @param categrpno ī�װ���ȣ
    * @param search_count �˻� ����
    * @param nowPage ���� ������, nowPage�� 1���� ����
    * @param word �˻���
    * @return
    */
   public String pagingBox(String listFile, int boardgrpno, int search_count, int nowPage, String word);
    
   
   /**
    * <xmp>
    * �˻� + ����¡ ���
    * <select id="list_by_boardgrpno_search_paging" resultType="ContentsVO" parameterType="HashMap">
    * </xmp>
    * @param map
    * @return
    */
   public ArrayList<ContentsbdVO> list_by_boardgrpno_search_paging(HashMap<String, Object> map);
   
   
  
  
  
  
  
  
  
  
}
