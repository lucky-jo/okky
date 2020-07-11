package com.ncs.util;

// DTO, VO 에서는 상속을 많이 활용함.  
public class SearchCriteria extends Criteria  {
	private String searchType;
	private String keyword;
	private String category;
	private String sorted;
	private String userid;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSorted() {
		return sorted;
	}

	@Override
	public String toString() {
		return "SearchCriteria{" +
				"searchType='" + searchType + '\'' +
				", keyword='" + keyword + '\'' +
				", category='" + category + '\'' +
				", sorted='" + sorted + '\'' +
				'}';
	}

	public void setSorted(String sorted) {
		this.sorted = sorted;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
} // class
