package ports.utility;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.*;

public class security {
    
    //a security class that holds the key and encrypt and decrypt functions that will be used by the servlets.
    private static byte[] key = {'p','a','u','l','.','s','p','i',
                                   'z','z','e','r','i','a','t','p'};
    public static String encrypt(String strToEncrypt) {
            String encryptedString = null;
            try {
                    Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
                    final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
                    cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                    encryptedString = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes()));
            } catch (Exception e) {
                    System.err.println(e.getMessage());
            }
            return encryptedString;
    }

    public static String decrypt(String codeDecrypt){
            String decryptedString = null;
            try{
                    Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
                    final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
                    cipher.init(Cipher.DECRYPT_MODE, secretKey);
                    decryptedString = new String(cipher.doFinal(Base64.decodeBase64(codeDecrypt)));
            } catch (Exception e) {
                    System.err.println(e.getMessage());
            }
            return decryptedString;
    }	
}
