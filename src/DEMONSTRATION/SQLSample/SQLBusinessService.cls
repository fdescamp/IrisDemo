Class SQLSample.SQLBusinessService Extends Ens.BusinessService [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, pOutput As %RegisteredObject) As %Status
{
 set req=##class(SQLSample.SQLSampleMessage).%New()
 set req.Name=pInput.Get("Name")
 set req.Address=pInput.Get("Address")
 set req.Address2=pInput.Get("Address2")
 set req.City=pInput.Get("City")
 set req.State=pInput.Get("State")
 set req.Zip=pInput.Get("Zip")
 set sc=..SendRequestAsync("MsgRouter",req)

 quit sc

	Quit 1
}

}
