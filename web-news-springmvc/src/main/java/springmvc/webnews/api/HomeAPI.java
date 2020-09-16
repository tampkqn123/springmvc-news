package springmvc.webnews.api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import springmvc.webnews.entity.NewEntity;

@RestController
public class HomeAPI {
	
	public ResponseEntity<NewEntity> uploadFile(){
		return ResponseEntity.noContent().build();
	}
}
