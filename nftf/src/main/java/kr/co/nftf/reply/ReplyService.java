package kr.co.nftf.reply;

import java.util.List;

public interface ReplyService {
	public void replyRegist (Reply reply);
	
	public Reply replySelect (Reply reply);
	
	public List<Reply> replyList (Reply reply);
	
	public void replyEdit (Reply reply);
	
	public void replyDelete (Reply reply);
}
