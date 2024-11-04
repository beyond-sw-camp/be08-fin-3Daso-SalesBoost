package beyond.samdasoo.test;


import beyond.samdasoo.common.jwt.RefreshTokenRepository;
import beyond.samdasoo.common.utils.S3Uploader;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RequestMapping("/test")
@RestController
@RequiredArgsConstructor
public class TestController {

    private final S3Uploader s3Uploader;

    private final RefreshTokenRepository refreshTokenRepository;

    @GetMapping
    public String test(){
        return "test";
    }

    @PostMapping("/images")
    public String createImage(MultipartFile file){
        String url = "";
        if(file!=null) url = s3Uploader.uploadFileToS3(file,"static/ex-image");
        return url;
    }

}
