package com.drumtong.security;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.drumtong.business.dao.BImageDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BPaymentVO;

// [건욱]
@Service 
public class AwsServiceImpl{
	
	@Autowired BImageDAO bImageDAO;
	@Autowired BPaymentDAO bPaymentDAO;
	@Autowired BInformationDAO bInformationDAO;
	
	
    private static final String BUCKET_NAME = "laundrydrumtong2";
    private static final String ACCESS_KEY = "AKIARY57UYCGCWQCGNXQ";
    private static final String SECRET_KEY = "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";

    private AmazonS3 amazonS3; // 인스턴스를 초기화한다.

    public AwsServiceImpl() { // Constructor

        // 인증 객체를 생성한다.
        AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);

        // 인스턴스에 버킷의 정보를들 설정한다.
        // Region 의 경우 버킷의 url 에서 확인 할 수 있다.
        // ex) https://s3.console.aws.amazon.com/s3/buckets/static.preeplus.com/?region=ap-northeast-2&tab=overview
        amazonS3 = AmazonS3ClientBuilder
                .standard()
                .withRegion(Regions.AP_NORTHEAST_2)
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .build(); 		
    }
    
    // 다중으로 이미지를 업로드할 때 사용하는 메서드이다.
    /*
     * 
     *  다음의 메서드는 들어오는 객체에 따라 S3에 저장될 경로를 다양하게 설정해줍니다.
     *  여기서 매개변수로 가져오는 folderName의 값은 Estid값입니다 
     *  이름 설정을 이렇게 한 이유는 여기서 사용되는 값이 folderName으로 사용되기 떄문에 변경했습니다.
     */
    public void multipleUpload(MultipartHttpServletRequest mpf, String folderName, Object object) {
    	
    	// 온라인 계약에 Binforamtion 테이블과 BPayment를 구분시켜주기 위한 데이터 입니다.
    	// count가 0~1 일 때는 BInformation에 관한 처리를 해주고
    	// count가 2일 때는 BPayment에 관한 처리를 해줍니다.
    	int count = 0;
    	
    	
    	List<MultipartFile> fileList = mpf.getFiles("file");
        for (MultipartFile mf : fileList) {
        	String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//            s3FileUpload(mf, object.getEstid(), object);
        	s3FileUpload(mf, folderName, object, count);
        	count++;
        	
            System.out.println("실행");
    		System.out.println("originFileName : " + originFileName);
        }	
    }
    
    // s3에 파일을 업로드합니다.
    // 서버에 파일을 저장하지 않고 바로 S3로 파일을 전달해줍니다.
//    public void s3FileUpload(File file, String folderName) {
     public void s3FileUpload(MultipartFile file, String folderName, Object object, int count) {
    	 
    	 
    	 ObjectMetadata metadata = new ObjectMetadata();
    	 metadata.setContentType(MediaType.IMAGE_PNG_VALUE);
    	 metadata.setContentLength(file.getSize());
    	
    	 
        // 파일 업로드를 위한 request 객체를 생성 하였다.
        try {
        	PutObjectRequest putObjectRequest;
        	
        	// AWS S3에 저장될 파일 이름을 UUID 형식으로 다시 지정해준다.
        	// ESTID가 필요하므로 SerialUUID에 ESTID값을 보내준다.
        	System.out.println(file.getOriginalFilename());
        	
        	// 서브 폴더 경로를 지정해줄 폴더명이다.
         	String subFolderName = "";
         	// UUID를 담는 변수이다.
         	String UUID = "";
         	
         	// 파일이름
        	String fileName = "";
        	
         	
         	
         	
         	// 매장사진 테이블일 경우 ( 제일 많이 사용될 가능성이 높기 떄문에 최상단에 배치해주었다.)
        	/*
        	 * 매장사진의 경우에는 서비스에서 1차적으로 insert를 하지않고 여기서 종합적으로 신규 데이터를 만들어준다.
        	 */
         	if(object instanceof BImageVO) { 
//         		BImageVO vo = (BImageVO)object;
         		
         		// 서브폴더 이름은 매장사진이다.
         		subFolderName = "BIMAGE";
         		
         		// UUID를 가져온다.
         		UUID = SerialUUID.getSerialUUID("BImage", "STOREIMG");
         		
         		// 1. 파일이름
            	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
            	// 2. 매게변수로 받은 object를 BImageVO로 변환시켜준다.
            	BImageVO vo = (BImageVO)object;
            	// 3. vo에 setStoreimg로 현재 파일 경로를 입력해준다.
	    		vo.setStoreimg(folderName + "/"  + subFolderName + "/" + fileName);
	    		// 4. 데이터를 입력해준다.
	    		bImageDAO.insertConstract(vo);
         	}
         	// 사업자 정보 테이블일 경우
         	/*
         	 * 사업자 정보 테이블의 경우에는 Service에서 1차적으로 데이터를 입력해준 다음 여기에서 DAO작업은 저장된 파일경로와 파일명을 update시켜주는 역할만 해준다.
         	 * 이렇게 하는 이유는 두 개의 테이블안에 데이터를 각각 처리해주어야하는데
         	 * BInformation에서는 한꺼번에 처리하기가 힘들기 때문에 1차 입력 2차수정으로 동작시켜준다.
         	 */
         	else if(object instanceof BInformationVO && count < 2) {
         		System.out.println("BInformationVO 동작 합니다 [count] : " + count);
//         		BInformationVO vo = (BInformationVO)object;
         		subFolderName = "CONTRACT";
         		
         		// 매게변수로 받은 object를 BInformationVO로 변환시켜준다.
            	BInformationVO vo = (BInformationVO)object;
            	
         		// 첫 번째 저장일 때는 영업신고증에 관련한 처리를 해줍니다.영업신고증 SerialUUID 생성
         		if(count == 0) {
         			UUID = SerialUUID.getSerialUUID("BInformationAboutReportCard", "REPORTCARD");

             		// 1. 파일이름
                	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
                	// 2. vo에 Reportcard 현재 파일 경로를 입력해준다.
    	    		vo.setReportcard(folderName + "/"  + subFolderName + "/" + fileName);
    	    		// 3. Reportcard를 업데이트 시켜준다. 
    	    		bInformationDAO.updateReportCard(vo);
         		}
         		
         		// 두 번째 저장일 시에는 사업자 등록증에 관련한 처리를 해줍니다 사업자 등록증 SerialUUID 생성
         		else {
         			UUID = SerialUUID.getSerialUUID("BInformationAboutLicense", "LICENSE");

             		// 1. 파일이름
                	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
                	
                	// 2. vo에 License의 현재 파일 경로를 입력해준다.
    	    		vo.setLicense(folderName + "/"  + subFolderName + "/" + fileName);
    	    		
    	    		// 3. License를 업데이트 시켜준다.
    	    		bInformationDAO.updateLicense(vo);
         		}
         	}
         	// 결제 테이블일 경우
         	/*
         	 * 
         	 * 사업자 정보 테이블의 경우에는 Service에서 1차적으로 데이터를 입력해준 다음 여기에서 DAO작업은 저장된 파일경로와 파일명을 update시켜주는 역할만 해준다.
         	 * 이렇게 하는 이유는 두 개의 테이블안에 데이터를 각각 처리해주어야하는데
         	 * 전에 BImage에서 한꺼번에 처리하기가 힘들기 때문에 1차 입력 2차수정으로 바꾸어준다.
         	 */
         	else if(object instanceof BInformationVO && count == 2) {
         		subFolderName = "CONTRACT";
         		UUID = SerialUUID.getSerialUUID("BPayment", "COPYOFBANKBOOK");
         		
         		// 1. 파일이름
            	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
            	
            	// 2. BPayment는 mpf에서 따로 Name을 구분 시킬 수 없으므로 새로운 VO를 생성시켜줘서 데이터를 업데이트 시켜준다.
            	BPaymentVO vo = new BPaymentVO();
            	
            	
            	// 3. vo에 관한 데이터를 set시켜준다. 
            	vo.setCopyofbankbook(folderName + "/"  + subFolderName + "/" + fileName);
	    		
            	// 여기서 folderName은 estid이기 떄문에 estid를 설정해준다고 생각하면 되겠다.
            	vo.setEstid(folderName);
	    		
            	// 4. 통장사본 데이터를 입력해준다.
	    		bPaymentDAO.updateCopyOfBankBook(vo);
         	
         	}
         	
         	// aws에 들어가는 디렉토리 경로입니다.
        	String dir = BUCKET_NAME + "/" + folderName + "/" + subFolderName;
        	
        	
        	
        	
        	// 파일을 넣어준다.
        	putObjectRequest = new PutObjectRequest(dir, fileName, file.getInputStream(), metadata);
			
        	
//			// Access List 를 설정 하는 부분이다. 공개 조회가 가능 하도록 public Read 로 설정 하였다.
	        putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
	        
	        
	        
	        // 실제로 업로드 할 액션이다.
	        amazonS3.putObject(putObjectRequest);
	        
	        
	        
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    
    // s3에 파일을 삭제합니다.
    public void s3FileDelete(String filePath) {
    	
//    	for (S3ObjectSummary file : amazonS3.listObjects(BUCKET_NAME, filePath).getObjectSummaries()){
//    		System.out.println("파일 키 " + file.getKey());
//    	   amazonS3.deleteObject(BUCKET_NAME, file.getKey());
//    	}
//    	DeleteObjectRequest deleteRequest = new DeleteObjectRequest(BUCKET_NAME);

    	System.out.println("aws 삭제 실행");
    	// 파일을 삭제해줍니다.
    	amazonS3.deleteObject(BUCKET_NAME, filePath);

    	
    }
}

