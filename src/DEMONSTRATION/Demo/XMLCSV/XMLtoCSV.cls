Class Demo.XMLCSV.XMLtoCSV Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.EDI.XML.Document, User.PatientCSV.Record) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.EDI.XML.Document' targetClass='User.PatientCSV.Record' sourceDocType='Patients:Patients' create='new' language='objectscript' >
<foreach property='source.{Patient()}' key='k1' >
<assign value='source.{Patient(k1).Prénom}' property='target.Prénom' action='set' />
<assign value='source.{Patient(k1).Nom}' property='target.Nom' action='set' />
<assign value='source.{Patient(k1).Prénom}' property='target.Prénom' action='append' />
<assign value='source.{Patient(k1).DateDeNaissance}' property='target.DateDeNaissance' action='set' />
<assign value='source.{Patient(k1).Sexe}' property='target.Sexe' action='set' />
<assign value='source.{Patient(k1).Adresse.Rue}' property='target.Rue' action='set' />
<assign value='source.{Patient(k1).Adresse.Ville}' property='target.Ville' action='set' />
</foreach>
</transform>
}

}
