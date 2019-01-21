package com.bit.newdeal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bit.newdeal.dto.Suggest;

public interface suggestDao {
  public List<Suggest> selectOneSuggest(String id);
  public List<Suggest> selectAllSuggest();
  public int insertSuggest(Suggest suggest);
  public int updateSuggest(Map<String, Object> params);
  public List<HashMap> selectMySuggest(String id);
}
