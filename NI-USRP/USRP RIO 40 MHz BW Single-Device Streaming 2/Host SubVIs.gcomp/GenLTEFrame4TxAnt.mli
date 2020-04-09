<?xml version="1.0" encoding="utf-8"?>
<SourceFile Checksum="FB9B0E520B2D49202AE692EDB372B9F81E1767B0825571A5E3DBB5909FC547D98174F6135F30C5D3020756CC8B6761879513E293030858B6E7380E7D18D08D88" Timestamp="1D60E7B92E7069C" xmlns="http://www.ni.com/PlatformFramework">
	<SourceModelFeatureSet>
		<ParsableNamespace AssemblyFileVersion="7.1.0.50148" FeatureSetName="Interface for MATLAB®" Name="http://www.ni.com/Matlab" OldestCompatibleVersion="5.3.1.49152" Version="5.3.1.49152" />
		<ParsableNamespace AssemblyFileVersion="7.1.0.50148" FeatureSetName="Editor" Name="http://www.ni.com/PlatformFramework" OldestCompatibleVersion="7.1.0.49153" Version="7.1.0.49153" />
		<ApplicationVersionInfo Build="7.1.0.50148" Name="LabVIEW NXG" Version="4.0.0" />
	</SourceModelFeatureSet>
	<MatlabDefinition Id="8d822492230d45c78e61da603dd4a810" xmlns="http://www.ni.com/Matlab">
		<p.PlatformAgnosticPathToLibrary>
			<Path a="1">
				<pE>C</pE>
				<pE>Thesis</pE>
				<pE>MATLAB_Testing</pE>
				<pE>GenerateLTEFrame</pE>
				<pE>Generate_LTE_Frame_4TxAnt.m</pE>
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
		<NameScopingEnvoy AutomaticallyResolveUp="True" Id="686601f944a444c4a890c87e532d11a0" Name="GenLTEFrame1TxAnt.mli" NameTracksFileName="True">
			<EmbeddedDefinitionReference Id="8c63a688c27c4710a7d331084a22265b" ModelDefinitionType="{http://www.ni.com/Matlab}MatlabEntryPoint" Name="GetLTEFrame4TxAnt">
				<MatlabEntryPoint Id="32de87a8cbb54b4a80416c69a34387b8" xmlns="http://www.ni.com/Matlab">
					<Icon Id="8923a1efc15a42e8b3e25e13a681d606" ListViewIconCrop="0 0 40 70" xmlns="http://www.ni.com/PlatformFramework">
						<IconPanel Height="[float]70" Id="6b7e11ee31d843aa9056c7c07c0a426e" Left="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
							<IconTemplate ClipMargin="[SMThickness]3,3,3,3" Height="[float]70" Id="5479cf31f26c460c873199a4a2844ba7" Left="[float]0" TemplateName="[string]Gray" Top="[float]0" Width="[float]40">
								<Rectangle Fill="[SMSolidColorBrush]#ff727272" Id="829711e7effc424693c9137b877bb8b2" IsHitTestVisible="[bool]False" Left="[float]0" RadiusX="[float]4" RadiusY="[float]4" Top="[float]0" />
								<Rectangle Fill="[SMSolidColorBrush]#ffe5e5e5" Id="2831d2c902674816912e08d2ab9f372a" IsHitTestVisible="[bool]False" Left="[float]0" Margin="[SMThickness]1,1,1,1" RadiusX="[float]2.5" RadiusY="[float]2.5" Stroke="[SMSolidColorBrush]#fff2f2f2" Top="[float]0" />
								<FileNameText Attached="[bool]False" Height="[float]66" HorizontalAlignment="[HorizontalAlignment]Left" Id="4c5937571d6347a299eaabd773df08cb" Left="[float]0" Margin="[SMThickness]2,2,2,2" SizeMode="[TextModelSizeMode]Fixed" Text="[string]Gen LTE Frame 1TxAnt" TextAlignment="[TextAlignment]Center" TextWrapping="[TextWrapping]Wrap" Top="[float]0" VerticalAlignment="[VerticalAlignment]Top" VerticalScrollBarVisibility="[ScrollBarVisibility]Hidden">
									<FontSetting FontFamily="Segoe UI" FontSize="9" Id="1a23baeb95324c89b294b9bbc13863b5" />
								</FileNameText>
							</IconTemplate>
						</IconPanel>
					</Icon>
					<ConnectorPane Height="70" Id="82de30e60c304ed5b641cc403108162a" ListViewHeight="130" ListViewWidth="150" Width="40" xmlns="http://www.ni.com/PlatformFramework">
						<ConnectorPaneTerminal />
						<ConnectorPaneTerminal Hotspot="0 15" />
						<ConnectorPaneTerminal Hotspot="0 25" />
						<ConnectorPaneTerminal Hotspot="0 35" />
						<ConnectorPaneTerminal Hotspot="15 0" />
						<ConnectorPaneTerminal Hotspot="25 0" />
						<ConnectorPaneTerminal Hotspot="40 5" ListViewHotspot="150 35" Parameter="6b1a7c0e34a9464e85033a79c475d4b8" />
						<ConnectorPaneTerminal Hotspot="40 15" ListViewHotspot="150 50" Parameter="56a10dc614c94592b96a13c9f6428e2d" />
						<ConnectorPaneTerminal Hotspot="40 25" />
						<ConnectorPaneTerminal Hotspot="40 35" />
						<ConnectorPaneTerminal Hotspot="15 70" />
						<ConnectorPaneTerminal Hotspot="25 70" />
						<ConnectorPaneTerminal Hotspot="0 45" />
						<ConnectorPaneTerminal Hotspot="40 45" />
						<ConnectorPaneTerminal Hotspot="0 55" />
						<ConnectorPaneTerminal Hotspot="40 55" />
						<ConnectorPaneTerminal Hotspot="0 65" ListViewHotspot="0 5" Parameter="5a162b405c3b4c0d8036344a51048a8c" />
						<ConnectorPaneTerminal Hotspot="40 65" ListViewHotspot="150 20" Parameter="5e291f507e404366a5b0f1389f77a666" />
					</ConnectorPane>
					<MatlabErrorDiagramParameter CallDirection="Input" Id="5a162b405c3b4c0d8036344a51048a8c" Name="Fehler (Eingang)" />
					<MatlabErrorDiagramParameter CallDirection="Output" Id="5e291f507e404366a5b0f1389f77a666" Name="Fehler (Ausgang)" />
					<MatlabParameter DataType="ComplexDouble[,]" Id="ffaa6ffbeca244e9999dced7dda859f0" Name="ComplexSamples">
						<MatlabDiagramParameter CallDirection="Input" Id="397f653946964133b7d63f2904cdffd3" Name="ComplexSamples in" Visible="False" />
						<MatlabDiagramParameter CallDirection="Output" Id="6b1a7c0e34a9464e85033a79c475d4b8" Name="ComplexSamples" />
					</MatlabParameter>
					<MatlabParameter DataType="Double" Id="d6d126ef34d24553b88dec39519cdd2b" Name="Fs">
						<MatlabDiagramParameter CallDirection="Input" Id="6ba63d0fc9e54418a03c5596dcd5da89" Name="Fs in" Visible="False" />
						<MatlabDiagramParameter CallDirection="Output" Id="56a10dc614c94592b96a13c9f6428e2d" Name="Fs" />
					</MatlabParameter>
				</MatlabEntryPoint>
			</EmbeddedDefinitionReference>
		</NameScopingEnvoy>
	</EnvoyManagerFile>
</SourceFile>