Class Demo.WebService.SOAP.AllergyServiceSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{

Method GetAllergyByMRN(MRN As %String) As %String [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("GetAllergyByMRN").Invoke($this,"http://tempuri.org/Demo.WebService.SOAP.AllergyService.GetAllergyByMRN",.MRN)
}

/// This is the URL used to access the web service.
Parameter LOCATION = "http://localhost:52774/csp/healthshare/demonstration/Demo.WebService.SOAP.AllergyService.cls";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://tempuri.org";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "AllergyService";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

}
