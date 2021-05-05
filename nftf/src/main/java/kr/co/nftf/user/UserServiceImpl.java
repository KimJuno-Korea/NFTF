package kr.co.nftf.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
//	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserMapper userMapper;

	@Override
	public boolean registUser(User user) throws Exception {
		if (user != null) {

			if (user.getId() != null) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public User selectUser(User user) throws Exception {
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
	}

	@Override
	public boolean editUser(User user) throws Exception {
		if (user != null) {

			if (user.getId() != null) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
}
