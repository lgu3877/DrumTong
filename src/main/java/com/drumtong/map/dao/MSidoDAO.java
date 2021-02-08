package com.drumtong.map.dao;


import java.util.List;

import com.drumtong.map.vo.MSidoVO;


// 시도 DAO
public interface MSidoDAO {

	List<MSidoVO> getsidoxy();
	List<String> selectMSidoAddressA();
}
