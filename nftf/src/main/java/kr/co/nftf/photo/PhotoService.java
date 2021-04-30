package kr.co.nftf.photo;

import java.util.List;

public interface PhotoService {
	public void photoRegist (List<Photo> photos);
	
	public List<Photo> photoSelect (Photo photo);
	
	public void photoEdit (Photo photo);
	
	public void photoDelete (Photo photo);
}
