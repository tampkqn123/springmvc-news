package springmvc.webnews.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import springmvc.webnews.dto.CategoryDTO;
import springmvc.webnews.service.ICategoryService;

@RestController
public class CategoryAPI {
	
	@Autowired
	private ICategoryService categoryService;
	
	@PostMapping("/api/category")
	public CategoryDTO createCategory(@RequestBody CategoryDTO createCategory) {
		return categoryService.insert(createCategory);
	}
	
	@PutMapping("/api/category")
	public CategoryDTO updateCategory(@RequestBody CategoryDTO updateCategory) {
		return categoryService.update(updateCategory);
	}
	
	@DeleteMapping("/api/category")
	public void deleteCategory(@RequestBody long[] ids) {
		categoryService.delete(ids);
	}
}
