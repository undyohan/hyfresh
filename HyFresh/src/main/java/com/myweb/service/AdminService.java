package com.myweb.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.ProductVO;

public interface AdminService {
	public int pregister(ProductVO pvo);
	public int pmodify(ProductVO pvo);
	public int premove(int pno);
}
