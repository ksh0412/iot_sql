package com.iot1.sql.vendor.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.iot1.sql.vendor.dto.VendorInfo;

@Repository
public class VendorDaoImpl extends SqlSessionDaoSupport implements VendorDao {

	@Override
	public VendorInfo selectVendor(VendorInfo vendor) {
		return this.getSqlSession().selectOne("vendor1.SELECT_VENDOR", vendor);
	}

	@Override
	public List<VendorInfo> selectVendorList(VendorInfo vendor) {
		return this.getSqlSession().selectList("vendor1.SELECT_VENDORLIST", vendor);
	}

	@Override
	public List<VendorInfo> selectVendorInfoCombo() {
		return this.getSqlSession().selectList("vendor1.SELECT_VENDOR_COMBO");
	}

	@Override
	public int insertVendorList(VendorInfo vendor) {
		return this.getSqlSession().insert("vendor1.INSERT_VENDOR", vendor);
	}

	@Override
	public int deleteVendor(VendorInfo vendor) {
		return this.getSqlSession().delete("vendor1.DELETE_VENDOR", vendor);
	}

	@Override
	public int updateVendor(VendorInfo vendor) {
		return this.getSqlSession().update("vendor1.UPDATE_VENDOR", vendor);
	}

}
