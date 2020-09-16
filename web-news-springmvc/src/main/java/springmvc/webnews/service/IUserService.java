package springmvc.webnews.service;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;

import springmvc.webnews.dto.UserDTO;

public interface IUserService {
	
	List<UserDTO> findAll(Pageable pageable);
	int getTotalItem();
	UserDTO findById(long id);
	PasswordEncoder passwordEncoder();
	UserDTO insert(UserDTO userDTO);
	UserDTO update(UserDTO updateUser);
	void delete(long[] ids);
}
