package com.diego.mid.productTest;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.diego.mid.TestAbstractCase;
import com.diego.mid.dao.ProductDAO;
import com.diego.mid.model.product.ProductVO;

public class ProductDAOTest extends TestAbstractCase{

	@Inject
	private ProductDAO productDAO;

	//insert
	@Test
	public void productInsertTest()throws Exception {


		for(int i=0;i<10;i++) {
			ProductVO productVO = new ProductVO();
			productVO.setCat_ref(302);
			productVO.setPro_name("셔츠");
			productVO.setPro_price(500+i);
			productVO.setPro_sale(i);
			productVO.setPro_count(50+i);
			//productVO.setPro_contents("test"+i);
			productVO.setPro_warning("드라이세탁만가능");
			productVO.setPro_color("bk");
			productVO.setPro_size("s");
			productVO.setPro_vital("dfasf");

			int result = productDAO.productInsert(productVO);
		}


		//assertEquals(1, result);

	}//성공


	//delete
	//@Test
	public void productDeleteTest()throws Exception {
		ProductVO productVO = new ProductVO();		
		productVO.setPro_num(154);

		int result = productDAO.productDelete(productVO);

		assertEquals(1, result);
	}//성공
	
	
	//selectOne
	//@Test
	public void productSelectTest()throws Exception {
		ProductVO productVO = new ProductVO();
		
		productVO.setPro_num(116);
		
		productVO= productDAO.productSelect(productVO);
		
		assertNotNull(productVO);
		
	}// 성공
	
	//@Test
	public void productUpdateTest()throws Exception {
		ProductVO productVO = new ProductVO();
		
		productVO.setPro_num(137);
		productVO.setCat_ref(301);
		productVO.setPro_name("TEST");
		productVO.setPro_price(500);
		productVO.setPro_sale(0);
		productVO.setPro_count(50);
		//productVO.setPro_contents("test");
		productVO.setPro_warning("드라이세탁만가능");
		productVO.setPro_color("bk");
		productVO.setPro_size("s");
		productVO.setPro_vital("dfasf");
		
		int result = productDAO.productUpdate(productVO);
		
		assertEquals(1, result);
	}//성공
	
}





