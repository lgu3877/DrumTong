package com.drumtong.security;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CPrivateDataVO;

// [건욱]
@Service 
public class AwsServiceImpl{
	
	@Autowired BImageDAO bImageDAO;
	@Autowired BPaymentDAO bPaymentDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired CPrivateDataDAO cPrivateDataDAO;
	
	
	// AWS Key를 가져옵니다.
	private static String[] Security = Security();
    
    private static final String BUCKET_NAME = Security[0];
    private static final String ACCESS_KEY = Security[1];
    private static final String SECRET_KEY = Security[2];
    

    private AmazonS3 amazonS3; // 인스턴스를 초기화한다.

    public AwsServiceImpl() { // Constructor

        // 인증 객체를 생성한다.
        AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);

        // 인스턴스에 버킷의 정보를들 설정한다.
        // Region 의 경우 버킷의 url 에서 확인 할 수 있다.
        // ex) https://s3.console.aws.amazon.com/s3/buckets/
        amazonS3 = AmazonS3ClientBuilder
                .standard()
                .withRegion(Regions.AP_NORTHEAST_2)
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .build(); 		
    }
    
    // AWS Key를 가져오는 함수입니다.
    private static String[] Security() {
		String[] Security = new String[3];
    	File file = new File("C:\\AwsKeysBox\\Security.txt");
    	if(file.exists()) {
    		try {
				BufferedReader inFile = new BufferedReader(new FileReader(file));
				String sLine = null;
				int i = 0;
	    		while( (sLine = inFile.readLine()) != null) {
						Security[i] = sLine;
						i++;
						if(i == 3) break;
					}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
		return Security;
	}

	// 다중으로 이미지를 업로드할 때 사용하는 메서드이다.
    /*
     * 
     *  다음의 메서드는 들어오는 객체에 따라 S3에 저장될 경로를 다양하게 설정해줍니다.
     *  여기서 매개변수로 가져오는 folderName의 값은 Estid값입니다 
     *  이름 설정을 이렇게 한 이유는 여기서 사용되는 값이 folderName으로 사용되기 떄문에 변경했습니다.
     *  
     *  saveType 세가지 종류가 있습니다.
     *  "businessStoreImage" "customerProfileImage" "businessInformationImage"
     *     [사업자 매장사진]					[고객 프로필 사진]		[사업자 정보 사진]
     */
    public int multipleUpload(MultipartHttpServletRequest mpf, String folderName, 
    						  Object object, HttpServletRequest req) {
    	
    	
    	// 온라인 계약에 Binforamtion 테이블과 BPayment를 구분시켜주기 위한 데이터 입니다.
    	// count가 0~1 일 때는 BInformation에 관한 처리를 해주고
    	// count가 2일 때는 BPayment에 관한 처리를 해줍니다.
    	// 매장 관리 이미지 
    	// 메인이미지 "delegatephotoboolean"  서브 이미지들 "storeimg"
    	int count = 0;
    	
    	
    	
    	
    	try {
    		
    		// 타입에 따라서  fileList를 처리해줍니다.
    		String saveType = req.getParameter("saveType");
    		
    		System.out.println("saveType :13 " + saveType);
    		
    		// saveType으로 파일 리스트를 가져옵니다.
    		List<MultipartFile> fileList = mpf.getFiles(saveType);
    		
    		
    		// 파일리스트가 비어있지 않다면 작업을 실행시킬 수 있도록 한다.
            if(fileList != null ) {
            	for (MultipartFile mf : fileList) {
            		
            		// 파일 업로드를 시켜주는 함수를 실행시켜줍니다.
            		// 매개 변수 [ file, 폴더 이름으로 쓸 ESTID, VO객체, count ]
                	fileUpload(mf, folderName, object, count);
                	
                	// for문이 한 번씩 돌아갈 때마다 count를 증가시켜줍니다.
                	count++;
                	
                }
            }
    		
    		// saveTypeBoolean 함수를 호출해서 해당 타입에 조건이 부합하는지 boolean 형태로 반환시켜줍니다.
            // 만약 saveType이 매장사진이면 밑에 요청을 처리해줍니다.
            if(saveType.equals("businessStoreImage")) {
            	
            	// 클라이언트에서 요청한 대표사진을 가져옵니다.
            	MultipartFile delegate = mpf.getFile("delegatephotoboolean");
            	
            	// 대표 사진을 추가시켜주는 함수입니다.
            	addStoreDelegatePhoto(delegate, object);
            	
            	
            	
            	// 클라이언트에서 요청한 삭제 리스트를 받아옵니다.
        		String deleteList[] = req.getParameterValues("deleteUploadImage");
        		
        		// 파일 삭제를 요청하는 함수입니다.
        		multipleDelete(deleteList, object);
        		
            	
            	
            }
            // 모든게 완벽하게 실행이 완료되면 참의 값인 1을 반환해줍니다.
            return 1;
    	}
    	catch(Exception e) {
    		System.out.println("Exception 발생 " + e);
    		return 0;
    	}
    	
    }
    

    
    
    // s3에 파일을 업로드합니다.
    // 서버에 파일을 저장하지 않고 바로 S3로 파일을 전달해줍니다.
    // public void fileUpload(File file, String folderName) {
     public int fileUpload(MultipartFile file, String folderName, Object object, int count) {
    	 
		// AWS S3에 저장될 파일 이름을 UUID 형식으로 다시 지정해준다.
		// ESTID가 필요하므로 SerialUUID에 ESTID값을 보내준다.
		System.out.println(file.getOriginalFilename());
		
		
		// 서브 폴더 경로를 지정해줄 폴더명이다.
		String subFolderName = "";
		
		// UUID를 생성할 때 필요한 매개변수 값이다.
		String tableFieldName = "";
		
		// UUID의 타입이며 databaseFileUplaod의 switch 구분자 역할을 해준다.
		String UUIDType = "";
		
		int result = 0;
		
		/*
		 *  databaseFileUpload 함수에 요구되는 매개 변수는 다음과 같습니다.
		 *  [file 정보, VO 객체, folderName으로 사용될 ESTID, 변경된 파일 이름, 서브폴더명, UUIDType]
		 */
		//		databaseFileUplaod(file, object, folderName, fileName, subFolderName, UUIDType);
		
		
				// 매장사진 테이블일 경우 ( 제일 많이 사용될 가능성이 높기 떄문에 최상단에 배치해주었다.)
				/*
				 * 매장사진의 경우에는 서비스에서 1차적으로 insert를 하지않고 여기서 종합적으로 신규 데이터를 만들어준다.
				 */
				if(object instanceof BImageVO) { 
					
					
					// 서브폴더 이름은 매장사진이다.
					subFolderName = "BIMAGE";
					
					// 테이블 필드명은 BImage이다.
					tableFieldName = "BImage";
					
					// UUIDType은 STOREIMG이다.
					UUIDType = "STOREIMG";
					
					// 파일 업로드를 준비시켜주는 함수입니다.
					result = exeFileUpload( file, object, folderName, subFolderName, UUIDType , tableFieldName);
					
					
				}
				// 사업자 정보 테이블일 경우	
				/*
				 * 사업자 정보 테이블의 경우에는 Service에서 1차적으로 데이터를 입력해준 다음 여기에서 DAO작업은 저장된 파일경로와 파일명을 update시켜주는 역할만 해준다.
				 * 이렇게 하는 이유는 두 개의 테이블안에 데이터를 각각 처리해주어야하는데
				 * BInformation에서는 한꺼번에 처리하기가 힘들기 때문에 1차 입력 2차수정으로 동작시켜준다.
				 */
				else if(object instanceof BInformationVO && count < 2) {
					
					// 서브 폴더 명이다.
					subFolderName = "CONTRACT";
					
					// 첫 번째 저장일 때는 영업신고증에 관련한 처리를 해줍니다.영업신고증 SerialUUID 생성
					if(count == 0) {
						
						// 테이블 필드명이다.
						tableFieldName = "BInformationAboutReportCard";
						
						// UUIDType이다.
						UUIDType = "REPORTCARD";
						
						
						// 파일 업로드를 준비시켜주는 함수입니다.
						result = exeFileUpload( file, object, folderName, subFolderName, UUIDType , tableFieldName);
						
					}
					
					// 두 번째 저장일 시에는 사업자 등록증에 관련한 처리를 해줍니다 사업자 등록증 SerialUUID 생성
					else {
						
						// 테이블 필드명이다.
						tableFieldName = "BInformationAboutLicense";
						
						// UUIDType이다.
						UUIDType = "LICENSE";
						
						// 파일 업로드를 준비시켜주는 함수입니다.
						result = exeFileUpload( file, object, folderName, subFolderName, UUIDType , tableFieldName);
						
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
					
					// 서브 폴더 명이다.
					subFolderName = "CONTRACT";
					
					// 테이블 필드 이름이다.
					tableFieldName = "BPayment";
					
					// UUIDTYPE이다.
					UUIDType = "COPYOFBANKBOOK";
					
					// 파일 업로드를 준비시켜주는 함수입니다.
					result = exeFileUpload( file, object, folderName, subFolderName, UUIDType , tableFieldName);
					
				}    	
				// ======================= 영경 =============================
		     	// 고객 프로필 사진 등록
		     	else if(object instanceof CPrivateDataVO) {
		     		
		     		subFolderName = "PhotoID";
					
					tableFieldName = "CPhotoID";
					
					UUIDType = "PhotoID";
					
					// 파일 업로드를 준비시켜주는 함수입니다.
					result = exeFileUpload( file, object, folderName, subFolderName, UUIDType , tableFieldName);
					
		     	}
		     	// ========================================================
		 
				
		
		

				
				
		
		// 결과값을 반환시켜준다.
		return result;

     }
     
     // 파일 업로드를 실행준비시켜주는 함수이다.
     private int exeFileUpload (MultipartFile file, Object object, 
		       String folderName, String subFolderName, 
		       String UUIDType , String tableFieldName){
    	 	
    	 	int result = 0;
			
			// 실질적으로 저장될 파일 이름을 선언해준다.
			String fileName = createFileName(file, tableFieldName, UUIDType);
			
			// databaseFileUpload를 실행시킨다.
			result = databaseFileUplaod(file, object, folderName, fileName, subFolderName, UUIDType);
			
			
			// S3에 저장시킬 경로를 저장해준다.
			String dir = BUCKET_NAME + "/" + folderName + "/" + subFolderName;
			
			
			// 데이터베이스에 성공적으로 입력이 되었다면 S3에도 파일을 추가시켜준다.
			return  (result == 1) ? addFileS3(dir,fileName, file) : 0;

     }
    
     
     
     // [내부함수] AWS에 File을 추가시켜주는 함수입니다.
    private int addFileS3(String dir, String fileName, MultipartFile file) {
    	 
         PutObjectRequest putObjectRequest;
    	
    	 ObjectMetadata metadata = new ObjectMetadata();
    	 metadata.setContentType(MediaType.IMAGE_PNG_VALUE);
    	 metadata.setContentLength(file.getSize());
    	 
    	 System.out.println(dir);
    	 System.out.println(fileName);
    	 System.out.println(file.getName());
    	 System.out.println("s3 파일 추가 함수 실행");
     	
     	// 파일을 넣어준다.
     	try {
     		
     		// 객체를 넣기 위한 요청 객체이다.
     		putObjectRequest = new PutObjectRequest(dir, fileName, file.getInputStream(), metadata);

			// Access List 를 설정 하는 부분이다. 공개 조회가 가능 하도록 public Read 로 설정 하였다.
		    putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
		        
		    
		    // 실제로 업로드 할 액션이다.
	        amazonS3.putObject(putObjectRequest);
	        
	        
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
			
     	
     	
    	return 1;
    }
     
    // [내부함수] 파일 삭제시켜주는 함수입니다.
    public void fileDelete(Object object) {
    	
    	// DB 내부에 파일을 삭제시켜주는 함수입니다
    	String filePath = databaseFileDelete(object);
    	
    	// S3 파일을 삭제시켜주는 함수입니다.
    	s3FileDelete(filePath);
    	
    }
    
    // [내부함수] s3에 파일을 삭제합니다.
    private void s3FileDelete(String filePath) {
    	
    	// S3 내부에 존재하는 파일을 삭제해줍니다.
    	amazonS3.deleteObject(BUCKET_NAME, filePath);
    	
    }
    
    // [내부함수] db에 있는 파일들을 삭제 시켜줍니다.
    private String databaseFileDelete(Object object) {
    	
    	// s3FileDelete에 사용될 파일 경로입니다.
    	String filePath = "";
    	
    	
    	// DB에 존재하는 파일 경로를 삭제해줍니다.
    	if(object instanceof BImageVO) { 
    		BImageVO vo = (BImageVO)object;
    		bImageDAO.deleteBImage(vo);
    		filePath = vo.getStoreimg(); 
    	}
    	
    	// 파일경로를 반환시켜줍니다.
    	return filePath;
    }
    
    // [내부함수] 데이터 베이스에 파일 경로를 업로드 시켜주는 함수입니다. 
    private int databaseFileUplaod(MultipartFile file, Object object, String folderName,
			  						String fileName, String subFolderName, String UUIDType ) {	
    	
    	int result = 0;
    	
    	// DB에 저장될 파일경로입니다. 이것을 이용해서 view상에서 그림을 S3에서 호출해서 불러옵니다.
    	String src =  folderName + "/"  + subFolderName + "/" + fileName ;
    	
		switch (UUIDType) {
			case "STOREIMG" : 
				BImageVO bImageVO = (BImageVO)object;
				bImageVO.setStoreimg(src);
				result = bImageVO.getDelegatephotoboolean() != null ? 
						bImageDAO.insertDelegatePhoto(bImageVO) : bImageDAO.insertConstract(bImageVO);
				break;
				
				
			case "REPORTCARD":
				BInformationVO bInformationVO = (BInformationVO)object;
				bInformationVO.setReportcard(src);
				result = bInformationDAO.updateReportCard(bInformationVO);
				break;

			case "LICENSE" :
				BInformationVO bInformationVO2 = (BInformationVO)object;
				bInformationVO2.setLicense(src);
				result = bInformationDAO.updateLicense(bInformationVO2);
				break;
				
			case "COPYOFBANKBOOK" :
				BPaymentVO bPaymentVO = new BPaymentVO();	
				bPaymentVO.setCopyofbankbook(src);
				bPaymentVO.setEstid(folderName.split("/")[1]);
				result = bPaymentDAO.updateCopyOfBankBook(bPaymentVO);
				break;
			case "PhotoID" :
				CPrivateDataVO cPrivateDataVO = (CPrivateDataVO)object;
				cPrivateDataVO.setProfileimg(src);
				result = cPrivateDataDAO.updateImg(cPrivateDataVO);
				break;
	
		}
		
		
		return result;
		
		
	
	}


////  [내부함수] saveType의 boolean을 리턴해줍니다.
//   private boolean saveTypeBoolean(String saveType) {
//   	switch(saveType) {
//   		
//   		// saveType이 매장 사진이면 true를 반환시켜줍니다.
//   		case "businessStoreImage" : return true;
//   		
//   		case "customerProfileImage" : return true;
//   		
//   		case "businessInformationImage" : return true;
//   		
//   	}
//   	
//   	return false;
//   }
   
   
   // [내부함수] MultipleUpload에 대표사진이 있을 경우 추가적으로 업로드를 해주는 함수입니다.
   private int addStoreDelegatePhoto(MultipartFile delegate, Object object) {
   	
	   	// 받아온 파일이 비어있다면 함수를 종료시킨다.
	   	if(delegate == null || delegate.isEmpty() ) 
	   		return 0;
	   	
	   	
	   	BImageVO vo = (BImageVO)object;
	   	
	   	// 대표사진 유무를 'Y' 로 설정해준다.
	    vo.setDelegatephotoboolean("Y");
	       
	      
	    // S3의 파일 업로드를 시켜준다.
	    // 결과 값을 반환시켜준다. 
	   	return fileUpload(delegate, vo.getEstid(), object, 0);
   }
   
   
   // [내부함수] MultipleUpload에 삭제 요청이 있을 경우 추가적으로 삭제를 해주는 함수입니다.
   private int multipleDelete(String deleteList[], Object object) {
	   
	   // deleteList가 존재하지 않으면 함수를 종료시켜준다.
	   	if( deleteList == null || deleteList.length == 0 ) 
	   		return 0;
	   	
	   	BImageVO vo = (BImageVO)object;
	   	
	   	
	   	// deleteList의 배열의 길이만큼 S3애 존재하는 파일을 삭제 시켜준다.
	   	for(String deleteValue : deleteList) {
	   		
	   		vo.setStoreimg(deleteValue);
	   		
	   		// DB와 S3의 데이터를 삭제시켜주는 함수입니다.
	   		fileDelete(vo);
	   	}
   	
   	return 0;
   }
   
   
   //  [내부함수] 파일명을 새롭게 정의시켜줍니다. 필드 값과 요청 타입에 따라 앞에붙은 문자열은 다르게 처리됩니다.
   // ex) STOREIMG_b5aa52d9fddd483f88610b05f4f63c8a.png
   private String createFileName(MultipartFile file, String tableFieldName, String UUIDType) {
	   
	   // UUID를 가져온다.
		String UUID = SerialUUID.getSerialUUID(tableFieldName, UUIDType);
		
		// 실질적으로 저장될 파일 이름을 선언해준다.
		String fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
		
		return fileName;
   }









}

//file upload 메서드 이전코드


//// 매장사진 테이블일 경우 ( 제일 많이 사용될 가능성이 높기 떄문에 최상단에 배치해주었다.)
///*
// * 매장사진의 경우에는 서비스에서 1차적으로 insert를 하지않고 여기서 종합적으로 신규 데이터를 만들어준다.
// */
//if(object instanceof BImageVO) { 
//	
//	// 서브폴더 이름은 매장사진이다.
//	subFolderName = "BIMAGE";
//	
//	// UUID를 가져온다.
//	UUID = SerialUUID.getSerialUUID("BImage", "STOREIMG");
//	
//	// 1. 파일이름
//	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
//	
//	// 2. 매게변수로 받은 object를 BImageVO로 변환시켜준다.
//	BImageVO vo = (BImageVO)object;
//	
//	// 3. vo에 setStoreimg로 현재 파일 경로를 입력해준다.
//	vo.setStoreimg(folderName + "/"  + subFolderName + "/" + fileName);
//
//	
//	// 4. 데이터를 입력해준다.
//	// 대표 매장 사진의 값이 존재한다면 DelegatePhoto 함수를 불러오고 그렇지 않다면 insertConstract 함수를 불러온다.
//	// DelegatePhoto 함수 -> 대표 매장 사진 DB에 등록
//	// insertConstract -> 일반 매장 사진 DB에 등록
//	
//	int b = vo.getDelegatephotoboolean() != null ? 
//			bImageDAO.insertDelegatePhoto(vo) : bImageDAO.insertConstract(vo);
//	System.out.println("bresult ; " + b);
//}
//// 사업자 정보 테이블일 경우	
///*
// * 사업자 정보 테이블의 경우에는 Service에서 1차적으로 데이터를 입력해준 다음 여기에서 DAO작업은 저장된 파일경로와 파일명을 update시켜주는 역할만 해준다.
// * 이렇게 하는 이유는 두 개의 테이블안에 데이터를 각각 처리해주어야하는데
// * BInformation에서는 한꺼번에 처리하기가 힘들기 때문에 1차 입력 2차수정으로 동작시켜준다.
// */
//else if(object instanceof BInformationVO && count < 2) {
//	System.out.println("BInformationVO 동작 합니다 [count] : " + count);
//
//	subFolderName = "CONTRACT";
//	
//	// 매게변수로 받은 object를 BInformationVO로 변환시켜준다.
//	BInformationVO vo = (BInformationVO)object;
//	
//	// 첫 번째 저장일 때는 영업신고증에 관련한 처리를 해줍니다.영업신고증 SerialUUID 생성
//	if(count == 0) {
//		UUID = SerialUUID.getSerialUUID("BInformationAboutReportCard", "REPORTCARD");
//
// 		// 1. 파일이름
//    	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
//    	// 2. vo에 Reportcard 현재 파일 경로를 입력해준다.
//		vo.setReportcard(folderName + "/"  + subFolderName + "/" + fileName);
//		// 3. Reportcard를 업데이트 시켜준다. 
//		bInformationDAO.updateReportCard(vo);
//	}
//	
//	// 두 번째 저장일 시에는 사업자 등록증에 관련한 처리를 해줍니다 사업자 등록증 SerialUUID 생성
//	else {
//		UUID = SerialUUID.getSerialUUID("BInformationAboutLicense", "LICENSE");
//
// 		// 1. 파일이름
//    	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
//    	
//    	// 2. vo에 License의 현재 파일 경로를 입력해준다.
//		vo.setLicense(folderName + "/"  + subFolderName + "/" + fileName);
//		
//		// 3. License를 업데이트 시켜준다.
//		bInformationDAO.updateLicense(vo);
//	}
//}
//
//// 결제 테이블일 경우
///*
// * 
// * 사업자 정보 테이블의 경우에는 Service에서 1차적으로 데이터를 입력해준 다음 여기에서 DAO작업은 저장된 파일경로와 파일명을 update시켜주는 역할만 해준다.
// * 이렇게 하는 이유는 두 개의 테이블안에 데이터를 각각 처리해주어야하는데
// * 전에 BImage에서 한꺼번에 처리하기가 힘들기 때문에 1차 입력 2차수정으로 바꾸어준다.
// */
//else if(object instanceof BInformationVO && count == 2) {
//	subFolderName = "CONTRACT";
//	UUID = SerialUUID.getSerialUUID("BPayment", "COPYOFBANKBOOK");
//	
//	// 1. 파일이름
//	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
//	
//	// 2. BPayment는 mpf에서 따로 Name을 구분 시킬 수 없으므로 새로운 VO를 생성시켜줘서 데이터를 업데이트 시켜준다.
//	BPaymentVO vo = new BPaymentVO();
//	
//	
//	// 3. vo에 관한 데이터를 set시켜준다. 
//	vo.setCopyofbankbook(folderName + "/"  + subFolderName + "/" + fileName);
//	
//	// 여기서 folderName은 estid이기 떄문에 estid를 설정해준다고 생각하면 되겠다.
//	vo.setEstid(folderName);
//	
//	// 4. 통장사본 데이터를 입력해준다.
//	bPaymentDAO.updateCopyOfBankBook(vo);
//
//}    	
//// ======================= 영경 =============================
//	// 고객 프로필 사진 등록
//	else if(object instanceof CPrivateDataVO) {
////		System.out.println("aws 고객 프로필 사진 등록 메서드 실행(영경)");
//		CPrivateDataVO cPrivateDataVO = (CPrivateDataVO)object;
//		
//		// subFolderName 폴더명 지정
//		subFolderName = "PhotoID";
////		System.out.println("subFolderName : " + subFolderName);
//		
//		// UUID 가져오기
//		UUID = SerialUUID.getSerialUUID("CPhotoID", "PhotoID");
////		System.out.println("UUID : " + UUID);
//		
//		// 1. 파일이름
//	fileName = UUID +"."+ file.getOriginalFilename().split("\\.")[1];
////	System.out.println("fileName : " + fileName);
//	
//	cPrivateDataVO.setProfileimg(folderName + "/"  + subFolderName + "/" + fileName);
////	System.out.println("setProfileimg : " + cPrivateDataVO.getProfileimg());
//	
//	// DB애 이미지 주소 넣고 return 1 지우기
//	int result = cPrivateDataDAO.updateImg(cPrivateDataVO);
////	System.out.println("result : " + (result == 1 ? "입력 완료" : "입력 실패"));
//	}
//	// ========================================================
//








