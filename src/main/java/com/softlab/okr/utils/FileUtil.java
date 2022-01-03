package com.softlab.okr.utils;

import com.softlab.okr.model.exception.BusinessException;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimetypesFileTypeMap;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Objects;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2022-01-03 23:28
 **/
public class FileUtil {
    public static boolean judgeImage(MultipartFile file) {
        MimetypesFileTypeMap mimetypesFileTypeMap = new MimetypesFileTypeMap();
        mimetypesFileTypeMap.addMimeTypes("image png tif jpg jpeg bmp");
        String contentType = null;
        try {
            contentType = mimetypesFileTypeMap.getContentType(multipartFileToFile(file));
            String type = contentType.split("/")[0];
            return ("image").equals(type);
        } catch (IOException e) {
            throw new BusinessException("文件转换错误");
        }
    }

    public static File multipartFileToFile(MultipartFile file) throws IOException {

        File toFile = null;
        if (file.equals("") || file.getSize() <= 0) {
            file = null;
        } else {
            InputStream ins = null;
            ins = file.getInputStream();
            toFile = new File(Objects.requireNonNull(file.getOriginalFilename()));
            ins.close();
        }
        return toFile;
    }
}
