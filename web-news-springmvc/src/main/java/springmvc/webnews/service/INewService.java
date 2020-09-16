package springmvc.webnews.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import springmvc.webnews.dto.NewDTO;

public interface INewService {
	
	List<NewDTO> findAll(Pageable pageble);
	int getTotalItem();
	NewDTO findById(long id);
	NewDTO insert(NewDTO dto);
	NewDTO update(NewDTO updateNew);
	void delete(long[] ids);
	List<NewDTO> findAll();
}
