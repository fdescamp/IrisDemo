Class Toto.too Extends %Persistent
{

Property toto As %String;

Property titi As %String;

Storage Default
{
<Data name="tooDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>toto</Value>
</Value>
<Value name="3">
<Value>titi</Value>
</Value>
</Data>
<DataLocation>^Toto.tooD</DataLocation>
<DefaultData>tooDefaultData</DefaultData>
<IdLocation>^Toto.tooD</IdLocation>
<IndexLocation>^Toto.tooI</IndexLocation>
<StreamLocation>^Toto.tooS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
