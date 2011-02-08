<cfsetting enablecfoutputonly="true">

<cfinclude template="stylesheets/doc_styles.cfm">

<cfoutput>

<h1>ColdFISH on Wheels v0.6</h1>
<p>
	A simple wrapper for Jason Delmore's <a href="http://coldfish.riaforge.org/">ColdFISH</a> syntax highlighter.
</p>
<p>
	ColdFISH outputs highlighted syntax for a string or a file containing
	<abbr title="ColdFusion Markup Language">CFML</abbr>, CFScript, <abbr title="Hypertext Markup Language">HTML</abbr>,
	<abbr title="Cascading Style Sheets">CSS</abbr>, JavaScript, <abbr title="Structured Query Language">SQL</abbr>,
	ActionScript, <abbr>MXML</abbr>, and comments for all of these languages.
</p>

<h2>Usage</h2>
<p>
	This plugin provides one method for use in your controllers and views: <tt>formattedCode()</tt>. This function
	accepts two main arguments: <tt>code</tt> or <tt>filePath</tt>.
</p>
<ul>
	<li>Pass a string to be formatted as the <tt>code</tt> argument.</li>
	<li>Pass the path to a file to be read, formatted, and returned as the <tt>filePath</tt> argument.</li>
</ul>
<p>If you pass both arguments, <tt>code</tt> takes precedence.</p>
<p>
	By default, your formatted code will be wrapped by the tag <tt>&lt;code class=&quot;block&quot;&gt;</tt>.
	You can configure this using the arguments listed below or by setting configurations outlined in the
	<em>Configurations</em> section below.
</p>

<h3>Arguments</h3>
<p>
	All arguments are marked as optional, but you need to pass in either <tt>code</tt> or <tt>filePath</tt>
	if you want for the function to do anything. :)
</p>
<table>
	<thead>
		<tr>
			<th>Argument</th>
			<th>Type</th>
			<th>Required</th>
			<th>Default</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><tt>code</tt></td>
			<td><tt>string</tt></td>
			<td><tt>false</tt></td>
			<td><tt>[empty string]</tt></td>
			<td>String of code to highlight.</td>
		</tr>
		<tr class="highlight">
			<td><tt>filePath</tt></td>
			<td><tt>string</tt></td>
			<td><tt>false</tt></td>
			<td><tt>[empty string]</tt></td>
			<td>Location of file containing code to highlight and return.</td>
		</tr>
		<tr>
			<td><tt>wrapperElement</tt></td>
			<td><tt>string</tt></td>
			<td><tt>false</tt></td>
			<td><tt>code</tt></td>
			<td><abbr title="Hypertext Markup Language">HTML</abbr> element to wrap the returned code with.</td>
		</tr>
		<tr class="highlight">
			<td><tt>wrapperClass</tt></td>
			<td><tt>string</tt></td>
			<td><tt>false</tt></td>
			<td><tt>block</tt></td>
			<td><abbr title="Hypertext Markup Language">HTML</abbr> class to wrap the returned element with.</td>
		</tr>
	</tbody>
</table>

<h2>Examples</h2>
<p>You can pass in some code as an argument:</p>
<pre>
&lt;cfoutput&gt;

&lt;p&gt;Here is my awesome code:&lt;/p&gt;
##formattedCode('
    &lt;cfoutput&gt;
        &lt;cfloop from=&quot;1&quot; to=&quot;10&quot; index=&quot;i&quot;&gt;
            &lt;div&gt;##i##&lt;/div&gt;
        &lt;/cfloop&gt;
    &lt;/cfoutput&gt;
')##

&lt;/cfoutput&gt;
</pre>
<p>Or if you want to read in a file on your server to parse and output, that works as well:</p>
<pre>
&lt;cfoutput&gt;
    ##formattedCode(filePath=ExpandPath(&quot;/path/to/your/code.cfm&quot;))##
&lt;/cfoutput&gt;
</pre>

<h2>Configuration</h2>
<p>
	After installing the ColdFISH on Wheels and reloading your Wheels application, this plugin will copy a config file for your
	use at <tt>config/coldfishconfig.xml</tt>.
</p>
<p>
	Use the <tt>&lt;settings&gt;</tt> tag near the top of the file to change settings for the parser.
</p>
<pre>
&lt;settings showLineNumbers=&quot;Yes&quot; showToolbar=&quot;Yes&quot; cachesize=&quot;100&quot; defaultparser=&quot;&quot;/&gt;
</pre>
<p>
	<strong>Note:</strong> Please ignore the config file included with the rest of this plugin's code. This plugin will
	ignore that file.
</p>
<p>
	<tt>wrapperElement</tt> and <tt>wrapperClass</tt> are configurable in your <tt>config/settings.cfm</tt> or
	<tt>events/onapplicationstart.cfm</tt> files.
</p>
<p>
	Here is a sample demonstrating how to set the plugin to always wrap the formatted code with
	<tt>&lt;pre&nbsp;class=&quot;formatted-code&quot;&gt;</tt> (unless overridden by specifying it directly
	in the function's arguments):
</p>
<pre>
&lt;cfset application.coldFishOnWheels.wrapperElement = &quot;pre&quot;&gt;
&lt;cfset application.coldFishOnWheels.wrapperClass = &quot;formatted-code&quot;&gt;
</pre>

<h2>Credits</h2>
<p>
	<a href="http://coldfish.riaforge.org/">ColdFISH</a> was created by
	<a href="http://www.cfinsider.com/">Jason Delmore</a>.
</p>
<p>
	ColdFISH on Wheels was ported to this plugin by
	<a href="http://www.clearcrystalmedia.com/pm/">Chris Peters</a>.</p>
<p>
	Jason deserves way more credit than Chris for this awesome project.
</p>

</cfoutput>

<cfsetting enablecfoutputonly="false">