package com.xinguang.tubobo.admin.api;

import java.util.List;

/**
 * alioss接口.
 */
public interface AdminAliossService {

    /**
     * 获取签名后的访问url
     * @param keys
     * @param hour 过期时间
     * @return
     */
    List<String> generateSignedUrl(List<String> keys, int hour);

    /**
     * 图片上传
     * @param fileKey
     * @param b
     * @param bucketType (public private)
     * @param contentType
     * @param hour
     * @return
     */
    String photoUpload(String fileKey, byte[] b, String bucketType, String contentType, int hour);
}
