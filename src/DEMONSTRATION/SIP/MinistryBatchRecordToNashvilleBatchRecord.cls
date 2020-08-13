Class SIP.MinistryBatchRecordToNashvilleBatchRecord Extends Ens.DataTransformDTL [ DependsOn = (ASCN.Msg.RecMap.LFO5.Msg16.Record, SIP.NashvilleBatch.Record) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ASCN.Msg.RecMap.LFO5.Msg16.Record' targetClass='SIP.NashvilleBatch.Record' create='new' language='objectscript' >
<assign value='source.LastName' property='target.Name' action='set' />
<assign value='source.StreetAddress1' property='target.Address1' action='set' />
<assign value='source.StreetAddress2' property='target.Address2' action='set' />
<assign value='..Lookup("StateCrosswalk",source.State)' property='target.State' action='set' />
<assign value='source.Ministry' property='target.Ministry' action='set' />
</transform>
}

}
