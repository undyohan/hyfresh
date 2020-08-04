package com.myweb.service;

import java.util.List;

import com.myweb.domain.AddressVO;
import com.myweb.domain.MemberVO;

public interface AddressService {
	public int add(AddressVO avo);
	public int firstAddr(MemberVO mvo);
	public List<AddressVO> getList(int mno);
	public int modify(AddressVO avo);
	public int remove(AddressVO avo);
	public AddressVO openmod(AddressVO avo);
	public int getFirstAddrno(int mno);
}
