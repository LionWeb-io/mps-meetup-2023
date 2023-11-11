<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:5d0bf864-ad8e-487e-9a12-36abdfcf2e40(io.lionweb.Properties.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="9" />
    <use id="411e5b27-8a76-482e-8af8-1704262b4468" name="io.lionweb.mps.structure.attribute" version="0" />
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="4628067390765956802" name="abstract" index="R5$K7" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
        <child id="1169129564478" name="implements" index="PzmwI" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <property id="241647608299431140" name="linkId" index="IQ2ns" />
        <reference id="1071599976176" name="target" index="20lvS9" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="411e5b27-8a76-482e-8af8-1704262b4468" name="io.lionweb.mps.structure.attribute">
      <concept id="7205279169712116346" name="io.lionweb.mps.structure.attribute.structure.LionWebLanguageKey" flags="ng" index="2DM1_0" />
      <concept id="7205279169712116353" name="io.lionweb.mps.structure.attribute.structure.ILionWebKey" flags="ng" index="2DM1AV">
        <property id="7205279169712116354" name="key" index="2DM1AS" />
      </concept>
      <concept id="7205279169712116358" name="io.lionweb.mps.structure.attribute.structure.LionWebEntityKey" flags="ng" index="2DM1AW" />
      <concept id="6461713321120959620" name="io.lionweb.mps.structure.attribute.structure.LionWebPartitionConcept" flags="ng" index="3KvTa3">
        <property id="6461713321120959627" name="partition" index="3KvTac" />
      </concept>
    </language>
  </registry>
  <node concept="2DM1_0" id="6LPMcPcmvOr">
    <property role="2DM1AS" value="io-lionweb-Properties" />
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvNX">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="PropertiesFile" />
    <property role="EcuMT" value="4516078350026690430" />
    <property role="19KtqR" value="true" />
    <property role="34LRSv" value="Properties File" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="2DM1AW" id="6LPMcPcmvNY" role="lGtFl">
      <property role="2DM1AS" value="io-lionweb-Properties_PropertiesFile" />
    </node>
    <node concept="1TJgyj" id="6LPMcPcmvNZ" role="1TKVEi">
      <property role="20kJfa" value="props" />
      <property role="IQ2ns" value="-3883340165466824873" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj6/_1__n" />
      <ref role="20lvS9" node="6LPMcPcmvO1" resolve="Property" />
      <node concept="2DM1AW" id="6LPMcPcmvO0" role="lGtFl">
        <property role="2DM1AS" value="io-lionweb-Properties_PropertiesFile_props" />
      </node>
    </node>
    <node concept="3KvTa3" id="6Sgmz$5w8RH" role="lGtFl">
      <property role="3KvTac" value="true" />
    </node>
    <node concept="PrWs8" id="rD9LMcTEeQ" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvO1">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="Property" />
    <property role="EcuMT" value="9045300450722131192" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="2DM1AW" id="6LPMcPcmvO2" role="lGtFl">
      <property role="2DM1AS" value="io-lionweb-Properties_Property" />
    </node>
    <node concept="1TJgyj" id="6LPMcPcmvO5" role="1TKVEi">
      <property role="20kJfa" value="value" />
      <property role="IQ2ns" value="-4949124439403577779" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="6LPMcPcmvO7" resolve="Value" />
      <node concept="2DM1AW" id="6LPMcPcmvO6" role="lGtFl">
        <property role="2DM1AS" value="io-lionweb-Properties_Property_value" />
      </node>
    </node>
    <node concept="PrWs8" id="6Sgmz$5w8Sa" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvO7">
    <property role="R5$K7" value="true" />
    <property role="TrG5h" value="Value" />
    <property role="EcuMT" value="-5637181171957891234" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="2DM1AW" id="6LPMcPcmvO8" role="lGtFl">
      <property role="2DM1AS" value="io-lionweb-Properties_Value" />
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvO9">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="BooleanValue" />
    <property role="EcuMT" value="3610585688048632058" />
    <property role="34LRSv" value="boolean" />
    <ref role="1TJDcQ" node="6LPMcPcmvO7" resolve="Value" />
    <node concept="2DM1AW" id="6LPMcPcmvOa" role="lGtFl">
      <property role="2DM1AS" value="io-lionweb-Properties_BooleanValue" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvOb" role="1TKVEl">
      <property role="TrG5h" value="value" />
      <property role="IQ2nx" value="7452053177660046254" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
      <node concept="2DM1AW" id="6LPMcPcmvOc" role="lGtFl">
        <property role="2DM1AS" value="io-lionweb-Properties_BooleanValue_value" />
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvOd">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="DecValue" />
    <property role="EcuMT" value="-8690975471803852252" />
    <property role="34LRSv" value="decimal" />
    <ref role="1TJDcQ" node="6LPMcPcmvO7" resolve="Value" />
    <node concept="2DM1AW" id="6LPMcPcmvOe" role="lGtFl">
      <property role="2DM1AS" value="io-lionweb-Properties_DecValue" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvOf" role="1TKVEl">
      <property role="TrG5h" value="value" />
      <property role="IQ2nx" value="3857521133551189989" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
      <node concept="2DM1AW" id="6LPMcPcmvOg" role="lGtFl">
        <property role="2DM1AS" value="io-lionweb-Properties_DecValue_value" />
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvOh">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="IntValue" />
    <property role="EcuMT" value="-5251757909129240856" />
    <property role="34LRSv" value="integer" />
    <ref role="1TJDcQ" node="6LPMcPcmvO7" resolve="Value" />
    <node concept="2DM1AW" id="6LPMcPcmvOi" role="lGtFl">
      <property role="2DM1AS" value="io-lionweb-Properties_IntValue" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvOj" role="1TKVEl">
      <property role="TrG5h" value="value" />
      <property role="IQ2nx" value="-1164810965792278352" />
      <ref role="AX2Wp" to="tpck:fKAQMTA" resolve="integer" />
      <node concept="2DM1AW" id="6LPMcPcmvOk" role="lGtFl">
        <property role="2DM1AS" value="io-lionweb-Properties_IntValue_value" />
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvOl">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="StringValue" />
    <property role="EcuMT" value="-8119058232078444791" />
    <property role="34LRSv" value="string" />
    <ref role="1TJDcQ" node="6LPMcPcmvO7" resolve="Value" />
    <node concept="2DM1AW" id="6LPMcPcmvOm" role="lGtFl">
      <property role="2DM1AS" value="io-lionweb-Properties_StringValue" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvOn" role="1TKVEl">
      <property role="TrG5h" value="value" />
      <property role="IQ2nx" value="-5457643573714526488" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
      <node concept="2DM1AW" id="6LPMcPcmvOo" role="lGtFl">
        <property role="2DM1AS" value="io-lionweb-Properties_StringValue_value" />
      </node>
    </node>
  </node>
</model>

