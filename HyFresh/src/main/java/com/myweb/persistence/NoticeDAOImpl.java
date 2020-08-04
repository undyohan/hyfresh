package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.Criterion;
import com.myweb.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	private static Logger logger = LoggerFactory.getLogger(NoticeDAOImpl.class);
	private static String ns="NoticeMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertNotice(NoticeVO nvo) {
		return sql.insert(ns+"write", nvo);
	}

	@Override
	public List<NoticeVO> selectList(Criterion cri) {
		return sql.selectList(ns+"list", cri);
	}

	@Override
	public NoticeVO selectNotice(int nno) {
		return sql.selectOne(ns+"detail", nno);
	}

	@Override
	public int updateNotice(NoticeVO nvo) {
		return sql.update(ns+"modify", nvo);
	}

	@Override
	public int deleteNotice(int nno) {
		return sql.delete(ns+"remove", nno);
	}

	@Override
	public int selectTotalCount(Criterion cri) {
		return sql.selectOne(ns+"totalCount", cri);
	}

	@Override
	public int updateReadCount(int nno) {
		return sql.update(ns+"upRd", nno);
	}
	
}
