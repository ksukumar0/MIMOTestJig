<?xml version="1.0" encoding="utf-8"?>
<SourceFile Checksum="F55AF46CE78AE9F4E28762AC347C87FBDE7C44C28A1868FC7DE50BE173103A61F50CE8EC9D33B6B2D92970F92F57C62A957B94973D94962E1555D69CC3744AF6" Timestamp="1D60E758D9E6DB2" xmlns="http://www.ni.com/PlatformFramework">
	<SourceModelFeatureSet>
		<ParsableNamespace AssemblyFileVersion="7.1.0.50148" FeatureSetName="Interface for MATLAB®" Name="http://www.ni.com/Matlab" OldestCompatibleVersion="5.3.1.49152" Version="5.3.1.49152" />
		<ParsableNamespace AssemblyFileVersion="7.1.0.50148" FeatureSetName="Editor" Name="http://www.ni.com/PlatformFramework" OldestCompatibleVersion="7.1.0.49153" Version="7.1.0.49153" />
		<ApplicationVersionInfo Build="7.1.0.50148" Name="LabVIEW NXG" Version="4.0.0" />
	</SourceModelFeatureSet>
	<MatlabDefinition Id="b484a5b4fe6a495dbae5ee3e160c3b41" xmlns="http://www.ni.com/Matlab">
		<p.PlatformAgnosticPathToLibrary>
			<Path a="1">
				<pE>C</pE>
				<pE>Thesis</pE>
				<pE>MATLAB_Testing</pE>
				<pE>GenerateLTEFrame</pE>
				<pE>GenSineTone4Tx.m</pE>
			</Path>
		</p.PlatformAgnosticPathToLibrary>
		<Icon Id="1c42e213aa9645008601f97cd7cd55b9" ListViewIconCrop="0 0 40 40" xmlns="http://www.ni.com/PlatformFramework">
			<IconPanel Height="[float]40" Id="dc50c2880b094b2fa57ac6cb9e7011c7" Left="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
				<IconTemplate Height="[float]40" Id="5a01ef1a3b8441fe80291887ce3f8fe7" Left="[float]0" TemplateName="[string]Blank" Top="[float]0" Width="[float]40" />
			</IconPanel>
		</Icon>
	</MatlabDefinition>
	<EnvoyManagerFile Id="9f6a187aa7134520994b51be9ba28583" xmlns="http://www.ni.com/PlatformFramework">
		<EnvoyManagerRootEnvoy Id="28ff8e9ede0c4ee9aec970a945d07dcb" ModelDefinitionType="EnvoyManagerRootEnvoy" Name="RootEnvoy" />
		<NameScopingEnvoy AutomaticallyResolveUp="True" Id="930ff251103b47c58abdab8418cc973c" Name="test.mli" NameTracksFileName="True">
			<EmbeddedDefinitionReference Id="914e1327c347402099f63e331ff5dc69" ModelDefinitionType="{http://www.ni.com/Matlab}MatlabEntryPoint" Name="Test">
				<MatlabEntryPoint Id="e5c9167e9fc94816af6bede14628e511" xmlns="http://www.ni.com/Matlab">
					<Icon Id="923b4cbad7894f03a17ae4e11e856154" ListViewIconCrop="0 0 40 40" xmlns="http://www.ni.com/PlatformFramework">
						<IconPanel Height="[float]40" Id="1a42f2594e4c4bc6999c1b1eaabbf052" Left="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
							<IconTemplate ClipMargin="[SMThickness]3,3,3,3" Height="[float]40" Id="e515506b752943ea8822235de5e92e6b" Left="[float]0" TemplateName="[string]Gray" Top="[float]0" Width="[float]40">
								<Rectangle Fill="[SMSolidColorBrush]#ff727272" Id="3a68243673094590a9247dfb7fb8d0a8" IsHitTestVisible="[bool]False" Left="[float]0" RadiusX="[float]4" RadiusY="[float]4" Top="[float]0" />
								<Rectangle Fill="[SMSolidColorBrush]#ffe5e5e5" Id="834fbb2f338b4532880d8b4a2366c817" IsHitTestVisible="[bool]False" Left="[float]0" Margin="[SMThickness]1,1,1,1" RadiusX="[float]2.5" RadiusY="[float]2.5" Stroke="[SMSolidColorBrush]#fff2f2f2" Top="[float]0" />
								<FileNameText Attached="[bool]True" Id="b4e8afd7037948be9a612d06063dbc1a" Left="[float]0" Margin="[SMThickness]2,2,2,2" SizeMode="[TextModelSizeMode]AutoFont" Text="[string]Test" TextAlignment="[TextAlignment]Center" TextWrapping="[TextWrapping]Wrap" Top="[float]0" VerticalScrollBarVisibility="[ScrollBarVisibility]Hidden">
									<FontSetting FontFamily="Segoe UI" FontSize="11.25" Id="3bbb3e2bbeda4d19960044b12c511975" />
								</FileNameText>
							</IconTemplate>
						</IconPanel>
					</Icon>
					<ConnectorPane Height="40" Id="89e63807ae79455ebe26d19accf181e6" ListViewHeight="145" ListViewWidth="150" Width="40" xmlns="http://www.ni.com/PlatformFramework">
						<ConnectorPaneTerminal />
						<ConnectorPaneTerminal Hotspot="0 15" />
						<ConnectorPaneTerminal Hotspot="0 25" />
						<ConnectorPaneTerminal Hotspot="0 35" ListViewHotspot="0 35" Parameter="244ad1cb89574288beddfaf72996508c" />
						<ConnectorPaneTerminal Hotspot="15 0" />
						<ConnectorPaneTerminal Hotspot="25 0" />
						<ConnectorPaneTerminal Hotspot="40 5" ListViewHotspot="150 65" Parameter="9f1b6b14979749318cf60cec9b9b59ba" />
						<ConnectorPaneTerminal Hotspot="40 15" ListViewHotspot="150 80" Parameter="77a1bd7f2cc44b51a8d6c483d4134b37" />
						<ConnectorPaneTerminal Hotspot="40 25" />
						<ConnectorPaneTerminal Hotspot="40 35" ListViewHotspot="150 50" Parameter="f56a8f06557242da8d6403b167382c26" />
						<ConnectorPaneTerminal Hotspot="15 40" />
						<ConnectorPaneTerminal Hotspot="25 40" />
					</ConnectorPane>
					<MatlabErrorDiagramParameter CallDirection="Input" Id="244ad1cb89574288beddfaf72996508c" Name="error in" />
					<MatlabErrorDiagramParameter CallDirection="Output" Id="f56a8f06557242da8d6403b167382c26" Name="error out" />
					<MatlabParameter DataType="ComplexDouble[,]" Id="868f760c058c4a7490d5ed8a924c0d30" Name="output">
						<MatlabDiagramParameter CallDirection="Input" Id="9f6add62426c4edbafc60a1ee0f58347" Name="output in" Visible="False" />
						<MatlabDiagramParameter CallDirection="Output" Id="9f1b6b14979749318cf60cec9b9b59ba" Name="output" />
					</MatlabParameter>
					<MatlabParameter DataType="Double" Id="2529a409b37245a7805543d6a5165421" Name="Fs">
						<MatlabDiagramParameter CallDirection="Input" Id="74ebde06397741d7924fbf6addde0ca4" Name="Fs in" Visible="False" />
						<MatlabDiagramParameter CallDirection="Output" Id="77a1bd7f2cc44b51a8d6c483d4134b37" Name="Fs" />
					</MatlabParameter>
				</MatlabEntryPoint>
			</EmbeddedDefinitionReference>
		</NameScopingEnvoy>
	</EnvoyManagerFile>
</SourceFile>