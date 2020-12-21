package com.drumtong.customer.service.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.system.dao.SCustomerBoard1DAO;
import com.drumtong.system.dao.SCustomerBoard2DAO;
import com.drumtong.system.vo.SBoardVO;


@Service
public class CustomerBoardService {
	
	@Autowired SCustomerBoard1DAO sCustomerBoard1DAO;
	@Autowired SCustomerBoard2DAO sCustomerBoard2DAO;
	
	// 공지사항1 이동 [GET]
	public ModelAndView board(String page, String type) {
		boolean Type = type.equals("notice");
		ModelAndView mav = new ModelAndView("customer/board/customerBoard");
		// 현재 페이지 값이 없다면 무조건 1블럭 1페이지(받아오는 값)
		int NowPage = page == null ? 1 : Integer.parseInt(page);
		
		int IndexPaging = 4;
		int BoxPaging = 3;
		// 1. 전체 게시글 개수를 구한다.
		int WholePage = Type ?
				sCustomerBoard1DAO.selectAllPage()
				: sCustomerBoard2DAO.selectAllPage();
		
		// 2. 현재 페이지에 보여줄 게시글 Index 시작과 끝을 구한다
		int IndexBegin = (NowPage-1) * IndexPaging + 1 ;
		int IndexEnd = IndexBegin + IndexPaging - 1;
		// 1~4
		// 5~8
		// 9~12
		
		// 3. 인덱스 번호에 맞는 게시글을 불러온다
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("IndexBegin", IndexBegin);
		map.put("IndexEnd", IndexEnd);
		List<SBoardVO> List = Type ? 
						sCustomerBoard1DAO.selectPageSection(map)
						: sCustomerBoard2DAO.selectPageSection(map);

		// 4. 전체 페이징 개수를 구한다.
		int MaxPaging = WholePage / IndexPaging + (WholePage % IndexPaging == 0 ? 0 : 1);
		
		// 5. 페이지 번호를 페이징 한다.
		int BoxSectionNum = ((NowPage / BoxPaging) - (NowPage % BoxPaging == 0 ? 1 : 0));
		int BoxBegin = BoxSectionNum * BoxPaging + 1;
		int BoxEnd = BoxBegin + BoxPaging - 1;
		BoxEnd = MaxPaging < BoxEnd ? MaxPaging : BoxEnd;
		// 1~3
		// 4~6
		// 6~8
		
		// 6. 페이지 시작 번호가 1부터 시작하면 prev를 숨겨야 하니 false
		boolean prev = BoxBegin != 1;
		
		// 7. 페이지 끝 번호가 마지막 번호면 next를 숨겨야하니 false
		boolean next = BoxEnd != MaxPaging;
		
		mav.addObject("List", List);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		mav.addObject("page", NowPage);
		mav.addObject("begin", BoxBegin);
		mav.addObject("end", BoxEnd); 
		
		mav.addObject("type", type);
		
		return mav;
	}
	
	public ModelAndView read(String type, int num) {
		ModelAndView mav = new ModelAndView("customer/board/customerBoardRead");
		boolean Type = type.equals("notice");
		
		SBoardVO board = Type ?
					sCustomerBoard1DAO.read(num) :
					sCustomerBoard2DAO.read(num);
					
		mav.addObject("board", board);

		mav.addObject("type", type);
		return mav;
	}
	


}
