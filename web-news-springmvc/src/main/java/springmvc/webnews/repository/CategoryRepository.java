package springmvc.webnews.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvc.webnews.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long>{
	CategoryEntity findOneByCode(String Code);
	CategoryEntity findOneByName(String name);
}
