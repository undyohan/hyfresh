package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.AddrVO;
import com.myweb.domain.MemberVO;

public interface AddrDAO {
	public int insertAddr(AddrVO avo);
	public int insertFirstAddr(MemberVO mvo);
	public List<AddrVO> selectList(int mno);
	public int updateAddr(AddrVO avo);
	public int deleteAddr(AddrVO avo);
	public int selectOne(AddrVO avo);
}
