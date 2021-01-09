package com.stressthem.app.services.interfaces;

import java.io.IOException;
import java.net.URISyntaxException;

public interface ServerConnection {

    void sendRequest(String targetIp, String targetPort, int time, String method, String token) throws URISyntaxException, IOException, InterruptedException;
}
