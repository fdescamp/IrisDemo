Class iKnow.DataExtractor Extends Ens.Rule.FunctionSet
{

/// This sample custom function leverages the iKnow and Text Analytics capabilities
/// of Health Connect to take in a string of unstructured data as well as a value such as "Ejection Fraction"
/// or "HER2".  If there is unstructured data related to the value, the function will return as discrete data
/// the value for that data element that was found in the unstructured data.
ClassMethod ExtractDataFromUnstructured(pUnstructuredData As %String, pValueToExtract As %String) As %String
{
	k o
	set o = ""
	set output = "No Data Found"
	do ##class(EF.Extractor).ExtractFromText(pUnstructuredData,.o)
	if o '= "" {
		set output = $LISTGET(o(1),1)
	}
	quit output
}

}
