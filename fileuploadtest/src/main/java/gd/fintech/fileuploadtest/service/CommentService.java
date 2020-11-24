package gd.fintech.fileuploadtest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.fileuploadtest.mapper.CommentMapper;
import gd.fintech.fileuploadtest.vo.Comment;

@Service
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	public int addComment(Comment comment) {
		return commentMapper.insertComment(comment);
	}
	public int removeComment(int commentId) {
		return commentMapper.deleteComment(commentId);
	}
}
