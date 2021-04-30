package kr.co.nftf.user;

public interface UserService {
	public boolean registUser(User user);
	
	public boolean selectUser(User user);
	
	public boolean editUser(User user);
}
