package kr.co.nftf.user;

public interface UserService {
	public boolean registUser(User user) throws Exception;
	
	public User selectUser(User user) throws Exception;
	
	public boolean editUser(User user) throws Exception;

	String sendKey(String Phone) throws Exception;
}
