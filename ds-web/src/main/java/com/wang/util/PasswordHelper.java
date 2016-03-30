package com.wang.util;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.wang.auth.sys.entity.SysUser;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.AesCipherService;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Md5Hash;

import java.security.Key;


/**
 * Created by wxl on 2015/10/2.
 */
public class PasswordHelper {
    private final static String algorithmName ="md5";
    private final static int hashIterations=2;
    /**
     * base64进制加密
     *
     * @param password
     * @return
     */
    public static String encrytBase64(String password) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(password), "不能为空");
        byte[] bytes = password.getBytes();
        return Base64.encodeToString(bytes);
    }
    /**
     * base64进制解密
     * @param cipherText
     * @return
     *
     */
    public static String decryptBase64(String cipherText) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(cipherText), "消息摘要不能为空");
        return Base64.decodeToString(cipherText);
    }

    /**
     * 16进制加密
     *
     * @param password
     * @return
     */
    public static String encrytHex(String password) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(password), "不能为空");
        byte[] bytes = password.getBytes();
        return Hex.encodeToString(bytes);
    }
    /**
     * 16进制解密
     * @param cipherText
     * @return
     */
    public static String decryptHex(String cipherText) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(cipherText), "消息摘要不能为空");
        return new String(Hex.decode(cipherText));
    }

    public static String generateKey()
    {
        AesCipherService aesCipherService=new AesCipherService();
        Key key=aesCipherService.generateNewKey();
        return Base64.encodeToString(key.getEncoded());
    }


    /**
     * 对密码进行md5加密,并返回密文和salt，包含在User对象中
     * @param username 用户名
     * @param password 密码
     * @return 密文和salt
     */
    public static SysUser md5Password(String username,String password){
        Preconditions.checkArgument(!Strings.isNullOrEmpty(username),"username不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(password),"password不能为空");
        SecureRandomNumberGenerator secureRandomNumberGenerator=new SecureRandomNumberGenerator();
        String salt= secureRandomNumberGenerator.nextBytes().toHex();
        //组合username,两次迭代，对密码进行加密
        String password_cipherText= new Md5Hash(password,username+salt,2).toHex();
        SysUser user=new SysUser();
        user.setPassword(password_cipherText);
        user.setSalt(salt);
        user.setUserName(username);
        return user;
    }

    /**
     * 通过username,password,salt,校验密文是否匹配 ，校验规则其实在配置文件中，
     * @param username 用户名
     * @param password 原密码
     * @param salt  盐
     * @param md5cipherText 密文
     * @return
     */
    public static  boolean checkMd5Password(String username,String password,String salt,String md5cipherText)
    {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(username),"username不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(password),"password不能为空");
        Preconditions.checkArgument(!Strings.isNullOrEmpty(md5cipherText), "md5cipherText不能为空");
        //组合username,两次迭代，对密码进行加密
        String password_cipherText= new Md5Hash(password,username+salt,2).toHex();
        return md5cipherText.equals(password_cipherText);
    }

}
