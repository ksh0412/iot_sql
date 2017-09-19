package com.iot1.sql.user.dao.sql;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.iot1.sql.user.dto.UserInfo;
@Service
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {

	@Override
	public UserInfo selectUser(UserInfo user) {
		return this.getSqlSession().selectOne("user.SELECT_USER", user);
	}

	@Override
	public List<UserInfo> selectUserList(UserInfo user) {
		return this.getSqlSession().selectList("user.SELECT_USER_LIST", user);
	}

	@Override
	public int insertUser(UserInfo user) {
		return this.getSqlSession().selectOne("user.INSERT_USER", user);
	}

	@Override
	public int deleteUser(UserInfo user) {
		return this.getSqlSession().selectOne("user.DELETE_USER", user);
	}

	@Override
	public int updateUser(UserInfo user) {
		return this.getSqlSession().selectOne("user.UPDATE_USER", user);
	}
}
