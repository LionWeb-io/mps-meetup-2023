<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2fb5f9f1-691e-4329-a1d7-31829ab577d6(import_from_json.properties)">
  <persistence version="9" />
  <attribute name="doNotGenerate" value="false" />
  <languages>
    <use id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang" version="0" />
    <use id="01cf0d82-8d29-4fc4-be96-28abaf4ad33d" name="io.lionweb.mps.m3" version="0" />
    <use id="28832bdf-0e25-363c-b286-c7457d9f9c90" name="io.lionweb.PROPS" version="1" />
  </languages>
  <imports>
    <import index="qqc7" ref="r:5dda8fb0-8c78-4ed5-8c46-0eb8c112a60a(import_from_json.properties.instance)" />
    <import index="2pzz" ref="r:74e14b22-3b4a-45ce-940b-9bdca99c102f(io.lionweb.mps.m3.builtin)" implicit="true" />
  </imports>
  <registry>
    <language id="01cf0d82-8d29-4fc4-be96-28abaf4ad33d" name="io.lionweb.mps.m3">
      <concept id="7434462380790650845" name="io.lionweb.mps.m3.structure.IKeyed" flags="ng" index="K99fS">
        <property id="2656571587264857353" name="key" index="2RzON1" />
      </concept>
      <concept id="2656571587264859051" name="io.lionweb.mps.m3.structure.Link" flags="ng" index="2RzO9z">
        <property id="2656571587264859572" name="multiple" index="2RzOhW" />
        <reference id="2656571587264867894" name="type" index="2RzQvY" />
      </concept>
      <concept id="2656571587264858738" name="io.lionweb.mps.m3.structure.Property" flags="ng" index="2RzOeU">
        <reference id="2656571587265467165" name="type" index="2Rx9Fl" />
      </concept>
      <concept id="2656571587264859782" name="io.lionweb.mps.m3.structure.Containment" flags="ng" index="2RzOte" />
      <concept id="2656571587264858085" name="io.lionweb.mps.m3.structure.Feature" flags="ng" index="2RzOSH">
        <property id="2656571587264858528" name="optional" index="2RzO1C" />
      </concept>
      <concept id="2656571587264863094" name="io.lionweb.mps.m3.structure.Interface" flags="ng" index="2RzPaY">
        <child id="2656571587264865653" name="extends" index="2RzQMX" />
      </concept>
      <concept id="2656571587264860434" name="io.lionweb.mps.m3.structure.Classifier" flags="ng" index="2RzPzq">
        <child id="2656571587264861371" name="features" index="2RzPPN" />
      </concept>
      <concept id="2656571587264861919" name="io.lionweb.mps.m3.structure.Concept" flags="ng" index="2RzPWn">
        <property id="2656571587264862414" name="abstract" index="2RzP46" />
        <property id="6461713321117308474" name="partition" index="3KdWwX" />
        <reference id="2656571587264862780" name="extends" index="2RzPfO" />
        <child id="2656571587264866539" name="implements" index="2RzQ4z" />
      </concept>
      <concept id="2656571587264865491" name="io.lionweb.mps.m3.structure.InterfaceReference" flags="ng" index="2RzQOr">
        <reference id="2656571587264865492" name="interface" index="2RzQOs" />
      </concept>
      <concept id="2656571587264871634" name="io.lionweb.mps.m3.structure.LanguageReference" flags="ng" index="2RzRkq">
        <reference id="2656571587264871635" name="language" index="2RzRkr" />
      </concept>
      <concept id="2656571587264869411" name="io.lionweb.mps.m3.structure.Language" flags="ng" index="2RzRRF">
        <property id="2526956841135898600" name="version" index="3HH78N" />
        <child id="2656571587264870511" name="entities" index="2RzR6B" />
      </concept>
      <concept id="2656571587264872967" name="io.lionweb.mps.m3.structure.PrimitiveType" flags="ng" index="2RzSJf" />
    </language>
    <language id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang">
      <concept id="3631234780355719700" name="io.lionweb.mps.converter.lang.structure.NodeRef" flags="ng" index="pgsVv">
        <reference id="3631234780355720143" name="target" index="pgsW4" />
      </concept>
      <concept id="3631234780355716573" name="io.lionweb.mps.converter.lang.structure.ExportInstanceToJson" flags="ng" index="pgt$m">
        <property id="3631234780355961878" name="scope" index="pjpzt" />
        <child id="3631234780355719074" name="instances" index="pgtdD" />
      </concept>
      <concept id="8551466651976017244" name="io.lionweb.mps.converter.lang.structure.ILanguageReferenceContainer" flags="ng" index="2P3sN0">
        <child id="755186209566487256" name="languages" index="1a0gs3" />
      </concept>
      <concept id="8551466651976015093" name="io.lionweb.mps.converter.lang.structure.ExportLanguageToJson" flags="ng" index="2P3vlD" />
      <concept id="5028875375328515023" name="io.lionweb.mps.converter.lang.structure.ImportInstanceFromJson" flags="ng" index="VS7hd" />
      <concept id="5028875375328515028" name="io.lionweb.mps.converter.lang.structure.APathConverter" flags="ng" index="VS7hm">
        <property id="5028875375328515031" name="path" index="VS7hl" />
      </concept>
      <concept id="755186209566485507" name="io.lionweb.mps.converter.lang.structure.ConvertLanguageFromLionCore" flags="ng" index="1a0hBo" />
      <concept id="630989536496859751" name="io.lionweb.mps.converter.lang.structure.ImportLanguageFromJson" flags="ng" index="3z8Sf4" />
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="28832bdf-0e25-363c-b286-c7457d9f9c90" name="io.lionweb.PROPS">
      <concept id="-5251757909129240856" name="io.lionweb.PROPS.structure.IntValue" flags="ng" index="37HND">
        <property id="-1164810965792278352" name="value" index="3QFnCD" />
      </concept>
      <concept id="3610585688048632058" name="io.lionweb.PROPS.structure.BooleanValue" flags="ng" index="259e1R">
        <property id="7452053177660046254" name="value" index="22P7_f" />
      </concept>
      <concept id="9045300450722131192" name="io.lionweb.PROPS.structure.Property" flags="ng" index="26vB0H">
        <child id="-4949124439403577779" name="value" index="3Vt1f6" />
      </concept>
      <concept id="4516078350026690430" name="io.lionweb.PROPS.structure.PropertiesFile" flags="ng" index="Tw1CF">
        <child id="-3883340165466824873" name="props" index="1Pj4nA" />
      </concept>
      <concept id="-8119058232078444791" name="io.lionweb.PROPS.structure.StringValue" flags="ng" index="1T4Ty4">
        <property id="-5457643573714526488" name="value" index="1ijX3X" />
      </concept>
    </language>
  </registry>
  <node concept="3z8Sf4" id="41GYAKu44_J">
    <property role="TrG5h" value="1b. Import Properties Metamodel from JSON" />
    <property role="VS7hl" value="${lionweb.property-demo.home}/properties-parser/examples/properties.lmm.json" />
    <property role="3GE5qa" value="converter" />
  </node>
  <node concept="3z8Sf4" id="4Vn6yFagKMG">
    <property role="TrG5h" value="1. Import Combined Metamodel from JSON" />
    <property role="VS7hl" value="${lionweb.property-demo.home}/properties-parser/examples/combined.lmm.json" />
    <property role="3GE5qa" value="converter" />
  </node>
  <node concept="1a0hBo" id="1apSfP9LYiA">
    <property role="TrG5h" value="2. Convert Properties M3 to MPS" />
    <property role="3GE5qa" value="converter" />
    <node concept="2RzRkq" id="1apSfP9LYiH" role="1a0gs3">
      <ref role="2RzRkr" node="3TCs_NvwxvG" resolve="com.strumenta.StarLasu" />
    </node>
    <node concept="2RzRkq" id="1apSfP9LYiD" role="1a0gs3">
      <ref role="2RzRkr" node="3TCs_NvwxvO" resolve="io_lionweb_Properties" />
    </node>
  </node>
  <node concept="VS7hd" id="3LWE6BDzNr5">
    <property role="TrG5h" value="3. Import Properties Instance from JSON" />
    <property role="VS7hl" value="${lionweb.property-demo.home}/properties-parser/examples/example1.lm.json" />
    <property role="3GE5qa" value="converter" />
  </node>
  <node concept="3z8Sf4" id="7ReUsn7GpJ7">
    <property role="TrG5h" value="1a. Import StarLasu Metamodel from JSON" />
    <property role="VS7hl" value="${lionweb.property-demo.home}/properties-parser/examples/starlasu.lmm.json" />
    <property role="3GE5qa" value="converter" />
  </node>
  <node concept="pgt$m" id="599fWZqf7zh">
    <property role="3GE5qa" value="converter" />
    <property role="TrG5h" value="4. Export Properties Instance to JSON" />
    <property role="VS7hl" value="${lionweb.property-demo.home}/properties-parser/example1-exported.lm.json" />
    <property role="pjpzt" value="39$JcGFaino/closure" />
    <node concept="pgsVv" id="3TCs_NvwG5A" role="pgtdD">
      <ref role="pgsW4" to="qqc7:~file_properties-parser-examples-example1-props-" resolve="PropertyRoot.props" />
    </node>
  </node>
  <node concept="2RzRRF" id="3TCs_NvwxvG">
    <property role="TrG5h" value="com.strumenta.StarLasu" />
    <property role="3HH78N" value="1" />
    <property role="2RzON1" value="com_strumenta_StarLasu" />
    <node concept="2RzPWn" id="3TCs_NvwxvH" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="StarLasu-ASTNode" />
      <property role="TrG5h" value="ASTNode" />
    </node>
    <node concept="2RzPWn" id="3TCs_NvwxvI" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="StarLasu-GenericErrorNode" />
      <property role="TrG5h" value="GenericErrorNode" />
    </node>
    <node concept="2RzPaY" id="3TCs_NvwxvJ" role="2RzR6B">
      <property role="2RzON1" value="StarLasu-Named" />
      <property role="TrG5h" value="Named" />
      <node concept="2RzQOr" id="3TCs_Nvwxw4" role="2RzQMX">
        <ref role="2RzQOs" node="3TCs_NvwxvK" resolve="PossiblyNamed" />
      </node>
    </node>
    <node concept="2RzPaY" id="3TCs_NvwxvK" role="2RzR6B">
      <property role="2RzON1" value="StarLasu-PossiblyNamed" />
      <property role="TrG5h" value="PossiblyNamed" />
      <node concept="2RzOeU" id="3TCs_NvwxvL" role="2RzPPN">
        <property role="2RzON1" value="StarLasu-PossiblyNamed-name" />
        <property role="TrG5h" value="name" />
        <property role="2RzO1C" value="true" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
    </node>
    <node concept="2RzSJf" id="3TCs_NvwxvM" role="2RzR6B">
      <property role="2RzON1" value="StarLasu-Position" />
      <property role="TrG5h" value="Position" />
    </node>
    <node concept="2RzSJf" id="3TCs_NvwxvN" role="2RzR6B">
      <property role="2RzON1" value="StarLasu-Char" />
      <property role="TrG5h" value="Char" />
    </node>
  </node>
  <node concept="2RzRRF" id="3TCs_NvwxvO">
    <property role="TrG5h" value="io_lionweb_Properties" />
    <property role="3HH78N" value="1" />
    <property role="2RzON1" value="io_lionweb_Properties" />
    <node concept="2RzPWn" id="3TCs_NvwxvP" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-PropertiesFile" />
      <property role="TrG5h" value="PropertiesFile" />
      <property role="3KdWwX" value="true" />
      <node concept="2RzOte" id="3TCs_NvwxvQ" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-PropertiesFile-props" />
        <property role="TrG5h" value="props" />
        <property role="2RzO1C" value="false" />
        <property role="2RzOhW" value="true" />
        <ref role="2RzQvY" node="3TCs_NvwxvR" resolve="Property" />
      </node>
    </node>
    <node concept="2RzPWn" id="3TCs_NvwxvR" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-Property" />
      <property role="TrG5h" value="Property" />
      <node concept="2RzOte" id="3TCs_NvwxvT" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-Property-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <property role="2RzOhW" value="true" />
        <ref role="2RzQvY" node="3TCs_NvwxvU" resolve="Value" />
      </node>
      <node concept="2RzQOr" id="6Sgmz$5wtHM" role="2RzQ4z">
        <ref role="2RzQOs" to="2pzz:6jTTMHCZNUU" resolve="INamed" />
      </node>
    </node>
    <node concept="2RzPWn" id="3TCs_NvwxvU" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-Value" />
      <property role="TrG5h" value="Value" />
    </node>
    <node concept="2RzPWn" id="3TCs_NvwxvV" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-BooleanValue" />
      <property role="TrG5h" value="BooleanValue" />
      <ref role="2RzPfO" node="3TCs_NvwxvU" resolve="Value" />
      <node concept="2RzOeU" id="3TCs_NvwxvW" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-BooleanValue-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJk2" resolve="Boolean" />
      </node>
    </node>
    <node concept="2RzPWn" id="3TCs_NvwxvX" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-DecValue" />
      <property role="TrG5h" value="DecValue" />
      <ref role="2RzPfO" node="3TCs_NvwxvU" resolve="Value" />
      <node concept="2RzOeU" id="3TCs_NvwxvY" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-DecValue-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
    </node>
    <node concept="2RzPWn" id="3TCs_NvwxvZ" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-IntValue" />
      <property role="TrG5h" value="IntValue" />
      <ref role="2RzPfO" node="3TCs_NvwxvU" resolve="Value" />
      <node concept="2RzOeU" id="3TCs_Nvwxw0" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-IntValue-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
    </node>
    <node concept="2RzPWn" id="3TCs_Nvwxw1" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-StringValue" />
      <property role="TrG5h" value="StringValue" />
      <ref role="2RzPfO" node="3TCs_NvwxvU" resolve="Value" />
      <node concept="2RzOeU" id="3TCs_Nvwxw2" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-StringValue-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
    </node>
  </node>
  <node concept="2P3vlD" id="6Sgmz$5w98B">
    <property role="3GE5qa" value="converter" />
    <property role="TrG5h" value="Export Properties Language to JSON" />
    <property role="VS7hl" value="${lionweb.property-demo.home}/properties-parser/properties.lmm.json" />
    <node concept="2RzRkq" id="6Sgmz$5w98E" role="1a0gs3">
      <ref role="2RzRkr" node="3TCs_NvwxvO" resolve="io_lionweb_Properties" />
    </node>
  </node>
  <node concept="VS7hd" id="rD9LMcUq4J">
    <property role="TrG5h" value="Import example1.lm.json" />
    <property role="VS7hl" value="${lionweb.property-demo.home}/properties-parser/examples/example1.lm.json" />
  </node>
  <node concept="Tw1CF" id="~file_properties-parser\examples\example1-props_root">
    <property role="TrG5h" value="example1.props" />
    <node concept="26vB0H" id="~file_properties-parser\examples\example1-props_root_props_0" role="1Pj4nA">
      <property role="TrG5h" value="integerProp" />
      <node concept="37HND" id="~file_properties-parser\examples\example1-props_root_props_0_value" role="3Vt1f6">
        <property role="3QFnCD" value="1" />
      </node>
    </node>
    <node concept="26vB0H" id="~file_properties-parser\examples\example1-props_root_props_1" role="1Pj4nA">
      <property role="TrG5h" value="LIonWeb_integrates" />
      <node concept="259e1R" id="~file_properties-parser\examples\example1-props_root_props_1_value" role="3Vt1f6">
        <property role="22P7_f" value="true" />
      </node>
    </node>
    <node concept="26vB0H" id="~file_properties-parser\examples\example1-props_root_props_2" role="1Pj4nA">
      <property role="TrG5h" value="myString" />
      <node concept="1T4Ty4" id="~file_properties-parser\examples\example1-props_root_props_2_value" role="3Vt1f6">
        <property role="1ijX3X" value="Hello, StarLasu, MPS, and Freon!" />
      </node>
    </node>
  </node>
</model>

