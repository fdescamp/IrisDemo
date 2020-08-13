Class Nemours.EpicADTtoRadiology Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NemoursADT:ADT_A01' targetDocType='NemoursADT:ADT_A01' create='copy' language='objectscript' >
<assign value='"^NET^Internet^"_..Piece(source.{PID:PhoneNumberHome(2)},"^",4,4)' property='target.{PID:PhoneNumberHome(2)}' action='set' />
</transform>
}

}
