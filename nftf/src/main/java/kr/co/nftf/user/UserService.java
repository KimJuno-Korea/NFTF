package kr.co.nftf.user;

import java.io.IOException;

import com.google.zxing.WriterException;

public interface UserService {
	public boolean registUser(User user) throws Exception;
	
	public User selectUser(User user) throws Exception;
	
	public boolean editUser(User user) throws Exception;

	byte[] createLoginQR(String url) throws WriterException, IOException;

	String sendKey(String Phone) throws Exception;
}
