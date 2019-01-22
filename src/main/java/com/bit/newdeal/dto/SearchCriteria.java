package com.bit.newdeal.dto;

public class SearchCriteria extends Criteria{
	
	private String categorycode;
	private String keyword;
	
	public String getCategorycode() {
		return categorycode;
	}
	public void setCategorycode(String categorycode) {
		this.categorycode = categorycode;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [categorycode=" + categorycode + ", keyword=" + keyword + "]";
	}
	
}
