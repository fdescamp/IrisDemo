Class SIP.Custom.GetFirstMinistryCode Extends Ens.Rule.FunctionSet
{

ClassMethod GetFirstMinistryCode(doc As ASCN.Msg.RecMap.LFO5.Batch.Msg16) As %String
{
	quit doc.Records.GetAt(1).Ministry
}

}
