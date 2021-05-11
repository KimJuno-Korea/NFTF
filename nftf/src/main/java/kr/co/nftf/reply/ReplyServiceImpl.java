package kr.co.nftf.reply;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public void replyRegist(Reply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Reply replySelect(Reply reply) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reply> replyList(Reply reply) throws Exception{
		List<Reply> replyList = new ArrayList<>();
		replyList = replyMapper.selectList(reply);
		
		return replyList;
	}

	@Override
	public void replyEdit(Reply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void replyDelete(Reply reply) {
		// TODO Auto-generated method stub
		
	}
}
