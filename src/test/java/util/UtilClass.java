package util;

import java.util.UUID;

public class UtilClass {

    public static String generacionemailUnico(String usuario) {
        return usuario.replaceAll("[^a-zA-Z0-9]", "").toLowerCase() + UUID.randomUUID().toString().substring(0, 8) + "@qa.com";
    }
}
