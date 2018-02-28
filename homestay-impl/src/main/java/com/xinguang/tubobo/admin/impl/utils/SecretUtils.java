package com.xinguang.tubobo.admin.impl.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.hzmux.hzcms.common.security.Digests;
import com.hzmux.hzcms.common.utils.Encodes;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * Created by ou_young on 2017/7/3.
 */
public class SecretUtils {

    private static String secret = "23r09sdfk34asdkj094897230jwre02";

    private static String ENCODE = "UTF-8";
    private static String AES_PASSWORD = "dGJiZXhwcmVzcw==";
    private static String IV = "fxlyyqiuwwljqwss";
    private static String AES_ALGORITHM = "AES/CBC/NoPadding";

    private static Algorithm algorithm;

    private static JWTCreator.Builder jwtCreator;
    private static JWTVerifier jwtVerifier;

    private static final String HASH_ALGORITHM = "SHA-1";
    private static final int HASH_INTERATIONS = 1024;
    private static final int SALT_SIZE = 8;

    static{
        try {
            algorithm = Algorithm.HMAC256(secret);

            jwtCreator = JWT.create();
            jwtVerifier = JWT.require(algorithm).build();

        } catch (UnsupportedEncodingException e) {
        }
    }

    public static void main(String[] args) throws Exception {
//        String str = "12sdf214lk54n325lkn43l6w3sdf8s98965vjhg";
//        System.out.println(str);
//
//        String sign1 = jwtCreate("387fb6d279084e459017addfb4988bca",60*60*24*30);
//        System.out.println(sign1);

        String content = "12345678";
//        //加密
        String encryptResult = aesEncrypt(content);
        System.out.println("加密后：" + encryptResult);

    }

    /**
     * JWT加密
     */
    public static String jwtCreate(String str,long seconds) throws Exception{
        return jwtCreator.withJWTId(str)
                .withExpiresAt(new Date(System.currentTimeMillis() + seconds*1000))
                .sign(algorithm);
    }

    /**
     * JWT校验
     */
    public static String jwtVerify(String str) throws Exception{
        DecodedJWT jwt = jwtVerifier.verify(str);
        return jwt.getId();
    }

    /**
     * AES加密
     */
    public static String aesEncrypt(String content) throws Exception{
        Cipher cipher = Cipher.getInstance(AES_ALGORITHM);// 创建密码器
        int blockSize = cipher.getBlockSize();
        byte[] dataBytes = content.getBytes(ENCODE);
        int plaintextLength = dataBytes.length;
        if (plaintextLength % blockSize != 0) {
            plaintextLength = plaintextLength + (blockSize - (plaintextLength % blockSize));
        }
        byte[] plaintext = new byte[plaintextLength];
        System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);
        SecretKeySpec keyspec = new SecretKeySpec(AES_PASSWORD.getBytes(ENCODE), "AES");
        IvParameterSpec ivspec = new IvParameterSpec(IV.getBytes(ENCODE));
        cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);// 初始化

        byte[] result = cipher.doFinal(plaintext);
        return new BASE64Encoder().encode(result); // 加密
    }

    /**
     * AES解密
     */
    public static String aesDecrypt(String content) throws Exception{
        Cipher cipher = Cipher.getInstance(AES_ALGORITHM);// 创建密码器
        SecretKeySpec keyspec = new SecretKeySpec(AES_PASSWORD.getBytes(ENCODE), "AES");
        IvParameterSpec ivspec = new IvParameterSpec(IV.getBytes(ENCODE));
        cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);
        byte[] result = cipher.doFinal(new BASE64Decoder().decodeBuffer(content));//System.out.println(new String(result,ENCODE).trim());
        return new String(result,ENCODE).trim(); // 加密
    }

    /**
     * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
     */
    public static String passwordEntrypt(String plainPassword) {
        byte[] salt = Digests.generateSalt(SALT_SIZE);
        byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
        return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
    }

    /**
     * 验证密码
     * @param plainPassword 明文密码
     * @param password 密文密码
     * @return 验证成功返回true
     */
    public static boolean passwordValidate(String plainPassword, String password) {
        byte[] salt = Encodes.decodeHex(password.substring(0,16));
        byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
        return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
    }

    /**
     * 校验密码格式
     */
    public static boolean checkPwdPatten(String password) {
        return password.matches("^.{8,20}$");
    }

}
