<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2fb5f9f1-691e-4329-a1d7-31829ab577d6(import_from_json.properties)">
  <persistence version="9" />
  <languages>
    <use id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang" version="0" />
    <use id="01cf0d82-8d29-4fc4-be96-28abaf4ad33d" name="io.lionweb.mps.m3" version="0" />
  </languages>
  <imports>
    <import index="2pzz" ref="r:74e14b22-3b4a-45ce-940b-9bdca99c102f(io.lionweb.mps.m3.builtin)" implicit="true" />
  </imports>
  <registry>
    <language id="01cf0d82-8d29-4fc4-be96-28abaf4ad33d" name="io.lionweb.mps.m3">
      <concept id="7434462380790650845" name="io.lionweb.mps.m3.structure.NamespacedEntity" flags="ng" index="K99fS">
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
      <concept id="2656571587264863094" name="io.lionweb.mps.m3.structure.ConceptInterface" flags="ng" index="2RzPaY">
        <child id="2656571587264865653" name="extends" index="2RzQMX" />
      </concept>
      <concept id="2656571587264860434" name="io.lionweb.mps.m3.structure.FeaturesContainer" flags="ng" index="2RzPzq">
        <child id="2656571587264861371" name="features" index="2RzPPN" />
      </concept>
      <concept id="2656571587264861919" name="io.lionweb.mps.m3.structure.Concept" flags="ng" index="2RzPWn">
        <property id="2656571587264862414" name="abstract" index="2RzP46" />
        <reference id="2656571587264862780" name="extends" index="2RzPfO" />
      </concept>
      <concept id="2656571587264865491" name="io.lionweb.mps.m3.structure.ConceptInterfaceReference" flags="ng" index="2RzQOr">
        <reference id="2656571587264865492" name="conceptInterface" index="2RzQOs" />
      </concept>
      <concept id="2656571587264871634" name="io.lionweb.mps.m3.structure.LanguageReference" flags="ng" index="2RzRkq">
        <reference id="2656571587264871635" name="language" index="2RzRkr" />
      </concept>
      <concept id="2656571587264869411" name="io.lionweb.mps.m3.structure.Language" flags="ng" index="2RzRRF">
        <property id="2656571587264870352" name="key" index="2RzRSo" />
        <property id="2526956841135898600" name="version" index="3HH78N" />
        <child id="2656571587264870511" name="elements" index="2RzR6B" />
        <child id="2656571587264871163" name="dependsOn" index="2RzRcN" />
      </concept>
      <concept id="2656571587264872967" name="io.lionweb.mps.m3.structure.PrimitiveType" flags="ng" index="2RzSJf" />
    </language>
    <language id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang">
      <concept id="630989536496859751" name="io.lionweb.mps.converter.lang.structure.ImportLanguageFromJson" flags="ng" index="3z8Sf4">
        <property id="630989536496861420" name="path" index="3z8Z_f" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="3z8Sf4" id="41GYAKu44_J">
    <property role="TrG5h" value="Import Properties Metamodel from JSON" />
    <property role="3z8Z_f" value="${lionweb.mpsmeetup2023.home}/properties.lmm.json" />
  </node>
  <node concept="3z8Sf4" id="4Vn6yFagKMG">
    <property role="TrG5h" value="Import Combined Metamodel from JSON" />
    <property role="3z8Z_f" value="${lionweb.mpsmeetup2023.home}/properties-parser/examples/combined.lmm.json" />
  </node>
  <node concept="2RzRRF" id="6A8ORcnFJA_">
    <property role="2RzRSo" value="com_strumenta_StarLasu" />
    <property role="TrG5h" value="com.strumenta.StarLasu" />
    <property role="3HH78N" value="1" />
    <node concept="2RzPWn" id="6A8ORcnFJAA" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="StarLasu-ASTNode" />
      <property role="TrG5h" value="ASTNode" />
    </node>
    <node concept="2RzPWn" id="6A8ORcnFJAB" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="StarLasu-GenericErrorNode" />
      <property role="TrG5h" value="GenericErrorNode" />
    </node>
    <node concept="2RzPaY" id="6A8ORcnFJAC" role="2RzR6B">
      <property role="2RzON1" value="StarLasu-Named" />
      <property role="TrG5h" value="Named" />
      <node concept="2RzQOr" id="6A8ORcnFJAX" role="2RzQMX">
        <ref role="2RzQOs" node="6A8ORcnFJAD" resolve="PossiblyNamed" />
      </node>
    </node>
    <node concept="2RzPaY" id="6A8ORcnFJAD" role="2RzR6B">
      <property role="2RzON1" value="StarLasu-PossiblyNamed" />
      <property role="TrG5h" value="PossiblyNamed" />
      <node concept="2RzOeU" id="6A8ORcnFJAE" role="2RzPPN">
        <property role="2RzON1" value="StarLasu-PossiblyNamed-name" />
        <property role="TrG5h" value="name" />
        <property role="2RzO1C" value="true" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
    </node>
    <node concept="2RzSJf" id="6A8ORcnFJAF" role="2RzR6B">
      <property role="2RzON1" value="StarLasu-Position" />
      <property role="TrG5h" value="Position" />
    </node>
    <node concept="2RzSJf" id="6A8ORcnFJAG" role="2RzR6B">
      <property role="2RzON1" value="StarLasu-Char" />
      <property role="TrG5h" value="Char" />
    </node>
  </node>
  <node concept="2RzRRF" id="6A8ORcnFJAH">
    <property role="2RzRSo" value="io_lionweb_Properties" />
    <property role="TrG5h" value="io.lionweb.Properties" />
    <property role="3HH78N" value="1" />
    <node concept="2RzPWn" id="6A8ORcnFJAI" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-PropertiesFile" />
      <property role="TrG5h" value="PropertiesFile" />
      <ref role="2RzPfO" node="6A8ORcnFJAA" resolve="ASTNode" />
      <node concept="2RzOte" id="6A8ORcnFJAJ" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-PropertiesFile-props" />
        <property role="TrG5h" value="props" />
        <property role="2RzO1C" value="false" />
        <property role="2RzOhW" value="true" />
        <ref role="2RzQvY" node="6A8ORcnFJAK" resolve="Property" />
      </node>
    </node>
    <node concept="2RzPWn" id="6A8ORcnFJAK" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-Property" />
      <property role="TrG5h" value="Property" />
      <ref role="2RzPfO" node="6A8ORcnFJAA" resolve="ASTNode" />
      <node concept="2RzOeU" id="6A8ORcnFJAL" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-Property-name" />
        <property role="TrG5h" value="name" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
      <node concept="2RzOte" id="6A8ORcnFJAM" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-Property-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <property role="2RzOhW" value="false" />
        <ref role="2RzQvY" node="6A8ORcnFJAN" resolve="Value" />
      </node>
    </node>
    <node concept="2RzPWn" id="6A8ORcnFJAN" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-Value" />
      <property role="TrG5h" value="Value" />
      <ref role="2RzPfO" node="6A8ORcnFJAA" resolve="ASTNode" />
    </node>
    <node concept="2RzPWn" id="6A8ORcnFJAO" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-BooleanValue" />
      <property role="TrG5h" value="BooleanValue" />
      <ref role="2RzPfO" node="6A8ORcnFJAN" resolve="Value" />
      <node concept="2RzOeU" id="6A8ORcnFJAP" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-BooleanValue-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJk2" resolve="Boolean" />
      </node>
    </node>
    <node concept="2RzPWn" id="6A8ORcnFJAQ" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-DecValue" />
      <property role="TrG5h" value="DecValue" />
      <ref role="2RzPfO" node="6A8ORcnFJAN" resolve="Value" />
      <node concept="2RzOeU" id="6A8ORcnFJAR" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-DecValue-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
    </node>
    <node concept="2RzPWn" id="6A8ORcnFJAS" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-IntValue" />
      <property role="TrG5h" value="IntValue" />
      <ref role="2RzPfO" node="6A8ORcnFJAN" resolve="Value" />
      <node concept="2RzOeU" id="6A8ORcnFJAT" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-IntValue-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
    </node>
    <node concept="2RzPWn" id="6A8ORcnFJAU" role="2RzR6B">
      <property role="2RzP46" value="false" />
      <property role="2RzON1" value="io_lionweb_Properties-StringValue" />
      <property role="TrG5h" value="StringValue" />
      <ref role="2RzPfO" node="6A8ORcnFJAN" resolve="Value" />
      <node concept="2RzOeU" id="6A8ORcnFJAV" role="2RzPPN">
        <property role="2RzON1" value="io_lionweb_Properties-StringValue-value" />
        <property role="TrG5h" value="value" />
        <property role="2RzO1C" value="false" />
        <ref role="2Rx9Fl" to="2pzz:2ju2syjnJjX" resolve="String" />
      </node>
    </node>
    <node concept="2RzRkq" id="6A8ORcnFJAW" role="2RzRcN">
      <ref role="2RzRkr" node="6A8ORcnFJA_" resolve="com.strumenta.StarLasu" />
    </node>
  </node>
</model>

