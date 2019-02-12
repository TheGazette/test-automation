//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2017.09.21 at 01:18:52 PM BST 
//


package cucumber.suite.model;

import java.math.BigInteger;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the cucumber.suite.model package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _TotalNoticesInPdf_QNAME = new QName("", "totalNoticesInPdf");
    private final static QName _TotalTime_QNAME = new QName("", "totalTime");
    private final static QName _TotalNotices_QNAME = new QName("", "totalNotices");
    private final static QName _PrintPdfLocation_QNAME = new QName("", "printPdfLocation");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: cucumber.suite.model
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link PrintPdfResponse }
     * 
     */
    public PrintPdfResponse createPrintPdfResponse() {
        return new PrintPdfResponse();
    }

    /**
     * Create an instance of {@link MissingNotices }
     * 
     */
    public MissingNotices createMissingNotices() {
        return new MissingNotices();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BigInteger }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "totalNoticesInPdf")
    public JAXBElement<BigInteger> createTotalNoticesInPdf(BigInteger value) {
        return new JAXBElement<BigInteger>(_TotalNoticesInPdf_QNAME, BigInteger.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BigInteger }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "totalTime")
    public JAXBElement<BigInteger> createTotalTime(BigInteger value) {
        return new JAXBElement<BigInteger>(_TotalTime_QNAME, BigInteger.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BigInteger }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "totalNotices")
    public JAXBElement<BigInteger> createTotalNotices(BigInteger value) {
        return new JAXBElement<BigInteger>(_TotalNotices_QNAME, BigInteger.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "printPdfLocation")
    public JAXBElement<String> createPrintPdfLocation(String value) {
        return new JAXBElement<String>(_PrintPdfLocation_QNAME, String.class, null, value);
    }

}
