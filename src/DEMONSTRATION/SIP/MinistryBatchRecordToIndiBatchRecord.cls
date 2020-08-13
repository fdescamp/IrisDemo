Class SIP.MinistryBatchRecordToIndiBatchRecord Extends Ens.DataTransformDTL [ DependsOn = (ASCN.Msg.RecMap.LFO5.Msg16.Record, SIP.IndianapolisBatch.Record) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ASCN.Msg.RecMap.LFO5.Msg16.Record' targetClass='SIP.IndianapolisBatch.Record' create='new' language='objectscript' >
<assign value='source.FirstName_" "_source.LastName' property='target.NAME' action='set' />
<assign value='source.StreetAddress1' property='target.Address1' action='set' />
<assign value='source.StreetAddress2' property='target.Address2' action='set' />
<assign value='source.City' property='target.City' action='set' />
<assign value='source.MsgID' property='target.MRN' action='set' />
</transform>
}

}
