package cucumber.suite.glue;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import cucumber.suite.model.PrintPdfResponse;

import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * @author msh
 *
 */
public class HttpClient {

    /**
     * @param request
     * @return
     * @throws Exception
     */
    public PrintPdfResponse doPUT(String request, String quartzUrl) throws Exception {
    	URL url = new URL(quartzUrl);
    	HttpURLConnection httpCon = (HttpURLConnection) url.openConnection();
    	httpCon.setDoOutput(true);
    	httpCon.setRequestMethod("PUT");
    	httpCon.setRequestProperty("Content-Type", "application/xml");

    	OutputStreamWriter out = new OutputStreamWriter(
    	    httpCon.getOutputStream());
    	out.write(request);
    	out.close();	

        XmlMapper xmlMapper = new XmlMapper();
        PrintPdfResponse printPdfResponse = xmlMapper.readValue(httpCon.getInputStream(), PrintPdfResponse.class);
        httpCon.disconnect();
        return printPdfResponse;
    }
    
   
}