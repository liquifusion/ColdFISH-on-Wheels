<!--- Parsing a mixed language file--->
<cfoutput>#application.coldfish.formatFile(expandPath("./test_multiple_languages.txt"))#</cfoutput>

<!--- Parsing an actionscript file--->
<cfoutput>#application.coldfish.formatFile(expandPath("./test_actionscript.txt"), "Actionscript")#</cfoutput>

<!--- Parsing an mxml file--->
<cfoutput>#application.coldfish.formatFile(expandPath("./test_mxml.txt"))#</cfoutput>

<!--- Parsing an mxml file that uses cf tags file--->
<cfoutput>#application.coldfish.formatFile(expandPath("./test_mxml_w_cftags.txt"))#</cfoutput>

<!--- Parsing an sql file --->
<cfoutput>#application.coldfish.formatFile(expandPath("./test_sql.txt"),"sql")#</cfoutput>

<!--- Take a look at settings
<cfdump var="#application.coldfish.getConfig().getInstanceData()#"/>
<cfdump var="#application.coldfish.getCache()#"/> --->