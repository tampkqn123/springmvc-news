package springmvc.webnews.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvc.webnews.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long>{
	UserEntity findOneByUserNameAndStatus(String name, int status);
	UserEntity findOneByUserName(String userName);
}
