package kr.co.nftf.reply;

import java.util.List;

public interface ReplyService {
	public int replyRegist (Reply reply) throws Exception;
	
	public Reply replySelect (Reply reply) throws Exception;
	
	public List<Reply> replyList (Reply reply) throws Exception;
	
	public int replyEdit (Reply reply) throws Exception;
	
	public int replyDelete (Reply reply) throws Exception;
}
