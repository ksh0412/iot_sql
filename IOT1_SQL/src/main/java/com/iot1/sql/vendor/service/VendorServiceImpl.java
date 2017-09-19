package com.iot1.sql.vendor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.vendor.dao.VendorDao;
import com.iot1.sql.vendor.dto.VendorInfo;

@Service
public class VendorServiceImpl implements VendorService{

	@Autowired
	VendorDao vDao;
	
	@Override
	public VendorInfo getVendorInfo(VendorInfo vendor) {
		return vDao.selectVendor(vendor);
	}

	@Override
	public List<VendorInfo> getVendorInfoList(VendorInfo vendor) {
		return vDao.selectVendorList(vendor);
	}

	@Override
	public List<VendorInfo> getVendorInfoCombo() {
		return vDao.selectVendorInfoCombo();
	}

	@Override
	public int insertVendorList(VendorInfo[] viList) {
		int result=0;
		for(VendorInfo vi : viList){
			result += vDao.insertVendorList(vi);
		}
		return result;
	}

	@Override
	public int deleteVendor(VendorInfo vendor) {
		return vDao.deleteVendor(vendor);
	}

	@Override
	public int updateVendor(VendorInfo vendor) {
		return vDao.updateVendor(vendor);
	}	
	
	

}
