package com.iot1.sql.vendor.service;

import java.util.List;

import com.iot1.sql.vendor.dto.VendorInfo;

public interface VendorService {
	public VendorInfo getVendorInfo(VendorInfo vendor);

	public List<VendorInfo> getVendorInfoList(VendorInfo vendor);

	public List<VendorInfo>	getVendorInfoCombo();
	
	public int insertVendorList(VendorInfo[] vendor);
	
	public int deleteVendor(VendorInfo vendor);
	
	public int updateVendor(VendorInfo vendor);
}
