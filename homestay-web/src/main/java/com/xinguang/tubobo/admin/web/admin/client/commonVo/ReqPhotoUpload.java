package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;
import java.util.List;

public class ReqPhotoUpload {

//    @NotBlank(message = "bucketName 不能为空")
//    @Pattern(regexp = "^public|private" ,message = "bucketName 值为：public|private")
	private String bucketName;

//    @NotBlank(message = "projectName 不能为空")
    @Pattern(regexp = "^rider|merchant|driver$" ,message = "projectName 值为：rider|merchant|driver")
	private String projectName;

    //    @NotBlank(message = "projectName 不能为空")
    @Pattern(regexp = "^image/jpeg|image/png$" ,message = "contentType 值为：image/png|image/jpeg")
    private String contentType;

    @NotEmpty(message = "picBase64 不能为空")
    private List<String> picBase64;

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public List<String> getPicBase64() {
        return picBase64;
    }

    public void setPicBase64(List<String> picBase64) {
        this.picBase64 = picBase64;
    }

    public String getBucketName() {
        return bucketName;
    }

    public void setBucketName(String bucketName) {
        this.bucketName = bucketName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

}
