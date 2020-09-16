package springmvc.webnews.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvc.webnews.entity.RoleEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Long>{
	RoleEntity findOneByCode(String Code);
}
