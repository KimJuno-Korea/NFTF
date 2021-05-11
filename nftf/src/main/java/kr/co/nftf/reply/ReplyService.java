package kr.co.nftf.reply;

import java.util.List;

public interface ReplyService {
	public void replyRegist (Reply reply) throws Exception;
	
	public Reply replySelect (Reply reply) throws Exception;
	
	public List<Reply> replyList (Reply reply) throws Exception;
	
	public void replyEdit (Reply reply) throws Exception;
	
	public void replyDelete (Reply reply) throws Exception;
}
