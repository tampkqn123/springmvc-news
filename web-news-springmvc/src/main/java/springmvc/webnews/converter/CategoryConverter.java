package springmvc.webnews.converter;

import org.springframework.stereotype.Component;

import springmvc.webnews.dto.CategoryDTO;
import springmvc.webnews.entity.CategoryEntity;

@Component
public class CategoryConverter {
	public CategoryDTO toDto(CategoryEntity entity) {
		CategoryDTO result = new CategoryDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setCode(entity.getCode());
		return result;
	}
	
	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity result = new CategoryEntity();
		result.setName(dto.getName());
		result.setCode(dto.getCode());
		return result;
	}
	
	public CategoryEntity toEntity(CategoryEntity result ,CategoryDTO dto) {
		result.setName(dto.getName());
		result.setCode(dto.getCode());
		return result;
	}
}
