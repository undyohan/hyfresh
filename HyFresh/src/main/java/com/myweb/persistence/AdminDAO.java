package com.myweb.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.ProductVO;

public interface AdminDAO {
	public int insertProduct(ProductVO pvo);
	public int updateProduct(ProductVO pvo);
	public int deleteProduct(int pno);
}
