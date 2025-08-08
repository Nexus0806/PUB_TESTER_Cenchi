package egovframework.admin.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admin.service.AdminService;

@Service("adminService")
public class AdminServiceimpl implements AdminService {

	@Resource(name = "adminDAO")
	private AdminDAO adminDAO;
}
