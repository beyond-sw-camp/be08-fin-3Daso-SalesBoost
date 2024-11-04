package beyond.samdasoo.common.utils;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@Component
@Service
public class S3Uploader {

    @Autowired
    private AmazonS3Client amazonS3Client;

    @Value("${spring.cloud.aws.s3.bucket}")
    private String bucket;

    public String uploadFileToS3(MultipartFile uploadFile, String dirName) {

        String fileType = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf("."));
        String randomName = UUID.randomUUID() + fileType; // 파일 이름 중복 방지
        String fileName = dirName + "/" + randomName;

        return putS3(uploadFile, fileName);
    }

    private String putS3(MultipartFile uploadFile, String fileName) {
        ObjectMetadata metadata = new ObjectMetadata();
      //  metadata.setContentType(uploadFile.getContentType());
        metadata.setContentType("image/jpeg");
        metadata.setContentLength(uploadFile.getSize());
        try {
            amazonS3Client.putObject(new PutObjectRequest(bucket, fileName, uploadFile.getInputStream(), metadata));

        }catch (IOException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return amazonS3Client.getUrl(bucket, fileName).toString();
    }

    public void deleteInS3File(String filePath) throws Exception{
        try{
            String key = filePath.substring(56);
            try{
                amazonS3Client.deleteObject(bucket,key);
            }catch (AmazonServiceException e){
                log.info(e.getErrorMessage());
            }
        }catch (Exception e){
            log.info(e.getMessage());
        }
        log.info("[S3Uploader]: S3에 있는 파일 삭제");
    }

    public Optional<File> convertMultipartToFile(MultipartFile multipartFile) throws IOException {
        // 시스템 임시 디렉토리에 파일 생성
        String fileName = multipartFile.getOriginalFilename();
        File convertFile = new File(System.getProperty("java.io.tmpdir"), fileName);

        try (FileOutputStream fos = new FileOutputStream(convertFile)) {
            fos.write(multipartFile.getBytes());
        }

        if (convertFile.exists()) {
            return Optional.of(convertFile);
        } else {
            throw new IOException("[ERROR]: 파일 생성에 실패했습니다.");
        }
    }


}
