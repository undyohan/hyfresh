package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.domain.Criterion;
import com.myweb.domain.NoticeVO;
import com.myweb.persistence.NoticeDAO;

@Service 
public class NoticeServiceImpl implements NoticeService{
	private static Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);

	@Inject
	NoticeDAO ndao;

	@Override
	public int regist(NoticeVO nvo) {
		return ndao.insertNotice(nvo);
	}

	@Override
	public List<NoticeVO> getList(Criterion cri) {
		return ndao.selectList(cri);
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public NoticeVO getNotice(int nno) {
		ndao.updateReadCount(nno);
		return ndao.selectNotice(nno);
	}

	@Override
	public int modify(NoticeVO nvo) {
		return ndao.updateNotice(nvo);
	}

	@Override
	public int remove(int nno) {
		return ndao.deleteNotice(nno);
	}

	@Override
	public int getTotalCount(Criterion cri) {
		return ndao.selectTotalCount(cri);
	}
}
