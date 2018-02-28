package com.xinguang.tubobo.admin.impl.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.apache.commons.lang.StringUtils;
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
public class JWTUtils {

    public static final String TOKENSEED = "23r09yieuiouisdfk34asdkj094vjhjjdfkjk897230jwrefrefer02";
    private static String secret = "23r09sdfk34asdkj094897230jwre02";

    private static String ENCODE = "UTF-8";
    private static String AES_PASSWORD = "eGluZ3Vhbmd0YmI=";
    private static String AES_ALGORITHM = "AES/CBC/NoPadding";
    private static String IV = "svtpdprtrsjxabcd";

    private static Algorithm algorithm;

    private static JWTCreator.Builder jwtCreator;
    private static JWTVerifier jwtVerifier;


    static{
        try {
            algorithm = Algorithm.HMAC256(secret);

            jwtCreator = JWT.create();
            jwtVerifier = JWT.require(algorithm).build();

        } catch (UnsupportedEncodingException e) {
        }
    }

    /**
     * JWT加密
     */
    public static String jwtCreate(String str,long seconds) throws Exception{
        return jwtCreator.withJWTId(aesEncrypt(str))
                .withExpiresAt(new Date(System.currentTimeMillis() + seconds*1000))
                .sign(algorithm);
    }

    /**
     * JWT校验
     */
    public static String jwtVerify(String str) throws Exception{
        DecodedJWT jwt = jwtVerifier.verify(str);
        return aesDecrypt(jwt.getId());
    }

    public static void main(String[] args) throws Exception {
        String content = "a12345623557sdgsdf3467645errehw789";
        //加密
        String encryptResult = aesEncrypt(content);
        System.out.println("加密后：" + encryptResult);
        //解密
        String decryptResult = aesDecrypt(encryptResult);
        System.out.println("解密后：" + decryptResult);
        System.out.println(StringUtils.equals(content, decryptResult));



        String str = "12sdf214lk54n325lkn43l6w3sdf8s98965vjhg";
        System.out.println(str);

        String sign1 = jwtCreate(str,1);
        System.out.println(sign1);

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        String token1 = jwtVerify(sign1);
        System.out.println(token1);
//        String token3 = verify2(sign3);
//        System.out.println(token3);
//        String token4 = verify(sign4);
//        System.out.println(token4);
    }


    /**
     * AES加密
     */
    private static String aesEncrypt(String content)  throws Exception{
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
    private static String aesDecrypt(String content) throws Exception{
        Cipher cipher = Cipher.getInstance(AES_ALGORITHM);// 创建密码器
        SecretKeySpec keyspec = new SecretKeySpec(AES_PASSWORD.getBytes(ENCODE), "AES");
        IvParameterSpec ivspec = new IvParameterSpec(IV.getBytes(ENCODE));
        cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);
        byte[] result = cipher.doFinal(new BASE64Decoder().decodeBuffer(content));
        return new String(result,ENCODE).trim(); // 加密
    }
}
