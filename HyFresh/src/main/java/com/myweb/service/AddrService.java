package com.myweb.service;

import java.util.List;

import com.myweb.domain.AddrVO;
import com.myweb.domain.MemberVO;

public interface AddrService {
	public int add(AddrVO avo);
	public int firstAddr(MemberVO mvo);
	public List<AddrVO> getList(int mno);
	public int modify(AddrVO avo);
	public int remove(AddrVO avo);
	public int openmod(AddrVO avo);
}
