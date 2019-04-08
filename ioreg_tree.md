ioreg -l -b -t
ioreg -l -b -t | grep -i "AppleMultitouchDevice"


    | +-o IOPMrootDomain  <class IOPMrootDomain, id 0x1000001b9, registered, matched, active, busy 0 (493 ms), retain 128>
    | | | {
    | | |   "IOSleepSupported" = Yes
    | | |   "SleepWakeUUID" = "118007BB-0571-4E06-923A-5ECA1D865A08"
    | | |   "DriverPMAssertionsDetailed" = ({"Assertions"=1,"ModifiedTime"=6667845609308982126,"Owner"="com.apple.ioam.ldcm.d9","RegistryEntryID"=4294967910,"CreatedTime"=6667047441176639092,"Level"=0,"ID"=500},{"Assertions"=256,"ModifiedTime"=6667795564350374050,"Owner"="en0","RegistryEntryID"=4294968603,"CreatedTime"=6667052165641032994,"Level"=255,"ID"=503})
    | | |   "System Capabilities" = 15
    | | |   "IOPowerManagement" = {"ChildrenPowerState"=0,"DevicePowerState"=3,"CurrentPowerState"=3,"CapabilityFlags"=2,"MaxPowerState"=3,"DriverPowerState"=3}
    | | |   "SystemPowerProfileOverrideDict" = {"System Sleep Timer"=2147483647}
    | | |   "Supported Features" = {"WakeByCalendarDate"=32833543,"WakeOnMagicPacket"=33095685,"PowerRelativeToShutdown"=33030151,"WakeRelativeToSleep"=32964615,"PowerByCalendarDate"=32899079}
    | | |   "IOGeneralInterest" = "IOCommand is not serializable"
    | | |   "IOUserClientClass" = "RootDomainUserClient"
    | | |   "IOPriorityPowerStateInterest" = "IOCommand is not serializable"
    | | |   "IOAppPowerStateInterest" = "IOCommand is not serializable"
    | | |   "Last Sleep Reason" = "Idle Sleep"
    | | |   "IOPMUserTriggeredFullWake" = Yes
    | | |   "IOPMSystemSleepType" = 7
    | | |   "BootSessionUUID" = "FED4E87A-2347-47B2-9B25-1149389532D7"
    | | |   "System Idle Seconds" = 3
    | | |   "IOPMUserIsActive" = Yes
    | | |   "DriverPMAssertions" = 256
    | | | }
    | | |
    | | +-o IORootParent  <class IORootParent, id 0x1000001ba, !registered, !matched, active, busy 0, retain 7>
    | | |   {
    | | |     "IOPowerManagement" = {"WQ-CheckForWork"=54804,"WQ-ScanEntries"=24694,"CapabilityFlags"=0,"MaxPowerState"=1,"WQ-QueueEmpty"=60,"DevicePowerState"=1,"WQ-NoWorkDone"=111,"ChildrenPowerState"=0,"CurrentPowerState"=1}
    | | |   }
    | | |
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007de, !registered, !matched, active, busy 0, retain 5>
    | | |   {
    | | |     "IOUserClientCreator" = "pid 349, diagnosticd"
    | | |   }
    | | |
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000924, !registered, !matched, active, busy 0, retain 5>
    | | |   {
    | | |     "IOUserClientCreator" = "pid 848, logd"
    | | |   }
    | | |
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000925, !registered, !matched, active, busy 0, retain 5>
--
    | |   |       | |   "clock domain" = 1885957682
    | |   |       | |   "output streams" = ({"stream ID"=200,"starting channel"=1,"available formats"=({"bytes per frame"=2,"channels per frame"=1,"bits per channel"=16,"format flags"=12,"max sample rate"=206158430208000,"bytes per packet"=2,"frames per packet"=1,"format ID"=1819304813,"min sample rate"=206158430208000}),"current format"={"bytes per frame"=2,"sample rate"=206158430208000,"channels per frame"=1,"bits per channel"=16,"format flags"=12,"bytes per packet"=2,"frames per packet"=1,"format ID"=1819304813},"terminal type"=0})
    | |   |       | |   "outputArrayCal" = {}
    | |   |       | |   "IOReportLegendPublic" = Yes
    | |   |       | |   "IOPowerManagement" = {"CapabilityFlags"=32768,"MaxPowerState"=1,"CurrentPowerState"=1}
    | |   |       | |   "LowPowerEnableChannelMask" = 0
    | |   |       | |   "maxChannelCount" = {"MaxInputChannelCount"=0,"MaxOutputChannelCount"=1}
    | |   |       | |   "device name" = "MaggieArc"
    | |   |       | |   "actCal" = {"TCal"=<08000000a853004189edc14237e8ef42fff3cb4071367c3fbc1b213d3174b03effffffffffffffffffffffffffffffffffffffffa427253effffffff600d4c3fa427253effffffff0e97223f00008ed2>,"CCal"=<010000000000803f>}
    | |   |       | |   "output safety offset" = 112
    | |   |       | |   "controls" = ({"control ID"=369,"variant"=0,"selectors"=({"value"=0,"name"="Disabled"},{"value"=1936741936,"name"="Speaker 0 voltage"},{"value"=1936738608,"name"="Speaker 0 current"}),"scope"=1768845428,"element"=0,"class"=1685287523,"value"=(0),"base class"=1936483188,"multi-selector"=1,"read only"=0},{"control ID"=432,"variant"=0,"selectors"=({"value"=1634886448,"name"="<unknown name>"}),"scope"=1869968496,"element"=0,"class"=1396926579,"value"=1634886448,"base class"=1936483188,"property selectors"=(1396926579,1396926499,1396926531),"read only"=0},{"control ID"=316,"variant"=0,"scope"=1869968496,"element"=0,"class"=1668051824,"value"=1,"base class"=1953458028,"property selectors"=(1668051824),"read only"=0})
    | |   |       | |   "DebuggingInfo" = {"TestcaseRunTimeMS"=0,"BeginTestcaseWithRunCount"=0,"TestcaseNumber"=0,"DelayAfterRequestConfigChangeMS"=0,"TestcaseTimeoutMS"=0,"DelayBeforeRequestConfigChangeMS"=0,"DoNotReturnAfterRequestConfigChange"=0,"DelayInPerformConfigChange"=0}
    | |   |       | |   "sample rate" = 206158430208000
    | |   |       | |   "input streams" = ()
    | |   |       | |   "is running" = No
    | |   |       | |   "exclusive access owner" = 903
    | |   |       | |   "output latency" = 29
    | |   |       | |   "custom property info" = ({"property selector"=1296253811,"registry key"="maxChannelCount"},{"property selector"=1280329069,"registry key"="LowPowerEnableChannelMask"},{"property selector"=1280328045,"registry key"="LowPowerActiveChannelMask"},{"property selector"=1094927457,"registry key"="actCal"},{"property selector"=1396786273,"registry key"="outputArrayCal"})
    | |   |       | |   "input latency" = 6
    | |   |       | |   "IOGeneralInterest" = "IOCommand is not serializable"
    | |   |       | |   "IOReporters" = Yes
    | |   |       | |   "supports prewarming" = Yes
    | |   |       | |   "device manufacturer" = "Apple Inc."
    | |   |       | |   "input safety offset" = 93
    | |   |       | |   "IOReportLegend" = ({"IOReportGroupName"="Actuator","IOReportChannels"=((5999161185906536448,6442450945,"Sample Time"),(5999161185906536704,6442450945,"Host Time"),(5999161185906536960,6442450945,"Time Stamp Seed"),(5999161185906537216,6442450945,"Client Input position"),(5999161185906537472,6442450945,"Client Output position"),(5999161185906537728,6442450945,"Engine Running")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="IOAudio2"},{"IOReportGroupName"="Actuator","IOReportChannels"=((5272962351469184288,6442450945,"Input"),(5705307915696751904,6442450945,"Output")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="Approximate samplerate"},{"IOReportGroupName"="Actuator","IOReportChannels"=((206158430208000,6442450945,"48000 Hz")),"IOReportChannelInfo"={"IOReportChannelUnit"=72058126613872640},"IOReportSubGroupName"="MCA Run Times"},{"IOReportGroupName"="Actuator","IOReportChannels"=((206158430208000,6442450945,"48000 Hz")),"IOReportChannelInfo"={"IOReportChannelUnit"=7205759403792793600},"IOReportSubGroupName"="MCA Run Counts"},{"IOReportGroupName"="Actuator","IOReportChannels"=((5789186363857392709,12885032962,"State")),"IOReportChannelInfo"={"IOReportChannelUnit"=72058115876454424},"IOReportSubGroupName"="Power State"})
    | |   |       | | }
    | |   |       | |
    | |   |       | +-o IOAudio2DeviceUserClient  <class IOAudio2DeviceUserClient, id 0x100000a93, !registered, !matched, active, busy 0, retain 5>
    | |   |       |     {
    | |   |       |       "IOUserClientCreator" = "pid 903, mediaserverd"
    | |   |       |     }
    | |   |       |
    | |   |       +-o AppleMaggie  <class AppleMaggie, id 0x100000507, registered, matched, active, busy 0 (32 ms), retain 9>
    | |   |         | {
    | |   |         |   "Button Haptics Asset Interface" = 1
    | |   |         |   "Version" = "2.4.0000"
    | |   |         |   "IOUserClientClass" = "AppleMaggieUserClient"
    | |   |         |   "ConfigurationStatus" = 0
    | |   |         |   "IOReportLegendPublic" = Yes
    | |   |         |   "IOReportLegend" = ({"IOReportGroupName"="Maggie Status","IOReportChannels"=((4294967296,6459228161,"Haptics.Fault.0"),(8589934592,6459228161,"Haptics.Fault.2"),(12884901888,6459228161,"Haptics.Fault.3"),(17179869184,6459228161,"Haptics.Fault.4"),(21474836480,6459228161,"Haptics.Fault.5"),(25769803776,6459228161,"Haptics.Fault.6"),(30064771072,6459228161,"Haptics.Fault.15")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="Debug Faults"})
    | |   |         | }
    | |   |         |
    | |   |         +-o AppleMaggieUserClient  <class AppleMaggieUserClient, id 0x100000c84, !registered, !matched, active, busy 0, retain 5>
    | |   |             {
    | |   |               "IOUserClientCreator" = "pid 1391, backboardd"
    | |   |             }
    | |   |
    | |   +-o spi2@A088000  <class AppleARMIODevice, id 0x100000144, registered, matched, active, busy 0 (1005 ms), retain 9>
    | |   | | {
    | |   | |   "IOInterruptSpecifiers" = (<d8000000>)
    | |   | |   "clock-gates" = <4c000000>
    | |   | |   "AAPL,phandle" = <45000000>
    | |   | |   "#address-cells" = <01000000>
    | |   | |   "IODeviceMemory" = (({"address"=8758263808,"length"=16384}))
    | |   | |   "IOReportLegendPublic" = Yes
    | |   | |   "spi-version" = <01000000>
    | |   | |   "IOInterruptControllers" = ("IOInterruptController00000012")
    | |   | |   "name" = <"spi2">
    | |   | |   "interrupt-parent" = <12000000>
    | |   | |   "compatible" = <"spi-1,samsung">
    | |   | |   "interrupts" = <d8000000>
    | |   | |   "dma-channels" = <18000000000000000000000080000000400000000000000000000000000000001900000000000000000000008000000040000000000000000000000000000000>
    | |   | |   "clock-ids" = <34010000>
    | |   | |   "function-spi_cs0" = <190000004f4950475100000001000100>
    | |   | |   "dma-parent" = <33000000>
    | |   | |   "device_type" = <"spi">
    | |   | |   "#size-cells" = <07000000>
    | |   | |   "reg" = <0080080a000000000040000000000000>
    | |   | |   "IOReportLegend" = ({"IOReportGroupName"="Interrupt Statistics (by index)","IOReportChannels"=((5291294645182005248,4295098369,"               First Level Interrupt Handler Count"),(5291294645182005249,4295098369,"              Second Level Interrupt Handler Count"),(5291294645182005250,4295098369,"        First Level Interrupt Handler Time (MATUs)"),(5291294645182005251,4295098369,"   Second Level Interrupt Handler CPU Time (MATUs)"),(5291294645182005252,4295098369,"Second Level Interrupt Handler System Time (MATUs)")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="spi2 0"})
    | |   | | }
    | |   | |
    | |   | +-o AppleSamsungSPIController  <class AppleSamsungSPIController, id 0x100000207, !registered, !matched, active, busy 0 (275 ms), retain 5>
    | |   |   | {
    | |   |   |   "IOProbeScore" = 0
    | |   |   |   "CFBundleIdentifier" = "com.apple.driver.AppleSamsungSPI"
    | |   |   |   "IOProviderClass" = "AppleARMIODevice"
    | |   |   |   "IOClass" = "AppleSamsungSPIController"
    | |   |   |   "IOMatchCategory" = "IODefaultMatchCategory"
    | |   |   |   "IOPlatformWakeAction" = 500
    | |   |   |   "IONameMatch" = "spi-1,samsung"
    | |   |   |   "dma-capable" = Yes
    | |   |   |   "IONameMatched" = "spi-1,samsung"
    | |   |   |   "IOPlatformSleepAction" = 500
    | |   |   |   "Stats" = {"intrTimeouts"=0,"xfer_hist_count"=8268,"pollTimeouts"=0,"disb_intrs_active"=0,"xfer"=(0,0,0,0,0,0,0,0,0,0,0,0,0,273,410,1575,3648,1917,308,7,78,0,0,0,26,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),"poll"=(483,214,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),"size"=(0,364,335,0,4133,0,3207,99,0,26,52,0,0,0,26,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),"autoPollCount"=699,"poll_hist_count"=699,"exec"=(0,130,8138),"disb_intrs_inactive"=0}
    | |   |   | }
    | |   |   |
    | |   |   +-o multi-touch@0  <class AppleARMSPIDevice, id 0x100000145, registered, matched, active, busy 0 (275 ms), retain 9>
    | |   |     | {
    | |   |     |   "IOInterruptSpecifiers" = (<a600000000000006>)
    | |   |     |   "hid-merge-personality" = <"C1F5D,2">
    | |   |     |   "function-clock_enable" = <140000004b4c4354080000006400000000800000>
    | |   |     |   "otp-address" = <ffffffff>
    | |   |     |   "hbpp-version" = <03010000>
    | |   |     |   "AAPL,phandle" = <46000000>
    | |   |     |   "sshb-inverse-filter-cal" = <68710100d73a0000b9c9ffff00400000cec2ffffc201000000000004>
    | |   |     |   "IOReportLegendPublic" = Yes
    | |   |     |   "poweroff-at-shutdown" = <>
    | |   |     |   "sshb-force-cal" = <8171010000002cffd400d4002cff00002cff2cffd400d400000400000000000000000000a520f119b3162f0fbd110069>
    | |   |     |   "shape-dynamic-accel-cal" = <727101004e57ff7f40240a1de5177d280a3aff551b41a60feaf1c4e34ce778faf117bc4a3f36a9f5cccb0fbd10b2d1d8c9fc733d9c2c39e788b6cd923299f3b4c4efe12b6d284bde14989886758ea6aa8ce3a32175210bd06394b284fc899998bad9511bc923b7d5e199298301808d9846d6541d452632e107ab5191ac92daaa6bcf49147b2787e84fb1429f579e83b6d4e39d148136d4fd9ce0c3c14ac7cbd8dbf1ec259c41d91d5d021df913efc9fe5f0f132eea53b84087317d24a9261e2b722d35434606c02e32001400baf900f5>
    | |   |     |   "reset-delays" = <00003264>
    | |   |     |   "function-enable_cs" = <190000004f4950475100000001010000>
    | |   |     |   "orb-offset-cal" = <807102000c00000066341482010000d0>
    | |   |     |   "name" = <"multi-touch">
    | |   |     |   "prox-calibration" = <7f7a000532001e00a2454c412ed021420000c84235a91e41b1a107420000164335a91e41b1a107420000164348e12543af9401c0f6389044ecb18f4471458f4485938e4490a0f041e79df541ac0b0442a3e3044200002042d1e2e6420fdc2842000048424686d7433dead643481c1046a43055436d71491e011d180e0a73ab459c9497437b0e9a450300000000000040>
    | |   |     |   "interrupt-parent" = <19000000>
    | |   |     |   "IOInterruptControllers" = ("IOInterruptController00000019")
    | |   |     |   "function-reset" = <190000004f495047a100000001000100>
    | |   |     |   "compatible" = <"hid-transport,k1">
    | |   |     |   "interrupts" = <a600000000000006>
    | |   |     |   "multi-touch-calibration" = <4b2803005203200003433346373032334631595348314e4b41372b00000030a94b280300000000000000000000000000bbb9b6b8b7b9b8b7babbbab90000008282828282828282828282820000006f6f6e6f6f6f6f6f6f6f6e6f0000003a3a3a3a3a3a3a3a3a3a3a3a0000003030303030303030303030300000003737373737373737373737370000008081818181818080808080808080807f817f7f8080808180000000008080818180808080808080807f7f7f7f817f7f8080808280000000008081818180808080808080807f807f7f817f8081818182800000000051484948494a4948474848500000004c454644454546444445444c000000685d5e5c5d5d5d5c5c5c5b6600000000000112ff000000008180807d78717b7e827f7c7b000000687e7e7e7e7e7e7e7e7e7e6900000083838484848483858483838281807f7f7b7a7877747100000000848484848484838584838281807f7f7d7c7b787774720000000000000000827e7e7c7872797e807d7a7b000000697d7d7d7d7d7d7d7d7d7d6a00000085848585858484858484828482817f817d7b7a7875720000000085858485848483858483818281807f7f7e7c7a78767200000000000000007f7e7f7c786f7a7e807e7a7b000000697e7e7e7e7e7e7e7e7e7e6a00000083838484848483868484848381807f807c7a787774710000000085848484848483878583838381807f7e7d7b7877747200000000000000000000580258025802000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b4b4b4b4b4b4b4b4b4b4b4b40000008282828282828282828282820000006d6d6d6d6d6d6d6d6d6d6d6d0000004343434343434343434343430000003c3c3c3c3c3c3c3c3c3c3c3c0000003737373737373737373737370000005a57595658595857555655580000004c4b4c494b4b4b4a4a4a494c0000005452524e5150515050504f520000006464640a0a0a14008b8b8b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e6e5e4000000000000ffffffffff07000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000>
    | |   |     |   "orb-force-cal" = <6871020018040001080902030a0b04050c0d06070e0f1011181912131a1b14151c1d16171e1f2021282922232a2b24252c2d26272e2f3031383932333a3b34353c3d36373e3f4041484942434a4b44454c4d46474e4f5051585952535a5b54555c5d56575e5f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0f749fdc3024808b8f73cfdc4024708b8f73cfdc4024708b8f73cfdc4024808b8f73cfdc4024808b7f73dfdc3024a08bcf0e2efb9efc1ef3ef63ef63ff63cf6bffcbffcbffcc2fc4103410341034103c209dd08c309c209391042103e103c10bb0493041500f01b15056d0af504a9073a00b4000200cfff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000690308d9b5d2f610e4b6cbf4d5af9cc4f2c5a1a2d2f7dac5caecfdf3f3f80403020d100f0600080a0a03fd010203010724fcd7ed125423ebeff30cddd1e8e6d7bdd9eff6f8f509000b29312e0f10343d331304191e1b09fc05070904e9d3fd2a0cefee225115ebd9e008f2f1ddc3dbe9020bfafdf91030352e0d11323e371406191e1b09ff0808080302f2f02a3808010d474109fff308000a05ebe8eb0c1403f8f40c1d1d1603091a201d0a040d0f0e040004030300f8f0e5fa07262e07080e404106060f0203e7030fd8d5d4020dd9d7e2090beef805160cfd0e16190afd0a0e0e07fdf5dce5fa1e60461204237f681dfe002d14f9f7e4e0c6def4e5e6daf9fcfa1516240c062b323213011b22200efeece6fc010a1c4c5e2308296e7a22fdfd182f04f8dfc8e4e7fcfcdeedeb0a281a1d040e33353312051f24220d0b00f0f9fc1415153328161412403a130cf20a051007dcdcdc0c0ce8dfdf0b190a00f6081a191405030e100f05ebdce2f903e3d6d7f909f1edddfa0b2019ebff0f0d02dafc11d3d0caff0ecfd0d9080ce2e6ef0c0af1f9000b08f3dfd2e4f9f2e5cadef8fa1cf0e2f20d5924f7f502390af3f6dfe8cbe1f2ded9c9edf9ecf9f50a05f50909140afce7d3dceef9e2c8d9eaf3e1e204ecf1ea0b3dffede1f122fae7d1badbdef0e2bfd2e0fb02eff7f4fe0e070b010b07f4eaed130ff1e6e61612f6f8ed170efd201b1504e3050c0f03cfd3d80c0addd4d6080df3ebea040c02fef9fefe030805f0e9ef0308dacdd6fc08d7c4c1f40b04f3d1f911201aed0414f1f6e30512dadde0060de0dee50109070e0d0c05faf6f0f800e3ccbed4efddccaec4e9f81feee1f3055620fffbf829fffdfee9f3dcf8ffe4e5d9f300101c1b10040d1104f9f8fef3d7d2dff3dec6d7dcf6f2ff28fcf707295b0df8ff032bfdf8f8def5f0f4f0d8e7f212211f11021b2d1e05f71e3011f1e22027feece0212306150c1d221332261718fa04f80f10eee8e40505ece7eb0d191b130711242a1f0e03131e2011edf0fb1512e3e7ea1115060ff81318444b1517182c3d161714f3f9ed020b162f33260f193c413215051a191909e7dacbe4f8dbc8abc9f1f617fbeefa217c64270822765e2c0efb0df6fe0419363f3013265660481d214f4f360f10210d03f702fee7eef000101e2b070732697a25062652681ff6f1e6ffff132a31240f20475038162651512e0b27493511f527412309ee243924280d202f2f55411723223f290908f2fcfc090f0f0a0311232418091a373b2810132e352a13fc09121b10e7e7ea020af1eedcf105271ae5ec002107d2e4fe0d1819110619383d2910275a64461c1f4c55401a01100c1107e4d7bbd4f0e2e4b3bae2f715dfc4e0f0facbb6e10c181912061a383e2c12285a684c1e25565d4218122b1708fff8f0cad4e6ebd7c5e4e5e9ddf018fbe3c6d6fff40e1b1d150918373f2c13225261461c275b65451825514a27071d39250bf7141f1111fe0a0b072f2b01f3e0102601fd>
    | |   |     |   "orb-gap-cal" = <6671020000000000000000000000000000000000091314141415151516161716171615151514141414161616161716171717171516151515151414131616161718170c16151618171716151515151414121617171617181715161615151514151716161515171616151514151515141514141400d43000004a190000d425e7381d40473e394141429b3c433cfd3a273ec03efd3d084013427d3d143d6d3def3eb93f863e31403042333ec83d663ee03f9040f63f62426343ee3eb03e3f3fbe404341384174424d43ee3fae3fc03f4b41a3410e43bd451246f6409e403f40ae4027431343074569483d42d841ab41dd4174449844a44682489b434c43984229432f430a473e48a6491645f2431942054301448444164733497646d0445c43714478451647a747994ae6430147584502469246d3461d46d1496a4580fe9b2f9d08aef8aefec7fdecfef006bf006704f3fc75fc5cfdc3f8adf529fe54ff05ffc8fbe9f898fc7cf8caf57cfdb4fee5fdbef806f8ccf8b5f527f20ffdc0fda8fa96f7b9f6e7f63cf647f20cf921fafff9abf636f6a6f262efc5ec78f7b2f845f9b1f79af2a0f2e3ef1be9f7f6e7f68bf73df694f051f045ec15e9adf238f349f45af3fcf219eb74e98ae5d4f025f233f7bff306f281f1efeaaae8edeccaf0dff2b6f135eefdeb3eeb3be42bf2f7ebb2f05aed7aec46ece9ec38e600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c6>
    | |   |     |   "power-sequence" = <66756e6374696f6e2d706f7765725f616e6100000a010066756e6374696f6e2d706f7765725f6c646f000000010066756e6374696f6e2d636c6f636b5f656e61626c65000a000300>
    | |   |     |   "function-power_ldo" = <4f0000004c756d701e020000>
    | |   |     |   "IOReportLegend" = ({"IOReportGroupName"="Interrupt Statistics (by index)","IOReportChannels"=((5291294645182005248,4295098369,"               First Level Interrupt Handler Count"),(5291294645182005249,4295098369,"              Second Level Interrupt Handler Count"),(5291294645182005250,4295098369,"        First Level Interrupt Handler Time (MATUs)"),(5291294645182005251,4295098369,"   Second Level Interrupt Handler CPU Time (MATUs)"),(5291294645182005252,4295098369,"Second Level Interrupt Handler System Time (MATUs)")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="multi-touch 0"})
    | |   |     |   "device_type" = <"multi-touch">
    | |   |     |   "reg" = <000000007c000000010301088813000010270000000000000000000000000000>
    | |   |     |   "function-power_ana" = <4b000000454c706402030000>
    | |   |     | }
    | |   |     |
    | |   |     +-o AppleHIDTransportDeviceSPI  <class AppleHIDTransportDeviceSPI, id 0x1000002dd, registered, matched, active, busy 0 (202 ms), retain 19>
    | |   |       | {
    | |   |       |   "IOClass" = "AppleHIDTransportDeviceSPI"
    | |   |       |   "CFBundleIdentifier" = "com.apple.driver.AppleHIDTransportSPI"
    | |   |       |   "IOProviderClass" = "AppleARMSPIDevice"
    | |   |       |   "ResetCount" = 0
    | |   |       |   "IOPowerManagement" = {"CapabilityFlags"=32768,"MaxPowerState"=1,"CurrentPowerState"=1}
    | |   |       |   "IOUserClientClass" = "AppleHIDTransportDeviceUserClient"
    | |   |       |   "IOProbeScore" = 0
    | |   |       |   "IONameMatch" = ("hid-transport,k1","hid-transport,spi")
    | |   |       |   "IOReportLegend" = ({"IOReportGroupName"="AppleHIDTransport","IOReportChannels"=((5928236041734671956,4312268801,"ResetCount"),(6292729686632123988,4312268801,"WatchdogResetCount")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="DeviceReset"},{"IOReportGroupName"="AppleHIDTransport","IOReportChannels"=((4848213368995137868,4312268801,"ChipBootFailure"),(5068592882596792652,4312268801,"FirmwareBootFailure"),(5927676386205909321,4312268801,"RecoveredBootFailures"),(4848213369230917632,4312268801,"ChipBootTimeouts"),(5068624721336074240,4312268801,"FirmwareBootTimeouts"),(5068624660976454656,4312268801,"FirmwareFailures")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="DeviceSPIFailureCounts"})
    | |   |       |   "IOMatchCategory" = "IODefaultMatchCategory"
    | |   |       |   "IOReportLegendPublic" = Yes
    | |   |       |   "IONameMatched" = "hid-transport,k1"
    | |   |       | }
    | |   |       |
    | |   |       +-o AppleHIDTransportBootloaderHBPP  <class AppleHIDTransportBootloaderHBPP, id 0x100000318, registered, matched, active, busy 0 (177 ms), retain 8>
    | |   |       | | {
    | |   |       | |   "Constructed Firmware Version" = "0x0736.mihu"
    | |   |       | |   "HID Bootloadable" = Yes
    | |   |       | |   "Supports Memory Dump" = Yes
    | |   |       | |   "shape-dynamic-accel-cal" = <727101004e57ff7f40240a1de5177d280a3aff551b41a60feaf1c4e34ce778faf117bc4a3f36a9f5cccb0fbd10b2d1d8c9fc733d9c2c39e788b6cd923299f3b4c4efe12b6d284bde14989886758ea6aa8ce3a32175210bd06394b284fc899998bad9511bc923b7d5e199298301808d9846d6541d452632e107ab5191ac92daaa6bcf49147b2787e84fb1429f579e83b6d4e39d148136d4fd9ce0c3c14ac7cbd8dbf1ec259c41d91d5d021df913efc9fe5f0f132eea53b84087317d24a9261e2b722d35434606c02e32001400baf900f5>
    | |   |       | |   "IOUserClientClass" = "AppleHIDTransportBootloaderUserClient"
    | |   |       | |   "orb-gap-cal" = <6671020000000000000000000000000000000000091314141415151516161716171615151514141414161616161716171717171516151515151414131616161718170c16151618171716151515151414121617171617181715161615151514151716161515171616151514151515141514141400d43000004a190000d425e7381d40473e394141429b3c433cfd3a273ec03efd3d084013427d3d143d6d3def3eb93f863e31403042333ec83d663ee03f9040f63f62426343ee3eb03e3f3fbe404341384174424d43ee3fae3fc03f4b41a3410e43bd451246f6409e403f40ae4027431343074569483d42d841ab41dd4174449844a44682489b434c43984229432f430a473e48a6491645f2431942054301448444164733497646d0445c43714478451647a747994ae6430147584502469246d3461d46d1496a4580fe9b2f9d08aef8aefec7fdecfef006bf006704f3fc75fc5cfdc3f8adf529fe54ff05ffc8fbe9f898fc7cf8caf57cfdb4fee5fdbef806f8ccf8b5f527f20ffdc0fda8fa96f7b9f6e7f63cf647f20cf921fafff9abf636f6a6f262efc5ec78f7b2f845f9b1f79af2a0f2e3ef1be9f7f6e7f68bf73df694f051f045ec15e9adf238f349f45af3fcf219eb74e98ae5d4f025f233f7bff306f281f1efeaaae8edeccaf0dff2b6f135eefdeb3eeb3be42bf2f7ebb2f05aed7aec46ece9ec38e600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c6>
    | |   |       | |   "mt-merge-personality" = "C1F5D,2"
    | |   |       | |   "shape-dynamic-accel-cal Version" = "built-in"
    | |   |       | |   "multi-touch-calibration" = <4b2803005203200003433346373032334631595348314e4b41372b00000030a94b280300000000000000000000000000bbb9b6b8b7b9b8b7babbbab90000008282828282828282828282820000006f6f6e6f6f6f6f6f6f6f6e6f0000003a3a3a3a3a3a3a3a3a3a3a3a0000003030303030303030303030300000003737373737373737373737370000008081818181818080808080808080807f817f7f8080808180000000008080818180808080808080807f7f7f7f817f7f8080808280000000008081818180808080808080807f807f7f817f8081818182800000000051484948494a4948474848500000004c454644454546444445444c000000685d5e5c5d5d5d5c5c5c5b6600000000000112ff000000008180807d78717b7e827f7c7b000000687e7e7e7e7e7e7e7e7e7e6900000083838484848483858483838281807f7f7b7a7877747100000000848484848484838584838281807f7f7d7c7b787774720000000000000000827e7e7c7872797e807d7a7b000000697d7d7d7d7d7d7d7d7d7d6a00000085848585858484858484828482817f817d7b7a7875720000000085858485848483858483818281807f7f7e7c7a78767200000000000000007f7e7f7c786f7a7e807e7a7b000000697e7e7e7e7e7e7e7e7e7e6a00000083838484848483868484848381807f807c7a787774710000000085848484848483878583838381807f7e7d7b7877747200000000000000000000580258025802000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b4b4b4b4b4b4b4b4b4b4b4b40000008282828282828282828282820000006d6d6d6d6d6d6d6d6d6d6d6d0000004343434343434343434343430000003c3c3c3c3c3c3c3c3c3c3c3c0000003737373737373737373737370000005a57595658595857555655580000004c4b4c494b4b4b4a4a4a494c0000005452524e5150515050504f520000006464640a0a0a14008b8b8b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e6e5e4000000000000ffffffffff07000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000>
    | |   |       | |   "PreconstructedBootloadPacketType" = "Z2"
    | |   |       | |   "Firmware Config Version" = "0x0016.conf"
    | |   |       | |   "multi-touch-calibration Version" = "built-in"
    | |   |       | |   "orb-gap-cal Version" = "built-in"
    | |   |       | |   "orb-force-cal Version" = "built-in"
    | |   |       | |   "orb-force-cal" = <6871020018040001080902030a0b04050c0d06070e0f1011181912131a1b14151c1d16171e1f2021282922232a2b24252c2d26272e2f3031383932333a3b34353c3d36373e3f4041484942434a4b44454c4d46474e4f5051585952535a5b54555c5d56575e5f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0f749fdc3024808b8f73cfdc4024708b8f73cfdc4024708b8f73cfdc4024808b8f73cfdc4024808b7f73dfdc3024a08bcf0e2efb9efc1ef3ef63ef63ff63cf6bffcbffcbffcc2fc4103410341034103c209dd08c309c209391042103e103c10bb0493041500f01b15056d0af504a9073a00b4000200cfff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000690308d9b5d2f610e4b6cbf4d5af9cc4f2c5a1a2d2f7dac5caecfdf3f3f80403020d100f0600080a0a03fd010203010724fcd7ed125423ebeff30cddd1e8e6d7bdd9eff6f8f509000b29312e0f10343d331304191e1b09fc05070904e9d3fd2a0cefee225115ebd9e008f2f1ddc3dbe9020bfafdf91030352e0d11323e371406191e1b09ff0808080302f2f02a3808010d474109fff308000a05ebe8eb0c1403f8f40c1d1d1603091a201d0a040d0f0e040004030300f8f0e5fa07262e07080e404106060f0203e7030fd8d5d4020dd9d7e2090beef805160cfd0e16190afd0a0e0e07fdf5dce5fa1e60461204237f681dfe002d14f9f7e4e0c6def4e5e6daf9fcfa1516240c062b323213011b22200efeece6fc010a1c4c5e2308296e7a22fdfd182f04f8dfc8e4e7fcfcdeedeb0a281a1d040e33353312051f24220d0b00f0f9fc1415153328161412403a130cf20a051007dcdcdc0c0ce8dfdf0b190a00f6081a191405030e100f05ebdce2f903e3d6d7f909f1edddfa0b2019ebff0f0d02dafc11d3d0caff0ecfd0d9080ce2e6ef0c0af1f9000b08f3dfd2e4f9f2e5cadef8fa1cf0e2f20d5924f7f502390af3f6dfe8cbe1f2ded9c9edf9ecf9f50a05f50909140afce7d3dceef9e2c8d9eaf3e1e204ecf1ea0b3dffede1f122fae7d1badbdef0e2bfd2e0fb02eff7f4fe0e070b010b07f4eaed130ff1e6e61612f6f8ed170efd201b1504e3050c0f03cfd3d80c0addd4d6080df3ebea040c02fef9fefe030805f0e9ef0308dacdd6fc08d7c4c1f40b04f3d1f911201aed0414f1f6e30512dadde0060de0dee50109070e0d0c05faf6f0f800e3ccbed4efddccaec4e9f81feee1f3055620fffbf829fffdfee9f3dcf8ffe4e5d9f300101c1b10040d1104f9f8fef3d7d2dff3dec6d7dcf6f2ff28fcf707295b0df8ff032bfdf8f8def5f0f4f0d8e7f212211f11021b2d1e05f71e3011f1e22027feece0212306150c1d221332261718fa04f80f10eee8e40505ece7eb0d191b130711242a1f0e03131e2011edf0fb1512e3e7ea1115060ff81318444b1517182c3d161714f3f9ed020b162f33260f193c413215051a191909e7dacbe4f8dbc8abc9f1f617fbeefa217c64270822765e2c0efb0df6fe0419363f3013265660481d214f4f360f10210d03f702fee7eef000101e2b070732697a25062652681ff6f1e6ffff132a31240f20475038162651512e0b27493511f527412309ee243924280d202f2f55411723223f290908f2fcfc090f0f0a0311232418091a373b2810132e352a13fc09121b10e7e7ea020af1eedcf105271ae5ec002107d2e4fe0d1819110619383d2910275a64461c1f4c55401a01100c1107e4d7bbd4f0e2e4b3bae2f715dfc4e0f0facbb6e10c181912061a383e2c12285a684c1e25565d4218122b1708fff8f0cad4e6ebd7c5e4e5e9ddf018fbe3c6d6fff40e1b1d150918373f2c13225261461c275b65451825514a27071d39250bf7141f1111fe0a0b072f2b01f3e0102601fd>
    | |   |       | | }
    | |   |       | |
    | |   |       | +-o AppleHIDTransportBootloaderUserClient  <class AppleHIDTransportBootloaderUserClient, id 0x100000a65, !registered, !matched, active, busy 0, retain 6>
    | |   |       |     {
    | |   |       |       "IOUserClientCreator" = "pid 844, UserEventAgent"
    | |   |       |     }
    | |   |       |
    | |   |       +-o AppleHIDTransportProtocolZ2  <class AppleHIDTransportProtocolZ2, id 0x100000513, registered, matched, active, busy 0 (32 ms), retain 8>
    | |   |         | {
    | |   |         |   "Max Packet Size" = 1208
    | |   |         |   "IOReportLegendPublic" = Yes
    | |   |         |   "Interface Version" = 1
    | |   |         |   "Platform ID" = 93
    | |   |         |   "IOReportLegend" = ({"IOReportGroupName"="AppleHIDTransport","IOReportChannels"=((5787775694918734418,4312268801,"ProtocolError"),(4774172255931028301,4312268801,"ChecksumMismatch"),(6292178827013474628,4312268801,"ReporterIDMismatch"),(6292178827011640644,4312268801,"CommandMismatch")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="ProtocolZ2FailureCounts"})
    | |   |         | }
    | |   |         |
    | |   |         +-o grape  <class AppleHIDTransportInterface, id 0x100000559, registered, matched, active, busy 0 (31 ms), retain 10>
    | |   |           | {
    | |   |           |   "bInterfaceNumber" = 0
    | |   |           |   "DefaultMultitouchProperties" = {"touch-size-id"=2,"ExtendedMaxDigitizerPressureValue"=600,"MinDigitizerPressureValue"=0,"AccurateMaxDigitizerPressureValue"=400}
    | |   |           |   "InterfaceName" = "grape"
    | |   |           |   "force-supported" = Yes
    | |   |           |   "HIDDescriptor" = <050d0904a101150026ff0075089690078102c0>
    | |   |           |   "InterfaceType" = "HID"
    | |   |           |   "IOUserClientClass" = "AppleHIDTransportInterfaceUserClient"
    | |   |           |   "IOReportLegendPublic" = Yes
    | |   |           |   "IOReportLegend" = ({"IOReportGroupName"="Multitouch","IOReportChannels"=((1,4311875585,"High_Level_Unknown_time"),(3,4311875585,"High_Level_Active_time"),(5,4311875585,"High_Level_Ready_time"),(7,4311875585,"High_Level_Rsv_time"),(9,4311875585,"High_Level_UILock_time"),(11,4311875585,"High_Level_FaceDet_time"),(13,4311875585,"High_Level_Rsv_time"),(15,4311875585,"High_Level_Rsv_time"),(17,4311875585,"High_Level_PreReady_time"),(19,4311875585,"High_Level_Anticip_time"),(21,4311875585,"High_Level_Diag_time"),(23,4311875585,"High_Level_totalTime")),"IOReportChannelInfo"={"IOReportChannelUnit"=72058113728970752},"IOReportSubGroupName"="Multitouch high level stats"},{"IOReportGroupName"="Multitouch","IOReportChannels"=((2,4311875585,"High_Level_Unknown_transitions"),(4,4311875585,"High_Level_Active_transitions"),(6,4311875585,"High_Level_Ready_transitions"),(8,4311875585,"High_Level_Rsv_transitions"),(10,4311875585,"High_Level_UILock_transitions"),(12,4311875585,"High_Level_FaceDet_transitions"),(14,4311875585,"High_Level_Rsv_transitions"),(16,4311875585,"High_Level_Rsv_transitions"),(18,4311875585,"High_Level_PreReady_transitions"),(20,4311875585,"High_Level_Anticip_transitions"),(22,4311875585,"High_Level_Diag_transitions"),(24,4311875585,"High_Level_totalTransitions")),"IOReportChannelInfo"={"IOReportChannelUnit"=0},"IOReportSubGroupName"="Multitouch high level stats"},{"IOReportGroupName"="Multitouch","IOReportChannels"=((0,47261548546,"High Level")),"IOReportChannelInfo"={"IOReportChannelUnit"=72058113728970752},"IOReportSubGroupName"="Multitouch high level stats"})
    | |   |           |   "LocationId" = 70
    | |   |           | }
    | |   |           |
    | |   |           +-o AppleHIDTransportHIDDevice  <class AppleHIDTransportHIDDevice, id 0x10000055a, registered, matched, active, busy 0 (31 ms), retain 7>
    | |   |             | {
    | |   |             |   "IOClass" = "AppleHIDTransportHIDDevice"
    | |   |             |   "Transport" = "SPI"
    | |   |             |   "Manufacturer" = "Apple"
    | |   |             |   "IOProviderClass" = "AppleHIDTransportInterface"
    | |   |             |   "MaxInputReportSize" = 1936
    | |   |             |   "DeviceUsagePairs" = ({"DeviceUsagePage"=13,"DeviceUsage"=4})
    | |   |             |   "IOProbeScore" = 0
    | |   |             |   "MaxOutputReportSize" = 0
    | |   |             |   "ReportDescriptor" = <050d0904a101150026ff0075089690078102c0>
    | |   |             |   "IOUserClientClass" = "IOHIDLibUserClient"
    | |   |             |   "IOPropertyMatch" = {"InterfaceType"="HID"}
    | |   |             |   "IOCFPlugInTypes" = {"7DDEECA8-A7B4-11DA-8A0E-0014519758EF"="IOHIDFamily.kext/PlugIns/IOHIDLib.plugin","40A57A4E-26A0-11D8-9295-000A958A2C78"="IOHIDFamily.kext/PlugIns/IOHIDLib.plugin","FA12FA38-6F1A-11D4-BA0C-0005028F18D5"="IOHIDFamily.kext/PlugIns/IOHIDLib.plugin"}
    | |   |             |   "IOMatchCategory" = "IODefaultMatchCategory"
    | |   |             |   "CFBundleIdentifier" = "com.apple.driver.AppleHIDTransport"
    | |   |             |   "PrimaryUsage" = 4
    | |   |             |   "LocationID" = 70
    | |   |             |   "Elements" = ({"ReportID"=0,"ElementCookie"=1,"CollectionType"=1,"Type"=513,"VariableSize"=0,"UsagePage"=13,"Usage"=4})
    | |   |             |   "ReportInterval" = 8000
    | |   |             |   "PrimaryUsagePage" = 13
    | |   |             |   "MaxFeatureReportSize" = 0
    | |   |             |   "InputReportElements" = ({"ReportID"=0,"ElementCookie"=2,"Size"=15488,"ReportCount"=1,"Type"=1,"VariableSize"=0,"UsagePage"=0,"ReportSize"=15488,"Usage"=0})
    | |   |             | }
    | |   |             |
    | |   |             +-o IOHIDInterface  <class IOHIDInterface, id 0x10000055d, registered, matched, active, busy 0 (31 ms), retain 7>
    | |   |               | {
    | |   |               |   "MaxOutputReportSize" = 0
    | |   |               |   "Manufacturer" = "Apple"
    | |   |               |   "ReportInterval" = 8000
    | |   |               |   "MaxFeatureReportSize" = 0
    | |   |               |   "ReportDescriptor" = <050d0904a101150026ff0075089690078102c0>
    | |   |               |   "PrimaryUsage" = 4
    | |   |               |   "PrimaryUsagePage" = 13
    | |   |               |   "DeviceUsagePairs" = ({"DeviceUsagePage"=13,"DeviceUsage"=4})
    | |   |               |   "Transport" = "SPI"
    | |   |               |   "LocationID" = 70
    | |   |               |   "MaxInputReportSize" = 1936
    | |   |               | }
    | |   |               |
    | |   |               +-o AppleMultitouchHIDService  <class AppleMultitouchHIDService, id 0x10000055e, !registered, !matched, active, busy 0 (23 ms), retain 8>
    | |   |                 | {
    | |   |                 |   "DefaultMultitouchProperties" = {"parser-type"=1,"parser-options"=16,"MT Built-In"=Yes,"HIDServiceSupport"=Yes,"IOCFPlugInTypes"={"0516B563-B15B-11DA-96EB-0014519758EF"="AppleMultitouchSPI.kext/PlugIns/MultitouchHID.plugin"}}
    | |   |                 |   "CFBundleIdentifier" = "com.apple.driver.AppleMultitouchDriver"
    | |   |                 |   "IOProviderClass" = "IOHIDInterface"
    | |   |                 |   "IOClass" = "AppleMultitouchHIDService"
    | |   |                 |   "Manufacturer" = "Apple"
    | |   |                 |   "IOPersonalityPublisher" = "com.apple.driver.AppleHIDTransportSPI"
    | |   |                 |   "IOProbeScore" = 1200
    | |   |                 |   "IOMatchCategory" = "IODefaultMatchCategory"
    | |   |                 |   "DeviceUsagePairs" = ({"DeviceUsagePage"=13,"DeviceUsage"=4})
    | |   |                 | }
    | |   |                 |
    | |   |                 +-o AppleMultitouchDevice  <class AppleMultitouchDevice, id 0x100000560, registered, matched, active, busy 0 (23 ms), retain 8>
    | |   |                   | {
    | |   |                   |   "parser-type" = 1
    | |   |                   |   "Transport" = "SPI"
    | |   |                   |   "Sensor Surface Height" = 10405
    | |   |                   |   "Sensor Columns" = 12
    | |   |                   |   "PowerControlSupported" = Yes
    | |   |                   |   "touch-size-id" = 2
    | |   |                   |   "Sensor Region Descriptor" = <0401001801000c0008180401000c00021c0c010008000b1c0301090300>
    | |   |                   |   "ExtendedMaxDigitizerPressureValue" = 600
    | |   |                   |   "Sensor Surface Descriptor" = <da160000a528000008ff12ffda15af27>
    | |   |                   |   "DeviceUsagePairs" = ({"DeviceUsagePage"=13,"DeviceUsage"=4})
    | |   |                   |   "Sensor Surface Width" = 5850
    | |   |                   |   "IOUserClientClass" = "AppleMultitouchDeviceUserClient"
    | |   |                   |   "HIDServiceSupport" = Yes
    | |   |                   |   "IOCFPlugInTypes" = {"0516B563-B15B-11DA-96EB-0014519758EF"="AppleMultitouchSPI.kext/PlugIns/MultitouchHID.plugin"}
    | |   |                   |   "MT Built-In" = Yes
    | |   |                   |   "MinDigitizerPressureValue" = 0
    | |   |                   |   "Endianness" = 1
    | |   |                   |   "Max Packet Size" = 1208
    | |   |                   |   "Sensor Region Param" = <00000c000003>
    | |   |                   |   "ForceSupported" = Yes
    | |   |                   |   "ResetCount" = 0
    | |   |                   |   "Multitouch ID" = 144115188075855942
    | |   |                   |   "LocationID" = 70
    | |   |                   |   "parser-options" = 16
    | |   |                   |   "Family ID" = 93
    | |   |                   |   "AccurateMaxDigitizerPressureValue" = 400
    | |   |                   |   "Sensor Rows" = 40
    | |   |                   |   "bcdVersion" = 1846
    | |   |                   |   "IOGeneralInterest" = "IOCommand is not serializable"
    | |   |                   |   "Critical Errors" = 0
    | |   |                   | }
    | |   |                   |
    | |   |                   +-o AppleMultitouchDeviceUserClient  <class AppleMultitouchDeviceUserClient, id 0x100000bd2, !registered, !matched, active, busy 0, retain 6>
    | |   |                       {
    | |   |                         "IOUserClientCreator" = "pid 1391, backboardd"
    | |   |                       }
    | |   |
