Class Demo.WebService.SOAP.AllergyService Extends %SOAP.WebService
{

/// Name of the WebService.
Parameter SERVICENAME = "AllergyService";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "http://tempuri.org";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

/// This method returns tomorrow's price for the requested stock
Method GetAllergyByMRN(MRN As %String) As %String [ WebMethod ]
{

    Quit "penicilline,chocolat"
}

}
