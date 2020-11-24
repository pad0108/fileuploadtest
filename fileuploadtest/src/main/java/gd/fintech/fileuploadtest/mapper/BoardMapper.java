package gd.fintech.fileuploadtest.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.fileuploadtest.vo.Board;
@Mapper
public interface BoardMapper {
	//추가
	int insertBoard(Board board);
	//보드 리스트 출력
	List<Board> selectBoardListByPage(Map<String, Integer> map);
	//전체 페이지 수
	int selectBoardcount();
	//삭제
	int deleteBoard(int boardId);
	//상세보기
	Board selectBoardOne(int boardId);
	//수정
	int updateBoard(Board board);
	
}
