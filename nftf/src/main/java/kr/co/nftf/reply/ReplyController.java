package kr.co.nftf.reply;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReplyController {
	@Autowired
	private ReplyService replyServiceImpl;
	
	@GetMapping("/reply")
	public List<Reply> replyList(Reply reply) {
		List<Reply> replyList = new ArrayList<>();
		
		try {
			replyList = replyServiceImpl.replyList(reply);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return replyList;
	}
	
	//등록
	@PostMapping("/reply")
	public int registReply(Reply reply) {
		int registStatus = 0;
		
		reply.setRegistrateDate(LocalDate.now());
		reply.setEditStatus('N');
		
		try {
			registStatus = replyServiceImpl.replyRegist(reply);
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return registStatus;
	}
	
	@PutMapping("/reply")
	public int editReply(Reply reply) {
		int editResult = 0;
		reply.setEditStatus('Y');
		
		try {
			editResult = replyServiceImpl.replyEdit(reply);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return editResult;
	}
	
	@DeleteMapping("/reply")
	public int deleteReply(Reply reply) {
		int deleteResult = 0;
		
		try {
			deleteResult = replyServiceImpl.replyDelete(reply);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return deleteResult;
	}
}
