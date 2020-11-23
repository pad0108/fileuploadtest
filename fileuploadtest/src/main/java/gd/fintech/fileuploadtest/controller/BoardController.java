package gd.fintech.fileuploadtest.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.fileuploadtest.service.BoardService;
import gd.fintech.fileuploadtest.vo.Board;
import gd.fintech.fileuploadtest.vo.BoardForm;
import gd.fintech.fileuploadtest.vo.Boardfile;

@Controller
public class BoardController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardService;
	@GetMapping("/addBoard")
	public String addBoard() {
		return "addBoard";
	}

	@PostMapping("/addBoard")
	public String addBoard(BoardForm boardForm) {
		logger.debug(boardForm.toString());
		//logger.debug("size : " + boardForm.getBoardfile().size());
		boardService.addBoard(boardForm);
		return "redirect:/";
	}
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/boardList/{currentPage}")
	public String boardList(Model model, @PathVariable(value = "") int currentPage) {	
		//한번에 출력할 양
		int rowPerPage = 10;
		
		List<Board> boardList = boardService.getBoardListByPage(currentPage, rowPerPage);
		int totalCount = boardService.getCountBoard(); // 전체 데이터
		int lastPage = totalCount / rowPerPage; //마지막 페이지
		if(totalCount % rowPerPage != 0) { // 10개 미만의 개수의 데이터가 있는 페이지를 표시
			lastPage += 1;
			
		}
		if(lastPage == 0) { // 전체 페이지가 0개이면 현재 페이지를 0으로 표시
			currentPage = 0;
			
		}
		model.addAttribute("boardList",boardList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		logger.debug("boardList size :" + boardList.size());
		return "boardList";
	}
	
	@GetMapping("/removeBoard")
	public String removeBoard(@RequestParam(value = "boardId") int boardId) {
		boardService.removeBoard(boardId);
		return "redirect:/boardList/1";
	}
	
	@GetMapping("/boardOne/{boardId}")
	public String boardOne(Model model, @PathVariable(value="boardId") int boardId) {
		Board board = boardService.getBoardOne(boardId);
		
		model.addAttribute("board", board);
		return "boardOne";
	}
	
	//--------------------------------수정
	@GetMapping("modifyBoard/{boardId}")
	public String modifyBoard(Model model, @PathVariable(value="boardId")int boardId) {
		Board board = boardService.getBoardOne(boardId);
		model.addAttribute("board", board);
		
		return "modifyBoard";
	}
	@GetMapping("removeFile/{boardId}/{boardfileId}/{boardfileName}")
	public String removefile(Model model, @PathVariable(value="boardId")int boardId ,
										@PathVariable(value="boardfileId")int boardfileId ,
										@PathVariable(value="boardfileName")String boardfileName){
		Boardfile boardfile = new Boardfile();
		boardfile.setBoardfileId(boardfileId);
		boardfile.setBoardfileName(boardfileName);
		
		boardService.removeFile(boardfile);
		return "redirect:/modifyBoard/"+boardId;
	}
	@PostMapping("/modifyBoard")
	public String modifyBoard(BoardForm boardForm) {
		boardService.updateBoard(boardForm);
		
		return "redirect:/boardList/1";
	}
}