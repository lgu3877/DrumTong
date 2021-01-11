package com.drumtong.system.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.system.vo.SBoardVO;

public interface SCustomerBoard1DAO {
	
	//	최근 공지사항 데이터 5개를 Main으로 보내준다.
	List<SBoardVO> selectRecentData1(int NumberOfData);

	// 게시판 전체 글 수[영경]
	int selectAllPage();
	
	// 인덱스 A 부터 B 까지의 게시글을 들고 옴[영경]
	List<SBoardVO> selectPageSection(HashMap<String, Integer> map);

	// 게시판 글 하나를 보여준다.
	SBoardVO read(int num);

	int write(SBoardVO sboardvo);

}
