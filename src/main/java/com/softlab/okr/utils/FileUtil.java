package com.softlab.okr.utils;

import com.softlab.okr.model.exception.BusinessException;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.ast.Node;
import com.vladsch.flexmark.util.data.MutableDataSet;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimetypesFileTypeMap;
import java.io.*;
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

    public static boolean judgeMarkdown(MultipartFile file){
        MimetypesFileTypeMap mimetypesFileTypeMap = new MimetypesFileTypeMap();
        mimetypesFileTypeMap.addMimeTypes("md");
        String contentType = null;
        try {
            contentType = mimetypesFileTypeMap.getContentType(multipartFileToFile(file));
            String type = contentType.split("/")[0];
            return ("md").equals(type);
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

    public static String markdownToHtml(MultipartFile file) throws IOException {
        Reader reader = new InputStreamReader(file.getInputStream(), "utf-8");
        BufferedReader br = new BufferedReader(reader);
        String line;
        String content = "";
        while ((line = br.readLine()) != null) {
            content += line + "\n";
        }
        MutableDataSet options = new MutableDataSet();

        Parser parser = Parser.builder(options).build();
        HtmlRenderer renderer = HtmlRenderer.builder(options).build();
        Node document = parser.parse(content);
        String html = renderer.render(document);  // "<p>This is <em>Sparta</em></p>\n"
        System.out.println(html);
        return html;
    }
}
