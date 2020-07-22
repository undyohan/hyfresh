package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.AddrVO;
import com.myweb.domain.MemberVO;
import com.myweb.persistence.AddrDAO;

@Service
public class AddrServiceImpl implements AddrService {
	private static Logger log = LoggerFactory.getLogger(AddrServiceImpl.class);

	@Inject
	AddrDAO adao;
	
	@Override
	public int add(AddrVO avo) {
		return adao.insertAddr(avo);
	}

	@Override
	public int firstAddr(MemberVO mvo) {
		return adao.insertFirstAddr(mvo);
	}
	
	@Override
	public List<AddrVO> getList(int mno) {
		return adao.selectList(mno);
	}

	@Override
	public int modify(AddrVO avo) {
		return adao.updateAddr(avo);
	}

	@Override
	public int remove(AddrVO avo) {
		return adao.deleteAddr(avo);
	}

	@Override
	public int openmod(AddrVO avo) {
		return adao.selectOne(avo);
	}
}
