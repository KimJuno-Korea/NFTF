package kr.co.nftf.security;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import kr.co.nftf.tradingbox.TradingBox;
import kr.co.nftf.tradingbox.TradingBoxMapper;

@Service
public class SecurityServiceImpl implements SecurityService{
	@Autowired
	TradingBoxMapper tradingBoxMapper;
	//인증키 대조 (물품 수령시 필요한 인증키를 대조함)
	@Override
	public boolean contrastKey(String key) throws Exception {
		
		if (key != null) {
			TradingBox tradingBox = new TradingBox();
			tradingBox.setAuthKey(key);
			
			if (tradingBoxMapper.select(tradingBox) != null) {
				return true;
			}
		}
		return false;
	}

	//인증키 QR 생성 (구매누르고 결제 완료시 실행)
	@Override
	public byte[] createKeyQR(TradingBox tradingBox)	
			throws Exception  {
		StringBuilder key = new StringBuilder();
		for (int i = 0 ; i < 10 ; i++) {
			key.append(((int)(Math.random()*10))+"");
		}
		
		if (tradingBox != null) {
			tradingBox = tradingBoxMapper.select(tradingBox);
			
			tradingBox.setAuthKeyDate(LocalDateTime.now());
			tradingBox.setAuthKey(key.toString());
			tradingBoxMapper.update(tradingBox);
			
			byte[] file = getQR(key.toString());
			return file;
		}
		return null;
	}
	
	private byte[] getQR(String key) throws WriterException, IOException {
		BitMatrix bitMatrix = new QRCodeWriter().encode(key, BarcodeFormat.QR_CODE, 350, 350); // 텍스트, 바코드 포맷,가로,세로
		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix, new MatrixToImageConfig(0x00000000, 0xFFFFFFFF));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		ImageIO.write(qrImage, "png", baos);
		return baos.toByteArray();
	}

	//로그인 QR 생성
	@Override
	public byte[] createAccountQR(String loginInfo)	
				throws WriterException, IOException {
		BitMatrix bitMatrix = new QRCodeWriter().encode(loginInfo, BarcodeFormat.QR_CODE, 350, 350); // 텍스트, 바코드 포맷,가로,세로
		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix, new MatrixToImageConfig(0x00000000, 0xFFFFFFFF));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(qrImage, "png", baos);
		
		byte[] file = baos.toByteArray();
		return file;
	}
}
