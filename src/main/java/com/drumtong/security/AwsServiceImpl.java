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
import com.drumtong.business.vo.BImageVO;

// [건욱]
@Service 
public class AwsServiceImpl{
	
	@Autowired BImageDAO bImageDAO;

    private static final String BUCKET_NAME = "laundrydrumtong";
    private static final String ACCESS_KEY = "AKIAIXM5SLXDSXT4WXMQ";
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
    public void multipleUpload(MultipartHttpServletRequest mpf, BImageVO bImageVO) {
    
    	List<MultipartFile> fileList = mpf.getFiles("file");
        for (MultipartFile mf : fileList) {
            
        	String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            s3FileUpload(mf, bImageVO.getEstid(),bImageVO);
            
            System.out.println("실행");
    		System.out.println("originFileName : " + originFileName);
        }	
    }
    
    // s3에 파일을 업로드합니다.
    // 서버에 파일을 저장하지 않고 바로 S3로 파일을 전달해줍니다.
//    public void s3FileUpload(File file, String folderName) {
     public void s3FileUpload(MultipartFile file, String folderName, BImageVO bImageVO) {
    	 
    	 System.out.println("aws file upload 실행..");
    	 ObjectMetadata metadata = new ObjectMetadata();
    	 metadata.setContentType(MediaType.IMAGE_PNG_VALUE);
    	 metadata.setContentLength(file.getSize());
    	
        // 파일 업로드를 위한 request 객체를 생성 하였다.
        try {
        	PutObjectRequest putObjectRequest;
        	
        	// AWS S3에 저장될 파일 이름을 UUID 형식으로 다시 지정해준다.
        	// ESTID가 필요하므로 SerialUUID에 ESTID값을 보내준다.
        	SerialUUID.forAWS(bImageVO);
        	System.out.println(file.getOriginalFilename());
        	String fileName = SerialUUID.getSerialUUID("BImage", "STOREIMG") +"."+ file.getOriginalFilename().split("\\.")[1];
        	
        	
        	// 파일을 넣어준다.
        	putObjectRequest = new PutObjectRequest(BUCKET_NAME + "/" + folderName, fileName, file.getInputStream(), metadata);
			
        	
//			putObjectRequest = new PutObjectRequest(BUCKET_NAME + "/" + folderName,file.getOriginalFilename(), file.getInputStream(), metadata);
//			// Access List 를 설정 하는 부분이다. 공개 조회가 가능 하도록 public Read 로 설정 하였다.
	        putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
	        
	        // 실제로 업로드 할 액션이다.
	        amazonS3.putObject(putObjectRequest);
	        
	        // 데이터베이스에  ESTID와 StoreIMG(저장경로)를 입력해줍니다.
	        bImageVO.setStoreimg(folderName + "/" + fileName);
	        
	        bImageDAO.insertConstract(bImageVO);
	        
		} catch (IOException e) {
			e.printStackTrace();
		}
                // request 객체 안에 BUCKET_NAME + "생성 될 폴더 이름", 파일 원본이름, File 바이너리 데이터 를 설정하였다.ㅏ
//                new PutObjectRequest(BUCKET_NAME + "/" + folderName, file.getName(), file);

        // Access List 를 설정 하는 부분이다. 공개 조회가 가능 하도록 public Read 로 설정 하였다.
//        putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
//
//        // 실제로 업로드 할 액션이다.
//        amazonS3.putObject(putObjectRequest);
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

