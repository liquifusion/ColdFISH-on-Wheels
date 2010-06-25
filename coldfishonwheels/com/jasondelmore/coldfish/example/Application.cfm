<cfapplication name="coldfish18"/>
<cfif not isDefined("application.coldfish") or isdefined("url.init")>
	<cfset application.coldfish = createObject("component","coldfish.com.jasondelmore.coldfish.coldfish").init()/>
	<!--- Programmatically Changing the color codes for comments... you can do this via a config file change as well of course
	<cfset application.coldfish.setStyle("CFCOMMENT","color:black;background-color:red")/> --->
</cfif>