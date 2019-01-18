package com.bit.newdeal.dao;

import java.util.HashMap;
import java.util.List;
import com.bit.newdeal.dto.Member;

public interface memberDao {
  public Member selectOneMember(String id);
  public List<Member> selectAllMember();
  public int insertMember(Member member);
  public int updateMember(Member member);
  public List<Member> searchMember(HashMap<String, Object> params);

  public int nicknameCheck(String nickname);
  public int blacklist(String id);
  public int deleteMember(String id);
  public String pwCheck(String id);


  public int blackList(String id);
  public int nicknameCheck(String nickname);

}
