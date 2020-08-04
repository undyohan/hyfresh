package com.myweb.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.Criterion;
import com.myweb.domain.NoticeVO;

public interface NoticeDAO {
	public int insertNotice(NoticeVO nvo);
	public List<NoticeVO> selectList(Criterion cri);
	public NoticeVO selectNotice(int nno);
	public int updateNotice(NoticeVO nvo);
	public int deleteNotice(int nno);
	public int selectTotalCount(Criterion cri);
	public int updateReadCount(int nno);
}
