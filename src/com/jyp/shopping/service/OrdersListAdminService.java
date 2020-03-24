package com.jyp.shopping.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jyp.shopping.dao.OrdersDao;
import com.jyp.shopping.dto.OrdersDto;

public class OrdersListAdminService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// pageNum 받기, startRow endRow 계산하기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = (startRow+PAGESIZE)-1;
		
		// 주문리스트 전체 가져오기
		OrdersDao dao = OrdersDao.getInstance();
		ArrayList<OrdersDto> dtos = dao.OrdersListAdmin(startRow, endRow);
		request.setAttribute("ordersList", dtos);
		// 페이징
		int totCnt = dao.ordersTotCntAdmin();
		int pageCnt = (int) Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = (startPage+BLOCKSIZE)-1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("pageNum", currentPage);

	}

}
