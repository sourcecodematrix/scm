import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;

public class FCM {

	// Method to send Notifications from server to client end.
	public final static String SERVER_KEY_FCM = "AAAA7HCxxGg:APA91bHzEfzhHaJch9PIxADOSfacFwtkm0hMWY8LW3L1voHPbrInhhuSqKDXRnsVzDT3Yy5TlVKdDWSGQ5iXGMo11Ub7yIXfg71vOTN2hKuwJe5AUvkPWTgd9-KYfk5gSD1h4n7ij4hi";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		pushFCMNotification(
				"d0QZ7u656W0:APA91bEPy5vZJPByrFUmjo-tDRlXDOALE2l06SiZAnc6Bm0UYX1I6wvnSsxbWOSo2h53f7Vva_iVU9uJs6PKc_tHhZyFcZC03gkzK_2ssY6aGGCDXvtrIpTmo1883EnC33nCeSTJr1L7");
	
	}

	public static void pushFCMNotification(String DeviceIdKey) throws Exception {

		URL url = new URL(API_URL_FCM);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "key=" + SERVER_KEY_FCM);
		conn.setRequestProperty("Content-Type", "application/json");
		JSONObject data = new JSONObject();
		data.put("to", DeviceIdKey.trim());
		JSONObject info = new JSONObject();
		info.put("title", "This test message from java"); // Notification title
		info.put("body", "Hello First Test notification"); // Notification body
		data.put("notification", info);
		System.out.println(data.toJSONString());
		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		wr.write(data.toString());
		wr.flush();
		wr.close();
		int responseCode = conn.getResponseCode();
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

	}

	
}
