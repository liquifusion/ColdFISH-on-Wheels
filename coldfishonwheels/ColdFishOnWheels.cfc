<cfcomponent output="false" mixin="controller">

	<!--- Set default values in application scope --->
	<cfset $setDefaultColdFishValues()>
	<cfset $copyColdFishConfigFile(application.coldFishOnWheels.sourceConfigFile, application.coldFishOnWheels.targetConfigFile)>
	
	<!----------------------------------------------------->
	<!--- Public --->
	
	<cffunction name="init" hint="Defines supported Wheels versions.">
	
		<cfset this.version = "1.0,1.0.1,1.0.2,1.0.3,1.0.4,1.0.5,1.1,1.1.1">
		<cfreturn this>
	
	</cffunction>
	
	<!----------------------------------------------------->
	
	<cffunction name="formattedCode" returntype="string" hint="Formats a string or file containing CF code.">
		<cfargument name="code" type="string" default="" hint="String of code to highlight.">
		<cfargument name="filePath" type="string" default="" hint="Location of file containing code to highlight and return.">
		<cfargument name="wrapperElement" type="string" default="#application.coldFishOnWheels.wrapperElement#" hint="HTML element to wrap the returned code with.">
		<cfargument name="wrapperClass" type="string" default="#application.coldFishOnWheels.wrapperClass#" hint="HTML class to wrap the returned element with.">
		
		<cfset var loc = {}>
		
		<!--- ColdFISH setup --->
		<cfset loc.coldFish = CreateObject('component', 'com.jasondelmore.coldfish.coldfish').init(ExpandPath(application.coldFishOnWheels.targetConfigFile))>
		<cfset loc.coldfish.setStyle('CFCOMMENT', 'color:##676767; background-color: ##fff;')>
		
		<!--- Formatted string --->
		<cfif Len(arguments.code) gt 0>
			<cfset arguments.code = Trim(arguments.code)>
			<cfreturn $wrapColdFishCode(loc.coldFish.formatString(arguments.code))>
		<!--- Formatted file --->
		<cfelseif Len(arguments.filePath) gt 0>
			<cfreturn $wrapColdFishCode(loc.coldFish.formatFile(arguments.filePath))>
		</cfif>
	
	</cffunction>
	
	
	<!----------------------------------------------------->
	<!--- Private --->
	
	<cffunction name="$copyColdFishConfigFile" hint="If coldfishconfig.xml is not copied to the Wheels `config` folder, this method copies it there.">
		<cfargument name="sourceConfigFile" type="string" hint="Location of source config file.">
		<cfargument name="targetConfigFile" type="string" hint="Location of target config file.">
		
		<cfset var loc = {}>
		
		<cfset loc.sourceFile = ExpandPath(arguments.sourceConfigFile)>
		<cfset loc.destinationFile = ExpandPath(arguments.targetConfigFile)>
		
		<cfif not FileExists(loc.destinationFile)>
			<cffile
				action="copy"
				source="#loc.sourceFile#"
				destination="#loc.destinationFile#"
			>
		</cfif>
	
	</cffunction>
	
	<!----------------------------------------------------->
	
	<cffunction name="$wrapColdFishCode" returntype="string" hint="Returns the formatted string wrapped in an HTML block of your choosing.">
		<cfargument name="formattedCode" type="string" hint="Formatted code to wrap.">
		<cfargument name="wrapperElement" type="string" default="code" hint="HTML element to wrap the returned code with.">
		<cfargument name="wrapperClass" type="string" default="block" hint="HTML class to wrap the returned element with.">
		
		<cfset var loc = {}>
		
		<!--- If wrapping with an element --->
		<cfif Len(arguments.wrapperElement) gt 0>
			<!--- Prepend --->
			<cfset loc.prepend = '<#arguments.wrapperElement#'>
			<cfif Len(arguments.wrapperClass) gt 0>
				<cfset loc.prepend &= ' class="#arguments.wrapperClass#"'>
			</cfif>
			<cfset loc.prepend &= '>'>
			<!--- Append --->
			<cfset loc.append = '</#arguments.wrapperElement#>'>
		<!--- Not wrapping with an element --->
		<cfelse>
			<cfset loc.prepend = "">
			<cfset loc.append = "">
		</cfif>
		
		<cfreturn loc.prepend & arguments.formattedCode & loc.append>
		
	</cffunction>
	
	<!----------------------------------------------------->
	
	<cffunction name="$setDefaultColdFishValues" access="private" hint="Sets default values in `application` scope if they don't already exist.">
		
		<cfparam name="application.coldFishOnWheels.sourceConfigFile" type="string" default="./plugins/coldfishonwheels/com/jasondelmore/coldfish/coldfishconfig.xml">
		<cfparam name="application.coldFishOnWheels.targetConfigFile" type="string" default="./config/coldfishconfig.xml">
		<cfparam name="application.coldFishOnWheels.wrapperElement" type="string" default="code">
		<cfparam name="application.coldFishOnWheels.wrapperClass" type="string" default="block">
	
	</cffunction>
	
	<!----------------------------------------------------->

</cfcomponent>