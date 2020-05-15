package com.company;

import jcifs.util.Base64;
import org.apache.log4j.Logger;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class Decrypt {

    static Logger log = Logger.getLogger(Decrypt.class);
    private Decrypt() {
    }

    private static SecretKeySpec secretKey;
    private static byte[] key;
    static String decryptedPassword;
    static String secret = SecretKey.getSecretKey();

    /**
     * This method takes the encrypted password from config.properties and returns actual password
     *
     * @param encryptedPassword
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String getDecryptedPassword(String encryptedPassword) throws UnsupportedEncodingException {
        try {
            setKey(secret);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            decryptedPassword = new String(cipher.doFinal(Base64.decode(encryptedPassword)));
        } catch (Exception e) {
            log.error("Error while decrypting: " + e.getMessage());
        }
        return decryptedPassword;
    }

    /**
     * This method is fetching Key for decrypting the password
     *
     * @param myKey
     */
    public static void setKey(String myKey) {
        MessageDigest sha = null;
        try {
            key = myKey.getBytes("UTF-8");
            sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16);
            secretKey = new SecretKeySpec(key, "AES");
        } catch (NoSuchAlgorithmException e) {
            log.error(e.getMessage());
        } catch (UnsupportedEncodingException e) {
            log.error(e.getMessage());
        }
    }

}
