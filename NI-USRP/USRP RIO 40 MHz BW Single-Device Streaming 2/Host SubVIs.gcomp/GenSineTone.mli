<?xml version="1.0" encoding="utf-8"?>
<SourceFile Checksum="619BFE8D21A3703BA8201DF31DFA6DB8AD4F6BECECE972823B261952A04931BAEBA110B477800BF5975BEF01CBAA5407DC9AC977E42D40415D17B09950547E65" Timestamp="1D5F873BD3B3A93" xmlns="http://www.ni.com/PlatformFramework">
	<SourceModelFeatureSet>
		<ParsableNamespace AssemblyFileVersion="7.1.0.50148" FeatureSetName="Interface for MATLAB®" Name="http://www.ni.com/Matlab" OldestCompatibleVersion="5.3.1.49152" Version="5.3.1.49152" />
		<ParsableNamespace AssemblyFileVersion="7.1.0.50148" FeatureSetName="Editor" Name="http://www.ni.com/PlatformFramework" OldestCompatibleVersion="7.1.0.49153" Version="7.1.0.49153" />
		<ApplicationVersionInfo Build="7.1.0.50148" Name="LabVIEW NXG" Version="4.0.0" />
	</SourceModelFeatureSet>
	<MatlabDefinition Id="8d822492230d45c78e61da603dd4a810" xmlns="http://www.ni.com/Matlab">
		<p.PlatformAgnosticPathToLibrary>
			<Path a="1">
				<pE>H</pE>
				<pE>TUM-PC</pE>
				<pE>Dokumente</pE>
				<pE>Thesis</pE>
				<pE>MATLAB_Testing</pE>
				<pE>GenSineTone.m</pE>
			</Path>
		</p.PlatformAgnosticPathToLibrary>
		<Icon Id="5e66aade17ae40f3af2ceee7ff481e1b" ListViewIconCrop="0 0 40 40" xmlns="http://www.ni.com/PlatformFramework">
			<IconPanel Height="[float]40" Id="c013a25d8bae4c2d9bd5d82b34534d26" Left="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
				<IconTemplate Height="[float]40" HorizontalAlignment="[HorizontalAlignment]Stretch" Id="ae1f013f5a764f7fabc41193157c8d0d" Left="[float]0" TemplateName="[string]Blank" Top="[float]0" VerticalAlignment="[VerticalAlignment]Stretch" Width="[float]40" />
			</IconPanel>
		</Icon>
	</MatlabDefinition>
	<EnvoyManagerFile Id="dbaf1ab65a71475590aebefbcf6ea890" xmlns="http://www.ni.com/PlatformFramework">
		<EnvoyManagerRootEnvoy Id="85c611a7dd6b453489480cf948e906df" ModelDefinitionType="EnvoyManagerRootEnvoy" Name="RootEnvoy" />
		<NameScopingEnvoy AutomaticallyResolveUp="True" Id="686601f944a444c4a890c87e532d11a0" Name="GenSineTone.mli" NameTracksFileName="True">
			<EmbeddedDefinitionReference Id="8c63a688c27c4710a7d331084a22265b" ModelDefinitionType="{http://www.ni.com/Matlab}MatlabEntryPoint" Name="GenSineTone">
				<MatlabEntryPoint Id="32de87a8cbb54b4a80416c69a34387b8" xmlns="http://www.ni.com/Matlab">
					<Icon Id="8923a1efc15a42e8b3e25e13a681d606" ListViewIconCrop="0 0 40 70" xmlns="http://www.ni.com/PlatformFramework">
						<IconPanel Height="[float]70" Id="6b7e11ee31d843aa9056c7c07c0a426e" Left="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
							<IconTemplate ClipMargin="[SMThickness]3,3,3,3" Height="[float]70" Id="5479cf31f26c460c873199a4a2844ba7" Left="[float]0" TemplateName="[string]Gray" Top="[float]0" Width="[float]40">
								<Rectangle Fill="[SMSolidColorBrush]#ff727272" Id="829711e7effc424693c9137b877bb8b2" IsHitTestVisible="[bool]False" Left="[float]0" RadiusX="[float]4" RadiusY="[float]4" Top="[float]0" />
								<Rectangle Fill="[SMSolidColorBrush]#ffe5e5e5" Id="2831d2c902674816912e08d2ab9f372a" IsHitTestVisible="[bool]False" Left="[float]0" Margin="[SMThickness]1,1,1,1" RadiusX="[float]2.5" RadiusY="[float]2.5" Stroke="[SMSolidColorBrush]#fff2f2f2" Top="[float]0" />
								<FileNameText Attached="[bool]False" Height="[float]66" Id="4c5937571d6347a299eaabd773df08cb" Left="[float]0" Margin="[SMThickness]2,2,2,2" SizeMode="[TextModelSizeMode]AutoFont" Text="[string]Gen Sine Tone" TextAlignment="[TextAlignment]Center" TextWrapping="[TextWrapping]Wrap" Top="[float]0" VerticalScrollBarVisibility="[ScrollBarVisibility]Hidden">
									<FontSetting FontFamily="Segoe UI" FontSize="10.5" Id="1a23baeb95324c89b294b9bbc13863b5" />
								</FileNameText>
							</IconTemplate>
						</IconPanel>
					</Icon>
					<ConnectorPane Height="70" Id="82de30e60c304ed5b641cc403108162a" ListViewHeight="190" ListViewWidth="150" Width="40" xmlns="http://www.ni.com/PlatformFramework">
						<ConnectorPaneTerminal ListViewHotspot="0 50" Parameter="397f653946964133b7d63f2904cdffd3" />
						<ConnectorPaneTerminal Hotspot="0 15" ListViewHotspot="0 65" Parameter="6ba63d0fc9e54418a03c5596dcd5da89" />
						<ConnectorPaneTerminal Hotspot="0 25" />
						<ConnectorPaneTerminal Hotspot="0 35" />
						<ConnectorPaneTerminal Hotspot="15 0" />
						<ConnectorPaneTerminal Hotspot="25 0" />
						<ConnectorPaneTerminal Hotspot="40 5" />
						<ConnectorPaneTerminal Hotspot="40 15" />
						<ConnectorPaneTerminal Hotspot="40 25" />
						<ConnectorPaneTerminal Hotspot="40 35" ListViewHotspot="0 35" Parameter="aa94254997449b6bdca0bb6649c532e" />
						<ConnectorPaneTerminal Hotspot="15 70" />
						<ConnectorPaneTerminal Hotspot="25 70" />
						<ConnectorPaneTerminal Hotspot="0 45" ListViewHotspot="0 80" Parameter="85f9fb5bff6844cda806aaa71a73c04c" />
						<ConnectorPaneTerminal Hotspot="40 45" />
						<ConnectorPaneTerminal Hotspot="0 55" />
						<ConnectorPaneTerminal Hotspot="40 55" ListViewHotspot="150 125" Parameter="f671c99c86fa42b2a5c3d557f032be33" />
						<ConnectorPaneTerminal Hotspot="0 65" ListViewHotspot="0 95" Parameter="5a162b405c3b4c0d8036344a51048a8c" />
						<ConnectorPaneTerminal Hotspot="40 65" ListViewHotspot="150 110" Parameter="5e291f507e404366a5b0f1389f77a666" />
					</ConnectorPane>
					<MatlabErrorDiagramParameter CallDirection="Input" Id="5a162b405c3b4c0d8036344a51048a8c" Name="Fehler (Eingang)" />
					<MatlabErrorDiagramParameter CallDirection="Output" Id="5e291f507e404366a5b0f1389f77a666" Name="Fehler (Ausgang)" />
					<MatlabParameter DataType="Double" Id="ffaa6ffbeca244e9999dced7dda859f0" Name="Fs">
						<MatlabDiagramParameter CallDirection="Input" Id="397f653946964133b7d63f2904cdffd3" Name="Fs" />
						<MatlabDiagramParameter CallDirection="Output" Id="6b1a7c0e34a9464e85033a79c475d4b8" Name="Fs out" Visible="False" />
					</MatlabParameter>
					<MatlabParameter DataType="UInt32" Id="d6d126ef34d24553b88dec39519cdd2b" Name="NoOfSamples">
						<MatlabDiagramParameter CallDirection="Input" Id="6ba63d0fc9e54418a03c5596dcd5da89" Name="NoOfSamples" />
						<MatlabDiagramParameter CallDirection="Output" Id="56a10dc614c94592b96a13c9f6428e2d" Name="NoOfSamples out" Visible="False" />
					</MatlabParameter>
					<MatlabParameter DataType="Double" Id="74d9a4a3904d4d728444255378af0d74" Name="Amplitude">
						<MatlabDiagramParameter CallDirection="Input" Id="85f9fb5bff6844cda806aaa71a73c04c" Name="Amplitude" />
						<MatlabDiagramParameter CallDirection="Output" Id="64d81b5594c545d8abdb9ae2f4bc90f0" Name="Amplitude out" Visible="False" />
					</MatlabParameter>
					<MatlabParameter DataType="Double[]" Id="9e82e839a7624ee5954b6e8b5211094b" Name="SineSamplesReal">
						<MatlabDiagramParameter CallDirection="Input" Id="1bc4220313d146a5b944c790ed6cf10c" Name="SineSamplesReal in" Visible="False" />
						<MatlabDiagramParameter CallDirection="Output" Id="aa94254997449b6bdca0bb6649c532e" Name="SineSamplesReal" />
					</MatlabParameter>
					<MatlabParameter DataType="Double[]" Id="9af79b83e22c488aacbeeb4512847e1f" Name="SineSamplesImag">
						<MatlabDiagramParameter CallDirection="Input" Id="5c7b4f1cc2fc4ec7aa1965490e6254b4" Name="SineSamplesImag in" Visible="False" />
						<MatlabDiagramParameter CallDirection="Output" Id="f671c99c86fa42b2a5c3d557f032be33" Name="SineSamplesImag" />
					</MatlabParameter>
				</MatlabEntryPoint>
			</EmbeddedDefinitionReference>
		</NameScopingEnvoy>
	</EnvoyManagerFile>
</SourceFile>