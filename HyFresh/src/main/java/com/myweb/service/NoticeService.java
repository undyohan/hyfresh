package com.myweb.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.Criterion;
import com.myweb.domain.NoticeVO;

public interface NoticeService {
	public int regist(NoticeVO nvo);
	public List<NoticeVO> getList(Criterion cri);
	public NoticeVO getNotice(int nno);
	public int modify(NoticeVO nvo);
	public int remove(int nno);
	public int getTotalCount(Criterion cri);
}
