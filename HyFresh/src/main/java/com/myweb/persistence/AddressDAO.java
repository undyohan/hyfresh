package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.AddressVO;
import com.myweb.domain.MemberVO;

public interface AddressDAO {
	public int insertAddr(AddressVO avo);
	public int insertFirstAddr(MemberVO mvo);
	public List<AddressVO> selectList(int mno);
	public int updateAddr(AddressVO avo);
	public int deleteAddr(AddressVO avo);
	public int selectOne(AddressVO avo);
}
