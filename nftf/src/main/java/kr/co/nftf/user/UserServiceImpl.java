package kr.co.nftf.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {
//	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserMapper userMapper;
	//====================완료====================//
	@Override
	public boolean registUser(User user) {
		try {
			
			if (user != null) {
				
				if (user.getId() != null) {
//					logger.debug("\t[registUser]\t user 테이블에" + userMapper.insert(user) + "개의 행이 INSERT 됨");
					return true;
				} else {
//					logger.debug("\t[registUser]\t user의 id가 NULL 입니다.");
					return false;
				}
			} else {
//				logger.error("\\t[registUser]\\t Bean 클래스인 User가 NULL 입니다.");
				return false;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	@Override
	public User selectUser(User user) {
		try {
			if (user != null) {
				
				if (user.getId() != null) {
					user = userMapper.select(user);
					return user;
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean editUser(User user) {
		try {
			if (user != null) {
				
				if (user.getId() != null) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

}
