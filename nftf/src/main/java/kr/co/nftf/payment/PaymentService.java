package kr.co.nftf.payment;

import kr.co.nftf.user.User;

public interface PaymentService {
	public boolean pay (User user);
	
	public boolean canclePay (User user);
}
