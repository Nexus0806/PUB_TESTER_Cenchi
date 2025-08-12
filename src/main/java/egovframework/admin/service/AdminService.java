package egovframework.admin.service;

import java.util.List;

public interface AdminService {
	List<InfUserVO> getInfUserList();
	int countInfUserList();
}
