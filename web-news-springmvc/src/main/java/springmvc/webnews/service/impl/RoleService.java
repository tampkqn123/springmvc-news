package springmvc.webnews.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.webnews.entity.RoleEntity;
import springmvc.webnews.repository.RoleRepository;
import springmvc.webnews.service.IRoleService;

@Service
public class RoleService implements IRoleService{
	
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<RoleEntity> entities = roleRepository.findAll();
		for(RoleEntity item : entities) {
			result.put(item.getCode(), item.getName());
		}
		return result;
	}

}
