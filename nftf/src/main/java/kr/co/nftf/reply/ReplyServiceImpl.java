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
	public int replyRegist(Reply reply) throws Exception{
		return replyMapper.insert(reply);
	}

	@Override
	public Reply replySelect(Reply reply) throws Exception{
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
	public int replyEdit(Reply reply) throws Exception{
		return replyMapper.update(reply);
	}

	@Override
	public int replyDelete(Reply reply) throws Exception{
		return replyMapper.delete(reply);
	}
}
