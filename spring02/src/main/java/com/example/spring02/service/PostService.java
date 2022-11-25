package com.example.spring02.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring02.domain.Post;
import com.example.spring02.dto.PostCreateDto;
import com.example.spring02.dto.PostSearchDto;
import com.example.spring02.dto.PostUpdateDto;
import com.example.spring02.mapper.PostMapper;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // final 필드를 argument로 갖는 생성자를 만듦.
@Service    // @Service + applicationContect.xml : 스프링 컨테이너에 서비스 컴포넌트로 등록 
            //-> 스프링 컨테이너가 필요한 곳(예: 컨트롤로 객체)에 Service 컴포넌트를 주입할 수 있음.
public class PostService {

    // 의존성 주입(dependency inject) :
    // (1) 필드에 의한 의존성 주입 : @AutoWired 사용
    // (2) 생성자에 의한 의존성 주입 : final 필드 + Required-Args 생성자  --- ((이번에는 이걸 사용!))
    
    // @Autowired private PostMapper PostMapper; (1)
    
    
    // 생성자에 의한 의존성 주입
    private final PostMapper postMapper; //(2)        
    
    
    
    public List<Post> read() {
        log.info("read()");
        return postMapper.selectOrderByDesc();
    }
    
    public int create(PostCreateDto dto) { // 포스트 작성하기
        log.info("craete(dto={}", dto);
        return postMapper.insert(dto.toEntity());
    }
    public Post read(Integer id) {
        return postMapper.selectById(id);
    } // id(포스트 번호)가 일치하는 포스트 1개 읽어오기
  
    public int delete(Integer id) {
        log.info("delete(id ={})", id);
        return postMapper.deleteById(id);
    }
    
    public int update(PostUpdateDto dto) {
        log.info("update(dto={})", dto);
        
        return postMapper.updateTitleAndContentById(dto.toEntity());
    }
    
    public List<Post> searchByKeyword(PostSearchDto dto) {
        log.info("searchByKeyword(dto={})", dto);
    
        dto.setKeyword("%" + dto.getKeyword().toLowerCase() + "%");
        
        return postMapper.selectByKerwordOrderByIdDesc(dto);
    }
    
    
    
    // 새 글 작성/ 글 번호 검색/ 수정/ 삭제 서비스
}
