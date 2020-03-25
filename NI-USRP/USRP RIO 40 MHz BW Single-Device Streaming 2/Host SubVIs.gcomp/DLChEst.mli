<?xml version="1.0" encoding="utf-8"?>
<SourceFile Checksum="26C6FED89B9CDB162963B62525A3C13CFFFDC676220D5FAD7352597D2433D717CC97DF12412493C0CA4B2C28C95A9B650B8B1B8BEE3996E1A94699020FEE6D5B" Timestamp="1D602ACF137CE54" xmlns="http://www.ni.com/PlatformFramework">
	<SourceModelFeatureSet>
		<ParsableNamespace AssemblyFileVersion="7.1.0.50148" FeatureSetName="Interface for MATLAB®" Name="http://www.ni.com/Matlab" OldestCompatibleVersion="5.3.1.49152" Version="5.3.1.49152" />
		<ParsableNamespace AssemblyFileVersion="7.1.0.50148" FeatureSetName="Editor" Name="http://www.ni.com/PlatformFramework" OldestCompatibleVersion="7.1.0.49153" Version="7.1.0.49153" />
		<ApplicationVersionInfo Build="7.1.0.50148" Name="LabVIEW NXG" Version="4.0.0" />
	</SourceModelFeatureSet>
	<MatlabDefinition Id="9fdfb784856d4636b2a90bd32ce15f38" xmlns="http://www.ni.com/Matlab">
		<p.PlatformAgnosticPathToLibrary>
			<Path a="1">
				<pE>H</pE>
				<pE>TUM-PC</pE>
				<pE>Dokumente</pE>
				<pE>Thesis</pE>
				<pE>MATLAB_Testing</pE>
				<pE>GenerateLTEFrame</pE>
				<pE>HelperFunctions</pE>
				<pE>findDLChEst.m</pE>
			</Path>
		</p.PlatformAgnosticPathToLibrary>
		<Icon Id="d90acbcc9cd047c18febdf630de12521" ListViewIconCrop="0 0 40 40" xmlns="http://www.ni.com/PlatformFramework">
			<IconPanel Height="[float]40" Id="a0bfcc34515f452d86ade46f921d6011" Left="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
				<IconTemplate Height="[float]40" Id="316771504f8844e79e28375237cbf51b" Left="[float]0" TemplateName="[string]Blank" Top="[float]0" Width="[float]40" />
			</IconPanel>
		</Icon>
	</MatlabDefinition>
	<EnvoyManagerFile Id="965c97ca92ea4bfc9890fe8fba0e05e9" xmlns="http://www.ni.com/PlatformFramework">
		<EnvoyManagerRootEnvoy Id="cc7f552d78984ce29053cde8f939eca8" ModelDefinitionType="EnvoyManagerRootEnvoy" Name="RootEnvoy" />
		<NameScopingEnvoy AutomaticallyResolveUp="True" Id="f17dfcf6a53446683f3f09e7f72852d" Name="DLChEst.mli" NameTracksFileName="True">
			<EmbeddedDefinitionReference Id="88f5121e2a6b45ddab8a9dbfb47069a2" ModelDefinitionType="{http://www.ni.com/Matlab}MatlabEntryPoint" Name="findDLChEst">
				<MatlabEntryPoint Id="ea2614bdd1e4e11a6e7208c427599ba" xmlns="http://www.ni.com/Matlab">
					<Icon Id="da9c39be11674ddf9f6f841ba9a51cc4" ListViewIconCrop="0 0 40 50" xmlns="http://www.ni.com/PlatformFramework">
						<IconPanel Height="[float]50" Id="45e3ab682a5b48d784762a99c531cf72" Left="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
							<IconTemplate ClipMargin="[SMThickness]3,3,3,3" Height="[float]50" Id="668197ddc1e5452fafafcec38fd0542c" Left="[float]0" TemplateName="[string]Gray" Top="[float]0" Width="[float]40">
								<Rectangle Fill="[SMSolidColorBrush]#ff727272" Id="83023d2e14054695833922ef85d0fc8b" IsHitTestVisible="[bool]False" Left="[float]0" RadiusX="[float]4" RadiusY="[float]4" Top="[float]0" />
								<Rectangle Fill="[SMSolidColorBrush]#ffe5e5e5" Id="a81b830b3ccc4fd9874a1a88dc5055e8" IsHitTestVisible="[bool]False" Left="[float]0" Margin="[SMThickness]1,1,1,1" RadiusX="[float]2.5" RadiusY="[float]2.5" Stroke="[SMSolidColorBrush]#fff2f2f2" Top="[float]0" />
								<FileNameText Attached="[bool]True" Height="[float]46" Id="f2ef75c7ec3a4784b144fe5a08b4ad64" Left="[float]0" Margin="[SMThickness]2,2,2,2" SizeMode="[TextModelSizeMode]AutoFont" Text="[string]findDLChEst" TextAlignment="[TextAlignment]Center" TextWrapping="[TextWrapping]Wrap" Top="[float]0" VerticalScrollBarVisibility="[ScrollBarVisibility]Hidden">
									<FontSetting FontFamily="Segoe UI" FontSize="6" Id="e9ff2f0144c94aa68d8f86a908cb0841" />
								</FileNameText>
							</IconTemplate>
						</IconPanel>
					</Icon>
					<ConnectorPane Height="50" Id="e04d8d9a0b58436681984eb1fd0a561a" ListViewHeight="160" ListViewWidth="150" Width="40" xmlns="http://www.ni.com/PlatformFramework">
						<ConnectorPaneTerminal />
						<ConnectorPaneTerminal Hotspot="0 15" />
						<ConnectorPaneTerminal Hotspot="0 25" ListViewHotspot="0 80" Parameter="275ec6649bb244a28faab147aa20353f" />
						<ConnectorPaneTerminal Hotspot="0 35" ListViewHotspot="0 35" Parameter="db93fe4bf33a4d9b97cf833f788cf162" />
						<ConnectorPaneTerminal Hotspot="15 0" />
						<ConnectorPaneTerminal Hotspot="25 0" />
						<ConnectorPaneTerminal Hotspot="40 5" />
						<ConnectorPaneTerminal Hotspot="40 15" />
						<ConnectorPaneTerminal Hotspot="40 25" ListViewHotspot="150 50" Parameter="22412fe92e5449e18b9525cd6425fff0" />
						<ConnectorPaneTerminal Hotspot="40 35" ListViewHotspot="150 65" Parameter="35c99302753d49898b51d364e79d2cd6" />
						<ConnectorPaneTerminal Hotspot="15 50" />
						<ConnectorPaneTerminal Hotspot="25 50" />
						<ConnectorPaneTerminal Hotspot="0 45" ListViewHotspot="0 95" Parameter="edf64933100f46f08cdfbe021a469676" />
						<ConnectorPaneTerminal Hotspot="40 45" ListViewHotspot="150 110" Parameter="f1bc8819c02a473da0ed415659527ce6" />
					</ConnectorPane>
					<MatlabErrorDiagramParameter CallDirection="Input" Id="edf64933100f46f08cdfbe021a469676" Name="error in" />
					<MatlabErrorDiagramParameter CallDirection="Output" Id="f1bc8819c02a473da0ed415659527ce6" Name="error out" />
					<MatlabParameter DataType="ComplexDouble[]" Id="e71f4800da674d8ca4582c84f9c3c6ab" Name="HEst">
						<MatlabDiagramParameter CallDirection="Input" Id="f661193ebfb544de979d2c2c03481746" Name="HEst in" Visible="False" />
						<MatlabDiagramParameter CallDirection="Output" Id="22412fe92e5449e18b9525cd6425fff0" Name="HEst" />
					</MatlabParameter>
					<MatlabParameter DataType="ComplexDouble[]" Id="d7298c5cd3554332885e0a1bd8019766" Name="noiseEst">
						<MatlabDiagramParameter CallDirection="Input" Id="17966d4afec14b9d8673331d9f06f358" Name="noiseEst in" Visible="False" />
						<MatlabDiagramParameter CallDirection="Output" Id="35c99302753d49898b51d364e79d2cd6" Name="noiseEst" />
					</MatlabParameter>
					<MatlabParameter DataType="ComplexDouble[]" Id="ebc2412f126345be9584aeee058d8ee4" Name="rxWaveform">
						<MatlabDiagramParameter CallDirection="Input" Id="275ec6649bb244a28faab147aa20353f" Name="rxWaveform" />
						<MatlabDiagramParameter CallDirection="Output" Id="818bba15b7884f80bf016f5a491a971b" Name="rxWaveform out" Visible="False" />
					</MatlabParameter>
					<MatlabParameter DataType="Double" Id="559297289b2b4a77aa507eafd367037d" Name="enb">
						<MatlabDiagramParameter CallDirection="Input" Id="db93fe4bf33a4d9b97cf833f788cf162" Name="enb" />
						<MatlabDiagramParameter CallDirection="Output" Id="760fa40e09b642c4a87adffba8b9dd59" Name="enb out" Visible="False" />
					</MatlabParameter>
				</MatlabEntryPoint>
			</EmbeddedDefinitionReference>
		</NameScopingEnvoy>
	</EnvoyManagerFile>
</SourceFile>