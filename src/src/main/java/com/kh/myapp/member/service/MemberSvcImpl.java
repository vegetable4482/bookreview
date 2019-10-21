package com.kh.myapp.member.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.myapp.member.dao.MemberDAO;
import com.kh.myapp.member.dto.MemberDTO;
import com.kh.myapp.member.dto.PasswdDTO;

@Service
public class MemberSvcImpl implements MemberSvc {
	
	@Inject
	@Qualifier("memberDAOImplXML") //동일 타입이 있는 경우 id값으로 빈객체를 주입받을 때 사용 
	MemberDAO memberDao;
	
	@Override
	public int insert(MemberDTO memberDTO) {
		
		return memberDao.insert(memberDTO);
	}

	@Override
	public int modify(MemberDTO memberDTO) {

		//첨부파일 존재하면 파일시스템에 업로드
		if(!memberDTO.getFile().isEmpty()) {
			
			//첨부파일 업로드 실패하면  0 반환
			if(!fileUpload(memberDTO)) {
				return 0;
			}
		}
		return memberDao.modify(memberDTO);
	}

	private boolean fileUpload(MemberDTO memberDTO) {
		boolean isUpload =false; //파일 업로드 성공 유무
		
		String randomFn = null; //내부 관리 파일명(난수파일명) 
		String originFn = null; //사용자 upload 파일명
		//첨부파일이 실제 저장되는 위치 지정
		String fileLocation = "D:\\java\\workspace\\springedu\\src\\main\\webapp\\resources\\img\\upload";
		
		randomFn = UUID.randomUUID().toString();		//중복없이 파일명을 생성할때 쓰는 클래스/메소드
		originFn = memberDTO.getFile().getOriginalFilename();
		
		//초기파일명에서 확장자 추출 (. 뒤에있는 확장자를 추출할 수 있음)
		int pos =originFn.lastIndexOf(".");
		String ext = originFn.substring(pos);
		randomFn = randomFn + ext;
		
		//메모리상의 파일을 파일 객체로 변환
		File tmpFile = new File(fileLocation,randomFn);
		
		//실제 물리적인 파일로 지정된 위치에 파일 생성
		try {
			//파일 시스템에 파일쓰기
			memberDTO.getFile().transferTo(tmpFile);
			//memberDTO갱신
			memberDTO.setFile(null);
			memberDTO.setOriginFn(originFn);
			memberDTO.setRandomFn(randomFn);
			isUpload = true;
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			isUpload = false;
		}
		
		
		return isUpload;
	}

	@Override
	public int delete(String id, String pw) {

		return memberDao.delete(id,pw);
	}

	@Override
	public int delete(String id) {

		return memberDao.delete(id);
	}

	@Override
	public MemberDTO getMember(String id) {

		return memberDao.getMember(id);
	}

	@Override
	public List<MemberDTO> getMemberList() {

		return memberDao.getMemberList();
	}

	@Override
	public int changePw(PasswdDTO passwdDTO) {
		
		return memberDao.changePw(passwdDTO);
	}

}
