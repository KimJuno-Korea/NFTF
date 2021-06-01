package kr.co.nftf.payment;

import java.io.IOException;

import kr.co.nftf.board.Board;
import kr.co.nftf.user.User;

public interface PaymentService {
	public boolean pay (User user, Board board)  throws IOException;
}
