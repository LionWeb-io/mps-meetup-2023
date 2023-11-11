<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:013f012c-926a-4836-8d31-aefc550ba91e(io.lionweb.Properties.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="14" />
    <use id="aee9cad2-acd4-4608-aef2-0004f6a1cdbd" name="jetbrains.mps.lang.actions" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="azn5" ref="r:5d0bf864-ad8e-487e-9a12-36abdfcf2e40(io.lionweb.Properties.structure)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi" />
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1239814640496" name="jetbrains.mps.lang.editor.structure.CellLayout_VerticalGrid" flags="nn" index="2EHx9g" />
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1186403694788" name="jetbrains.mps.lang.editor.structure.ColorStyleClassItem" flags="ln" index="VaVBg">
        <property id="1186403713874" name="color" index="Vb096" />
      </concept>
      <concept id="1186403751766" name="jetbrains.mps.lang.editor.structure.FontStyleStyleClassItem" flags="ln" index="Vb9p2">
        <property id="1186403771423" name="style" index="Vbekb" />
      </concept>
      <concept id="1186404549998" name="jetbrains.mps.lang.editor.structure.ForegroundColorStyleClassItem" flags="ln" index="VechU" />
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1233758997495" name="jetbrains.mps.lang.editor.structure.PunctuationLeftStyleClassItem" flags="ln" index="11L4FC" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389446423" name="jetbrains.mps.lang.editor.structure.CellModel_Collection" flags="sn" stub="3013115976261988961" index="3EZMnI">
        <child id="1106270802874" name="cellLayout" index="2iSdaV" />
        <child id="1073389446424" name="childCellModel" index="3EZMnx" />
      </concept>
      <concept id="1073389577006" name="jetbrains.mps.lang.editor.structure.CellModel_Constant" flags="sn" stub="3610246225209162225" index="3F0ifn">
        <property id="1073389577007" name="text" index="3F0ifm" />
      </concept>
      <concept id="1073389658414" name="jetbrains.mps.lang.editor.structure.CellModel_Property" flags="sg" stub="730538219796134133" index="3F0A7n" />
      <concept id="1219418625346" name="jetbrains.mps.lang.editor.structure.IStyleContainer" flags="ng" index="3F0Thp">
        <child id="1219418656006" name="styleItem" index="3F10Kt" />
      </concept>
      <concept id="1073389882823" name="jetbrains.mps.lang.editor.structure.CellModel_RefNode" flags="sg" stub="730538219795960754" index="3F1sOY" />
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="rD9LMcTEfi">
    <ref role="1XX52x" to="azn5:6LPMcPcmvNX" resolve="PropertiesFile" />
    <node concept="3EZMnI" id="rD9LMcTEfm" role="2wV5jI">
      <node concept="3EZMnI" id="rD9LMcTEft" role="3EZMnx">
        <node concept="VPM3Z" id="rD9LMcTEfv" role="3F10Kt" />
        <node concept="Vb9p2" id="rD9LMcTEfH" role="3F10Kt">
          <property role="Vbekb" value="g1_k_vY/BOLD" />
        </node>
        <node concept="PMmxH" id="rD9LMcTEfz" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        </node>
        <node concept="3F0A7n" id="rD9LMcTEfB" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="2iRfu4" id="rD9LMcTEfy" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="rD9LMcTEfJ" role="3EZMnx" />
      <node concept="3F2HdR" id="rD9LMcTEfL" role="3EZMnx">
        <ref role="1NtTu8" to="azn5:6LPMcPcmvNZ" resolve="props" />
        <node concept="2EHx9g" id="rD9LMcTZuZ" role="2czzBx" />
      </node>
      <node concept="2iRkQZ" id="rD9LMcTEfp" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="rD9LMcTEge">
    <ref role="1XX52x" to="azn5:6LPMcPcmvO1" resolve="Property" />
    <node concept="3EZMnI" id="rD9LMcTEgg" role="2wV5jI">
      <node concept="3F0A7n" id="rD9LMcTEgm" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
      </node>
      <node concept="3F0ifn" id="rD9LMcTEgp" role="3EZMnx">
        <property role="3F0ifm" value=":" />
        <node concept="11L4FC" id="rD9LMcTEgr" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F1sOY" id="rD9LMcTEgt" role="3EZMnx">
        <ref role="1NtTu8" to="azn5:6LPMcPcmvO5" resolve="value" />
      </node>
      <node concept="2iRfu4" id="rD9LMcTEgj" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="rD9LMcTEgT">
    <ref role="1XX52x" to="azn5:6LPMcPcmvO9" resolve="BooleanValue" />
    <node concept="3EZMnI" id="rD9LMcTEix" role="2wV5jI">
      <node concept="2iRfu4" id="rD9LMcTEiy" role="2iSdaV" />
      <node concept="3F0A7n" id="rD9LMcTEiz" role="3EZMnx">
        <ref role="1NtTu8" to="azn5:6LPMcPcmvOb" resolve="value" />
      </node>
      <node concept="PMmxH" id="rD9LMcTEi$" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <node concept="Vb9p2" id="rD9LMcTEi_" role="3F10Kt" />
        <node concept="VechU" id="rD9LMcTEiA" role="3F10Kt">
          <property role="Vb096" value="fLJRk5_/gray" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="rD9LMcTEhn">
    <ref role="1XX52x" to="azn5:6LPMcPcmvOd" resolve="DecValue" />
    <node concept="3EZMnI" id="rD9LMcTEiB" role="2wV5jI">
      <node concept="2iRfu4" id="rD9LMcTEiC" role="2iSdaV" />
      <node concept="3F0A7n" id="rD9LMcTEiD" role="3EZMnx">
        <ref role="1NtTu8" to="azn5:6LPMcPcmvOf" resolve="value" />
      </node>
      <node concept="PMmxH" id="rD9LMcTEiE" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <node concept="Vb9p2" id="rD9LMcTEiF" role="3F10Kt" />
        <node concept="VechU" id="rD9LMcTEiG" role="3F10Kt">
          <property role="Vb096" value="fLJRk5_/gray" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="rD9LMcTEhP">
    <ref role="1XX52x" to="azn5:6LPMcPcmvOh" resolve="IntValue" />
    <node concept="3EZMnI" id="rD9LMcTEiH" role="2wV5jI">
      <node concept="2iRfu4" id="rD9LMcTEiI" role="2iSdaV" />
      <node concept="3F0A7n" id="rD9LMcTEiJ" role="3EZMnx">
        <ref role="1NtTu8" to="azn5:6LPMcPcmvOj" resolve="value" />
      </node>
      <node concept="PMmxH" id="rD9LMcTEiK" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <node concept="Vb9p2" id="rD9LMcTEiL" role="3F10Kt" />
        <node concept="VechU" id="rD9LMcTEiM" role="3F10Kt">
          <property role="Vb096" value="fLJRk5_/gray" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="rD9LMcTEij">
    <ref role="1XX52x" to="azn5:6LPMcPcmvOl" resolve="StringValue" />
    <node concept="3EZMnI" id="rD9LMcTEin" role="2wV5jI">
      <node concept="2iRfu4" id="rD9LMcTEio" role="2iSdaV" />
      <node concept="3F0A7n" id="rD9LMcTEil" role="3EZMnx">
        <ref role="1NtTu8" to="azn5:6LPMcPcmvOn" resolve="value" />
      </node>
      <node concept="PMmxH" id="rD9LMcTEis" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        <node concept="Vb9p2" id="rD9LMcTEit" role="3F10Kt" />
        <node concept="VechU" id="rD9LMcTEiv" role="3F10Kt">
          <property role="Vb096" value="fLJRk5_/gray" />
        </node>
      </node>
    </node>
  </node>
</model>

