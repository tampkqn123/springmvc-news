package springmvc.webnews.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvc.webnews.entity.NewEntity;

public interface NewRepository extends JpaRepository<NewEntity, Long>{
		List<NewEntity> findByCategory(Long id);
}
