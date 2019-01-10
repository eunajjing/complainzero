package com.bit.newdeal.dao;

import java.util.List;
import com.bit.newdeal.dto.Suggest;

public interface suggestDao {
  public List<Suggest> selectOneSuggest(String id);
  public List<Suggest> selectAllSuggest();
  public int insertSuggest(Suggest suggest);
  public int updateSuggest(int sno);
}
