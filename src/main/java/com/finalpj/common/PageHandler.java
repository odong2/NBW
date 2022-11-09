package com.finalpj.common;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageHandler {
	private int totalCnt; // 총 게시물 개수
	private int pageSize = 5; // 한페이지의 크기
	private int naviSize = 5; // 페이지 내비게이션의 크기
	private int totalPage; // 전체 페이지 개수
	private int page; // 현재페이지
	private int beginPage; // 내비게이션의 첫번째 페이지
	private int endPage; // 내비게이션의 첫번째 페이지
	private boolean showPrev; // 이전 페이지 이동 링크 여부
	private boolean showNext; // 다음 페이지 이동 링크 여부

	public PageHandler(int totalCnt, int page) {
		this.totalCnt = totalCnt;
		this.page = page;

		totalPage = (int) Math.ceil(totalCnt / (float) pageSize); // 나머지 값 있을 경우 페이지 하나 추가
		beginPage = (page - 1) / naviSize * naviSize + 1;
		endPage = Math.min(beginPage + naviSize - 1, totalPage);
		showPrev = beginPage != 1;
		showNext = endPage != totalPage;
	}

	public int getOffset() {
		return (page - 1) * pageSize;
	}

	public int getOffsetTo() {
		return page == 1 ? pageSize : page * pageSize;
	}

	public Map<String, Object> getPageHandler() {
		Map<String, Object> map = new HashMap<>();
		map.put("totalCnt", this.totalCnt);
		map.put("pageSize", this.pageSize);
		map.put("naviSize", this.naviSize);
		map.put("totalPage", this.totalPage);
		map.put("page", this.page);
		map.put("beginPage", this.beginPage);
		map.put("endPage", this.endPage);
		map.put("showPrev", this.showPrev);
		map.put("showNext", this.showNext);
		return map;
	}

	public void print() {
		System.out.println("현재 페이지는 = " + page + "page");
		System.out.print(showPrev ? "[PREV]" : "");
		for (int i = beginPage; i <= endPage; i++) {
			System.out.print(i + " ");
		}
		System.out.println(showNext ? "[Next]" : "");
	}

}
