package com.iot1.sql.user.dao.sql;

import java.util.List;
import java.util.Map;

import com.iot1.sql.user.dto.UserInfo;

public interface UserDao {
	UserInfo selectUser(UserInfo user);

	public List<UserInfo> selectUserList(UserInfo user);

	public int insertUser(UserInfo user);

	public int deleteUser(UserInfo user);

	public int updateUser(UserInfo user);

}
