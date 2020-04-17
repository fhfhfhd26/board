package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.service.BoardService;
import com.board.dto.BoardDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	@Qualifier("bs")
	
	private BoardService service;
	private final String module = "/board";

	@GetMapping("/list.do")
	public String list(Model model) {
		model.addAttribute("list", service.list());
		return module + "/list";
	}
	
	@GetMapping("/view.do")
	public String view(Model model, int no) {
		model.addAttribute("dto", service.view(no));
		return module + "/view";
	}
	
	@GetMapping("/write.do")
	public String writeForm() {
		return module + "/write";
	}
		
	@PostMapping("/write.do")
	public String write(BoardDTO dto) {
		service.write(dto);
		return "redirect:list.do";
	}
	
	@PostMapping("/delete.do")
	public String delete(BoardDTO dto) {
		service.delete(dto);
		return "redirect:list.do";
	}
	
	@GetMapping("/update.do")
	public String updateForm(Model model, int no) {
		model.addAttribute("dto", service.view(no));
		return module + "/update";
	}
	
	@PostMapping("/update.do")
	public String update(BoardDTO dto) {
		int result = service.update(dto);
		if(result > 0)
			// 자동으로 글보기로 이동한다.
			return "redirect:view.do?no=" + dto.getNo();
		else
			// 오류보여주는 jsp 페이지로 이동 -> 수정이 정상적으로 안된 경우 : 비밀번호가 틀림
			return "error/error_pw";
	}
}
