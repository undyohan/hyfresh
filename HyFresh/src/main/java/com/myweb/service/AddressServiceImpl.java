package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.AddressVO;
import com.myweb.domain.MemberVO;
import com.myweb.persistence.AddressDAO;

@Service
public class AddressServiceImpl implements AddressService {
	private static Logger log = LoggerFactory.getLogger(AddressServiceImpl.class);

	@Inject
	AddressDAO adao;
	
	@Override
	public int add(AddressVO avo) {
		return adao.insertAddr(avo);
	}

	@Override
	public int firstAddr(MemberVO mvo) {
		return adao.insertFirstAddr(mvo);
	}
	
	@Override
	public List<AddressVO> getList(int mno) {
		return adao.selectList(mno);
	}

	@Override
	public int modify(AddressVO avo) {
		return adao.updateAddr(avo);
	}

	@Override
	public int remove(AddressVO avo) {
		return adao.deleteAddr(avo);
	}

	@Override
	public AddressVO openmod(AddressVO avo) {
		return adao.selectOne(avo);
	}

	@Override
	public int getFirstAddrno(int mno) {
		return adao.getFirstAddrno(mno);
	}
}
