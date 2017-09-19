package com.iot1.sql.vendor.dao;

import java.util.List;

import com.iot1.sql.vendor.dto.VendorInfo;

public interface VendorDao {
	public VendorInfo selectVendor(VendorInfo vendor);
	
	public List<VendorInfo> selectVendorList(VendorInfo vendor);
	
	public List<VendorInfo> selectVendorInfoCombo();
	
	public int insertVendorList(VendorInfo vendor);
	
	public int deleteVendor(VendorInfo vendor);
	
	public int updateVendor(VendorInfo vendor);

}
