package springmvc.webnews.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import springmvc.webnews.dto.CategoryDTO;

public interface ICategoryService {
	Map<String, String> findAll();
	List<CategoryDTO> findAll(Pageable pageable);
	int getTotalItem();
	CategoryDTO findById(long id);
	CategoryDTO insert(CategoryDTO categoryDto);
	CategoryDTO update(CategoryDTO update);
	void delete(long[] ids);
}
