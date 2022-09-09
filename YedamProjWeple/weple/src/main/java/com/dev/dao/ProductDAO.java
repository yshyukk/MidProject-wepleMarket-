package com.dev.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.dev.common.DAO;
import com.dev.vo.Criteria;
import com.dev.vo.Product;

public class ProductDAO extends DAO {
	
	public List<String> searchSalesRegions(int prodId) {
		String sql = "select * from v_stock where prod_id = " + prodId;
		List<String> list = new ArrayList<>();
		
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(rs.getString("region"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	};

	//전체 리스트
	public List<Product> showAllList() {
		String sql = "select * from products order by catg_level_3";
		List<Product> list = new ArrayList<>();
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Product vo = new Product();
				vo.setCatgLevel3(rs.getInt("catg_level_3"));
				vo.setContent(rs.getString("content"));
				vo.setImgUrl(rs.getString("img_url"));
				vo.setIsShare(rs.getInt("is_share"));
				vo.setOrigin(rs.getString("origin"));
				vo.setProdId(rs.getInt("prod_id"));
				vo.setProdName(rs.getString("prod_name"));
				vo.setProdPrice(rs.getInt("prod_price"));
				vo.setSharePeople(rs.getInt("share_people"));
				vo.setWeight(rs.getInt("weight"));
				vo.setParticipatePeople(rs.getInt("participate_people"));
				vo.setCatgLevel1(rs.getInt("catg_level_1"));
				vo.setCatgLevel2(rs.getInt("catg_level_2"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	//크롤링
	public void crawlingInsert(Product vo) {
		String sql = "insert into products values (prod_id_seq.nextval, ?, ?, ?, ?, null, 'null', 0, 0, ?, default)";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@54.205.133.2:1521:xe", "weple", "weple123");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getImgUrl());
			pstmt.setString(2, vo.getProdName());
			pstmt.setInt(3, vo.getProdPrice());
			pstmt.setInt(4, vo.getWeight());
			pstmt.setInt(5, vo.getCatgLevel3());
			int r = pstmt.executeUpdate();
			if (r > 0) {
				System.out.println("상품 " + vo.getProdName() + " 등록 완료.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	// 하위 카테고리id 목록
	public List<Integer> getCatgId(int get, int where, int id) {
		String sql = "select distinct catg_level_" + get + " from products where catg_level_" + where + " = " + id;
		List<Integer> list = new ArrayList<>();
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Integer i = rs.getInt(1);
				list.add(i);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	// 카테고리 아이디로 검색해서 Product 객체 가져오기
	public List<Product> searchProductUsingCatgId(int where, int id, String user) {
		String sql = "select  decode(c.sum, null, '0', c.sum) totaljjim, "
				+ "decode(t.sum, null, '0', t.sum) myjjim, "
				+ "decode(b.avg_cnt, null, 99.9, b.avg_cnt) avg_star, p.* "
				+ "from products p,  (select count(*) sum, prod_id from jjim group by prod_id) c, "
				+ "(select count(*) sum, prod_id from jjim where user_id='"+user+"' group by prod_id) t, "
				+ "(select prod_id, round(avg(cnt),1) avg_cnt from boards where board_type=3 group by prod_id) b "
				+ "where p.prod_id = c.prod_id(+) "
				+ "and c.prod_id = t.prod_id(+) "
				+ "and p.prod_id = b.prod_id(+) "
				+ "and catg_level_"+where+" = "+id;
		List<Product> list = new ArrayList<>();
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Product vo = new Product();
				vo.setCatgLevel3(rs.getInt("catg_level_3"));
				vo.setContent(rs.getString("content"));
				vo.setImgUrl(rs.getString("img_url"));
				vo.setIsShare(rs.getInt("is_share"));
				vo.setOrigin(rs.getString("origin"));
				vo.setProdId(rs.getInt("prod_id"));
				vo.setProdName(rs.getString("prod_name"));
				vo.setProdPrice(rs.getInt("prod_price"));
				vo.setSharePeople(rs.getInt("share_people"));
				vo.setWeight(rs.getInt("weight"));
				vo.setParticipatePeople(rs.getInt("participate_people"));
				vo.setCatgLevel1(rs.getInt("catg_level_1"));
				vo.setCatgLevel2(rs.getInt("catg_level_2"));
				vo.setMyjjim(rs.getInt("myjjim"));
				vo.setTotaljjim(rs.getInt("totaljjim"));
				vo.setAvgStar(rs.getDouble("avg_star"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	/*
	 * 상위 카테고리 레벨로 카테코리 목록 가져오기
	 * get = 1 : 상위 카테고리 목록
	 * get = 2 : 서브 카메고리 목록
	 * get = 3 : 하위 카테고리 목록
	 */
	public List<Integer> searchProdCatgIdUsingCatgLevel(int get, int id) {
		String sql="";
		if (get == 1) {
			sql = "select distinct catg_level_1 from products where catg_level_1 is not null";
		} else if (get == 2) {
			sql = "select distinct catg_level_2 from products where catg_level_1="+id+" and catg_level_2 is not null";
		} else if (get == 3) {
			sql = "select distinct catg_level_3 from products where catg_level_2="+id+" and catg_level_3 is not null";
		}
		
		List<Integer> list = new ArrayList<>();
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	}
	
	//  prod_id로 products테이블에서 상품 조회하는 메소드(prod_id, prod_name, prod_price만)
	public Product selectOneProd(int prodId) {
		Product product = null;
		try {
			connect();
			String sql = "select * from products where prod_id = " + prodId;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				product = new Product();
				product.setProdId(rs.getInt("prod_id"));
				product.setProdName(rs.getString("prod_name"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setCatgLevel1(rs.getInt("catg_level_1"));
				product.setCatgLevel2(rs.getInt("catg_level_2"));
				product.setCatgLevel3(rs.getInt("catg_level_3"));
				product.setContent(rs.getString("content"));
				product.setImgUrl(rs.getString("img_url"));
				product.setIsShare(rs.getInt("is_share"));
				product.setWeight(rs.getInt("weight"));
				product.setOrigin(rs.getString("origin"));
				product.setSharePeople(rs.getInt("share_people"));
				product.setParticipatePeople(rs.getInt("participate_people"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return product;
	}
	
	// 공동구매 마감임박
	public List<Product> searchSharedProd() {
		String sql = "select * from v_prod_share_list";
		List<Product> list = new ArrayList<>();
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product();
				product.setProdId(rs.getInt("prod_id"));
				product.setProdName(rs.getString("prod_name"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setCatgLevel1(rs.getInt("catg_level_1"));
				product.setCatgLevel2(rs.getInt("catg_level_2"));
				product.setCatgLevel3(rs.getInt("catg_level_3"));
				product.setContent(rs.getString("content"));
				product.setImgUrl(rs.getString("img_url"));
				product.setIsShare(rs.getInt("is_share"));
				product.setWeight(rs.getInt("weight"));
				product.setOrigin(rs.getString("origin"));
				product.setSharePeople(rs.getInt("share_people"));
				product.setParticipatePeople(rs.getInt("participate_people"));
				product.setRatio(rs.getDouble("ratio"));
				product.setStar(rs.getInt("star"));
				list.add(product);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	// 랜덤 상품 추천
	public Set<Product> selectRandomProd() {
		Set<Product> list = new HashSet<>();
		String sql1 = "select * from "
				+ "(select * from "
				+ "(select * from "
				+ "(select * from products where prod_id != 0 and catg_level_1 = 95739 order by DBMS_RANDOM.RANDOM) where rownum < 9 "
				+ "union all "
				+ "select * from "
				+ "(select * from products where prod_id != 0 and catg_level_1 = 95740 order by DBMS_RANDOM.RANDOM) where rownum < 9) "
				+ "union all "
				+ "select * from "
				+ "(select * from "
				+ "(select * from products where prod_id != 0 and catg_level_1 = 95498 order by DBMS_RANDOM.RANDOM) p where rownum < 9 "
				+ "union all "
				+ "select * from "
				+ "(select * from products where prod_id != 0 and catg_level_1 = 95499 order by DBMS_RANDOM.RANDOM) p where rownum < 9)) "
				+ "union all "
				+ "select * from "
				+ "(select * from "
				+ "(select * from products where prod_id != 0 and catg_level_1 = 95500 order by DBMS_RANDOM.RANDOM) p where rownum < 9 "
				+ "union all "
				+ "select * from "
				+ "(select * from products where prod_id != 0 and catg_level_1 = 95501 order by DBMS_RANDOM.RANDOM) p where rownum < 9)";
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql1);
			while(rs.next()) {
				Product product = new Product();
				product.setProdId(rs.getInt("prod_id"));
				product.setProdName(rs.getString("prod_name"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setCatgLevel1(rs.getInt("catg_level_1"));
				product.setCatgLevel2(rs.getInt("catg_level_2"));
				product.setCatgLevel3(rs.getInt("catg_level_3"));
				product.setContent(rs.getString("content"));
				product.setImgUrl(rs.getString("img_url"));
				product.setIsShare(rs.getInt("is_share"));
				product.setWeight(rs.getInt("weight"));
				product.setOrigin(rs.getString("origin"));
				product.setSharePeople(rs.getInt("share_people"));
				product.setParticipatePeople(rs.getInt("participate_people"));
				list.add(product);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	}
	
	
	// 상품 랭킹 리스트
	public List<Product> selectProdRank() {
		List<Product> list = new ArrayList<>();
		String sql = "select * from products p,  "
				+ "(select prod_id, sum(buy_amount) amount from buy_process where is_completed=1 group by prod_id) b "
				+ "where p.prod_id = b.prod_id "
				+ "order by amount desc";
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product();
				product.setProdId(rs.getInt("prod_id"));
				product.setProdName(rs.getString("prod_name"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setCatgLevel1(rs.getInt("catg_level_1"));
				product.setCatgLevel2(rs.getInt("catg_level_2"));
				product.setCatgLevel3(rs.getInt("catg_level_3"));
				product.setContent(rs.getString("content"));
				product.setImgUrl(rs.getString("img_url"));
				product.setIsShare(rs.getInt("is_share"));
				product.setWeight(rs.getInt("weight"));
				product.setOrigin(rs.getString("origin"));
				product.setSharePeople(rs.getInt("share_people"));
				product.setParticipatePeople(rs.getInt("participate_people"));
				list.add(product);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	}

	// 신상품
	public List<Product> selectNewProd() {
		List<Product> list = new ArrayList<>();
		String sql = "select distinct * from products p,  "
				+ "(select d.prod_id, i.invt_date from  "
				+ "(select distinct prod_id from inventory) d, "
				+ "(select * from inventory where in_out = 0 and prod_id != 0 order by invt_date desc) i "
				+ "where d.prod_id = i.prod_id "
				+ "order by invt_date desc) n "
				+ "where p.prod_id = n.prod_id "
				+ "and rownum < 100 "
				+ "order by n.invt_date desc";
		try {
			connect();
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product();
				product.setProdId(rs.getInt("prod_id"));
				product.setProdName(rs.getString("prod_name"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setCatgLevel1(rs.getInt("catg_level_1"));
				product.setCatgLevel2(rs.getInt("catg_level_2"));
				product.setCatgLevel3(rs.getInt("catg_level_3"));
				product.setContent(rs.getString("content"));
				product.setImgUrl(rs.getString("img_url"));
				product.setIsShare(rs.getInt("is_share"));
				product.setWeight(rs.getInt("weight"));
				product.setOrigin(rs.getString("origin"));
				product.setSharePeople(rs.getInt("share_people"));
				product.setParticipatePeople(rs.getInt("participate_people"));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
		
	}
	
	
	// 나의 찜 목록
	public List<Product> getMyJjimList(String userId) {
		List<Product> list = new ArrayList<>();
		String sql = "select * from "
				+ "(select decode(m.prod_id, null, 0, 1) jjim, p.* from products p, "
				+ "(select * from jjim where user_id = '"
				+ userId
				+ "') m where p.prod_id = m.prod_id(+)) "
				+ "where jjim = 1" ;
		
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Product product = new Product();
				product.setProdId(rs.getInt("prod_id"));
				product.setProdName(rs.getString("prod_name"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setCatgLevel1(rs.getInt("catg_level_1"));
				product.setCatgLevel2(rs.getInt("catg_level_2"));
				product.setCatgLevel3(rs.getInt("catg_level_3"));
				product.setContent(rs.getString("content"));
				product.setImgUrl(rs.getString("img_url"));
				product.setIsShare(rs.getInt("is_share"));
				product.setWeight(rs.getInt("weight"));
				product.setOrigin(rs.getString("origin"));
				product.setSharePeople(rs.getInt("share_people"));
				product.setParticipatePeople(rs.getInt("participate_people"));
				list.add(product);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public List<Product> jjimListPaging(Criteria cri, String userId){
		List<Product> list = new ArrayList<>();
		
		String sql = "select  jjim, prod_id, img_url, prod_name, prod_price, weight, content, origin, is_share, share_people, catg_level_3, participate_people, catg_level_1, catg_level_2, user_id "
				+ "		from(select rownum rn, jjim, prod_id, img_url, prod_name, prod_price, weight, content, origin, is_share, share_people, catg_level_3, participate_people, catg_level_1, catg_level_2, user_id "
				+ "  		from(select  jjim, prod_id, img_url, prod_name, prod_price, weight, content, origin, is_share, share_people, catg_level_3, participate_people, catg_level_1, catg_level_2, user_id "
				+ "    			from v_my_jjim where jjim = 1 and user_id=?) "
				+ "      			where rownum <=?) where rn>=?";
		
		try {
			connect();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, cri.getAmount() * cri.getPageNum()); // 10 * 1;
			pstmt.setInt(3, cri.getAmount() * (cri.getPageNum() - 1)); // 10
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setProdId(rs.getInt("prod_id"));
				product.setProdName(rs.getString("prod_name"));
				product.setProdPrice(rs.getInt("prod_price"));
				product.setCatgLevel1(rs.getInt("catg_level_1"));
				product.setCatgLevel2(rs.getInt("catg_level_2"));
				product.setCatgLevel3(rs.getInt("catg_level_3"));
				product.setContent(rs.getString("content"));
				product.setImgUrl(rs.getString("img_url"));
				product.setIsShare(rs.getInt("is_share"));
				product.setWeight(rs.getInt("weight"));
				product.setOrigin(rs.getString("origin"));
				product.setSharePeople(rs.getInt("share_people"));
				product.setParticipatePeople(rs.getInt("participate_people"));
				list.add(product);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

 	// 현재 prodId와 isShare여부로 현재 상품의 공동구매 인원 수 조회해오기
	public int ParticipatePeopleNum(int prodId) {
		int participate = 0;
		try {
			connect();
			String sql = "select participate_people from products where prod_id = ? and is_share = 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				participate = rs.getInt("participate_people");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return participate;
	}
	
	
	// 공동구매 인원 수 업로드(누적, 빼기는 controller에서 처리하자)
	public void updateParticipatePeople(int participate, int prodId) {
		try {
			connect();
			String sql = "update products set participate_people = ? where prod_id = ? and is_share = 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, participate);
			pstmt.setInt(2, prodId);
			
			int r = pstmt.executeUpdate();
			if(r>0) { 
				System.out.println("공동구매인원 수정 완료");
			} else {
				System.out.println("공동구매인원 수정 실패");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
}

