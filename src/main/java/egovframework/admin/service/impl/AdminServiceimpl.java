package egovframework.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admin.service.AdminService;
import egovframework.admin.service.InfUserVO;

@Service("adminService")
public class AdminServiceimpl implements AdminService {

	@Resource(name = "adminDAO")
	private AdminDAO adminDAO;
	
	public List<InfUserVO> getInfUserList(){
		return adminDAO.getInfUserList();
	}
	
	public int countInfUserList() {
		return adminDAO.countInfUserList();
	}
}
