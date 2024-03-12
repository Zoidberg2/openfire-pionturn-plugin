<%@ page import="java.util.*" %>
<%@ page import="org.ifsoft.turn.openfire.*" %>
<%@ page import="org.jivesoftware.openfire.*" %>
<%@ page import="org.jivesoftware.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%

    boolean update = request.getParameter("update") != null;
    String errorMessage = null;

    // Get handle on the plugin
    PionTurn plugin = (PionTurn) XMPPServer.getInstance().getPluginManager().getPlugin("pionturn");

    if (update)
    {    
        String secret = request.getParameter("secret");     
        JiveGlobals.setProperty("pionturn.secret", secret);   

        String username = request.getParameter("username");     
        JiveGlobals.setProperty("pionturn.username", username); 		

        String password = request.getParameter("password");     
        JiveGlobals.setProperty("pionturn.password", password);   
        
        String port = request.getParameter("port");     
        JiveGlobals.setProperty("pionturn.port", port);   
        
        String min_port = request.getParameter("min_port");     
        JiveGlobals.setProperty("pionturn.min.port", min_port); 
        
        String max_port = request.getParameter("max_port");     
        JiveGlobals.setProperty("pionturn.max.port", max_port); 
        
        String ipaddr = request.getParameter("ipaddr");     
        JiveGlobals.setProperty("pionturn.ipaddr", ipaddr);   
        
        String enabled = request.getParameter("enabled");
        JiveGlobals.setProperty("pionturn.enabled", (enabled != null && enabled.equals("on")) ? "true": "false");        
    }

%>
<html>
<head>
   <title><fmt:message key="plugin.title.description" /></title>

   <meta name="pageID" content="pionturn-settings"/>
</head>
<body>
<% if (errorMessage != null) { %>
<div class="error">
    <%= errorMessage%>
</div>
<br/>
<% } %>

<div class="jive-table">
<form action="pionturn.jsp" method="post">
    <p>
        <table class="jive-table" cellpadding="0" cellspacing="0" border="0" width="100%">
            <thead> 
            <tr>
                <th colspan="2"><fmt:message key="config.page.settings.description"/></th>
            </tr>
            </thead>
            <tbody>  
            <tr>
                <td nowrap  colspan="2">
                    <input type="checkbox" name="enabled"<%= (JiveGlobals.getProperty("pionturn.enabled", "true").equals("true")) ? " checked" : "" %>>
                    <fmt:message key="config.page.configuration.enabled" />       
                </td>  
            </tr>
            <tr>
                <td align="left" width="150">
                    <fmt:message key="config.page.configuration.secret"/>
                </td>
                <td><input type="text" size="50" maxlength="100" name="secret" value="<%= JiveGlobals.getProperty("pionturn.secret", "") %>">
                </td>
            </tr> 			
            <tr>
                <td align="left" width="150">
                    <fmt:message key="config.page.configuration.username"/>
                </td>
                <td><input type="text" size="50" maxlength="100" name="username" value="<%= JiveGlobals.getProperty("pionturn.username", "admin") %>">
                </td>
            </tr>   
            <tr>
                <td align="left" width="150">
                    <fmt:message key="config.page.configuration.password"/>
                </td>
                <td><input type="password" size="50" maxlength="100" name="password" value="<%= JiveGlobals.getProperty("pionturn.password", "admin") %>">
                </td>
            </tr>              
            <tr>
                <td align="left" width="150">
                    <fmt:message key="config.page.configuration.ipaddr"/>
                </td>
                <td><input type="text" size="50" maxlength="100" name="ipaddr" required
                       value="<%= JiveGlobals.getProperty("pionturn.ipaddr", plugin.getIpAddress()) %>">
                </td>                               
            </tr>   
            <tr>
                <td align="left" width="150">
                    <fmt:message key="config.page.configuration.port"/>
                </td>
                <td><input type="text" size="50" maxlength="100" name="port" required
                       value="<%= JiveGlobals.getProperty("pionturn.port", plugin.getPort()) %>">
                </td>                               
            </tr> 	
            <tr>
                <td align="left" width="150">
                    <fmt:message key="config.page.configuration.min.port"/>
                </td>
                <td><input type="text" size="50" maxlength="100" name="min_port" required
                       value="<%= JiveGlobals.getProperty("pionturn.min.port", plugin.getMinPort()) %>">
                </td>                               
            </tr> 			
            <tr>
                <td align="left" width="150">
                    <fmt:message key="config.page.configuration.max.port"/>
                </td>
                <td><input type="text" size="50" maxlength="100" name="max_port" required
                       value="<%= JiveGlobals.getProperty("pionturn.max.port", plugin.getMaxPort()) %>">
                </td>                               
            </tr>             
            </tbody>
        </table>
    </p>
   <p>
        <table class="jive-table" cellpadding="0" cellspacing="0" border="0" width="100%">
            <thead> 
            <tr>
                <th colspan="2"><fmt:message key="config.page.configuration.save.title"/></th>
            </tr>
            </thead>
            <tbody>         
            <tr>
                <th colspan="2"><input type="submit" name="update" value="<fmt:message key="config.page.configuration.submit" />"><fmt:message key="config.page.configuration.restart.warning"/></th>
            </tr>       
            </tbody>            
        </table> 
    </p>
</form>
</div>
</body>
</html>
